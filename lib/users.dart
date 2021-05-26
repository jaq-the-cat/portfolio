import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

Widget signin() => UserAccountPage("Sign In", onValidate: (email, password) {

});

Widget signup() => UserAccountPage("Sign Up", onValidate: (email, password) {

});

class UserAccountPage extends StatefulWidget {

  final String whatdo;
  final void Function(String, String) onValidate;
  UserAccountPage(this.whatdo, {this.onValidate}) : super();

  @override
  _UserAccountPageState createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {

  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.whatdo),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child:  Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.whatdo,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                  ),
                  validator: (String value) =>
                    EmailValidator.validate(value) ? null : "Please enter a valid E-mail",
                ),
                SizedBox(height: 10),
                PasswordField(password),
                SizedBox(height: 15),
                ElevatedButton(
                  child: Text(widget.whatdo),
                  onPressed: () {
                    if (_formKey.currentState.validate()) widget.onValidate(email.text, password.text);
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

class PasswordField extends StatefulWidget {

  final TextEditingController controller;

  PasswordField(this.controller);

  @override
  PasswordFieldState createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {

  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: hidden,
      validator: (String value) =>
        (value != null && value.length > 7) ? null : "Password must have more than 7 characters",
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: IconButton(
          icon: Icon(hidden ? Icons.visibility : Icons.visibility_off),
          onPressed: () => setState(() => hidden ^= true),
        )
      )
    );
  }
}
