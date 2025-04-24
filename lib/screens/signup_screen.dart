import 'package:flutter/material.dart';



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  

  void _signUp() async {
    String? result = await _authService.signUp(
      _nameController.text,
      _emailController.text,
      _passwordController.text,
    );

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Registered!")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign Up Failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            ElevatedButton(onPressed: _signUp, child: Text("Sign Up")),
          ],
        ),
      ),
    );
  }
}
