import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // TODO(aleksicf): Hook up to AuthService (see Vorlesung 11)
  
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
              const TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: 'E-Mail'),
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(onPressed: () {}, child: const Text('Register', style: TextStyle(fontSize: 18),))
            ],
          ),
        ),
      ),
    );
  }
}
