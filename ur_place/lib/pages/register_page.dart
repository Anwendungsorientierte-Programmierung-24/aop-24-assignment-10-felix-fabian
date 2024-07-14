import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _createAccount() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Account created: ${userCredential.user?.email}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create account: $e')),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RegisterPage')),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                autofocus: true,
                decoration: const InputDecoration(hintText: 'E-Mail'),
                controller: _emailController,
              ),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Password'),
                controller: _passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(onPressed: () {
                _createAccount();
              }, child: const Text('Register', style: TextStyle(fontSize: 18),))
            ],
          ),
        ),
      ),
    );
  }
}
