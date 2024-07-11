// ignore_for_file: prefer_final_fields

enum FeatureFlag {
  // Description: Start program with debug page to directly navigate to pages.
  // Dependencies: none.
  // Default: false.
  enableDebugPage,

  // Description: Initialize Firebase connection in main.
  // Dependencies: none.
  // Default: true.
  enableFirebase,

  // Description: Placeholder.
  // Dependencies: <dependencies>.
  // Default: <bool>.
  enableFeatureName
}

class FFManager {
  // Default feature states
  static const Map<FeatureFlag, bool> _defaultStates = {
    FeatureFlag.enableDebugPage: true,
    FeatureFlag.enableFeatureName: true,
    FeatureFlag.enableFirebase: true,
  };

  // Runtime overrides
  static Map<FeatureFlag, bool?> _featureOverrides = {};

  // Get canonical state at runtime.
  static bool isEnabled(FeatureFlag flag) {
    return _featureOverrides[flag] ?? _defaultStates[flag] ?? false;
  }

  // Override a feature's state at runtime.
  static void setFeatureOverride(FeatureFlag flag, bool isEnabled) {
    _featureOverrides[flag] = isEnabled;
  }

  // Reset a feature's state to its default state.
  static void clearFeatureOverride(FeatureFlag flag) {
    _featureOverrides.remove(flag);
  }

  // Return a list of all features and their configuration.
  static List<String> getAllFeatureStates() {
    List<String> ret_val = [];
    for (FeatureFlag flag in FeatureFlag.values) {
      String feature = 'Feature "${flag.toString().split('.').last}": ${isEnabled(flag)} (Override: ${_featureOverrides[flag]}, Default: ${_defaultStates[flag]})';
      ret_val.add(feature);
    }
    return ret_val;
  }

  // Reset all features' runtime overrides.
  static void clearAllFeatureOverrides() {
    _featureOverrides.clear();
  }

  static Map<FeatureFlag, bool> get defaultFlags => _defaultStates;
  static Map<FeatureFlag, bool?> get overrides => _featureOverrides;
}