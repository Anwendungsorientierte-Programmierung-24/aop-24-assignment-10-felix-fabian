import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RegisterPage')),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: 'E-Mail'),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(onPressed: () {}, child: Text('Register', style: TextStyle(fontSize: 18),))
            ],
          ),
        ),
      ),
    );
  }
}
