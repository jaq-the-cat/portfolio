import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool showpassword = false;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          child:  Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (String? value) =>
                    EmailValidator.validate(value) ? null : "Please enter a valid E-mail",
                ),
                TextFormField(
                  obscureText: !showpassword,
                  validator: (String? value) =>
                    (value != null && value.length > 7) ? null : "Password must have more than 7 characters",
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(showpassword ? Icons.remove_outlined : Icons.remove_red_eye_outlined),
                      onPressed: () {},
                      )
                    )
                ),
                ElevatedButton(
                  child: Text("Login"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                     // login and return to home page
                    }
                  },
                )
              ]
            )
          )
        )
      ),
    );
  }
}
