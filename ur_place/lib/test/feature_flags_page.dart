import 'package:flutter/material.dart';
import 'package:ur_place/test/feature_flag_manager.dart';

class FeatureFlagsPage extends StatefulWidget {
  const FeatureFlagsPage({super.key});

  @override
  State<FeatureFlagsPage> createState() => _FeatureFlagsPageState();
}

class _FeatureFlagsPageState extends State<FeatureFlagsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚠️ Debug Page - Feature Flags'),
      ),
      body: ListView(
        children: FeatureFlag.values.map((flag) {
          bool hasOverride = FFManager.overrides.containsKey(flag);
          return ListTile(
            title: Text(flag.toString().split('.').last),
            subtitle: Text('Default: ${FFManager.defaultFlags[flag]}, Override: ${FFManager.overrides[flag]}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (hasOverride)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        FFManager.clearFeatureOverride(flag);
                      });
                    },
                  ),
                Switch(
                  value: FFManager.isEnabled(flag),
                  onChanged: (bool value) {
                    setState(() {
                      FFManager.setFeatureOverride(flag, value);
                    });
                  },
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}