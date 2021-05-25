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

  bool showpassword = false;

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
          padding: EdgeInsets.all(15),
          child:  Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: email,
                  validator: (String value) =>
                    EmailValidator.validate(value) ? null : "Please enter a valid E-mail",
                ),
                TextFormField(
                  controller: password,
                  obscureText: !showpassword,
                  validator: (String value) =>
                    (value != null && value.length > 7) ? null : "Password must have more than 7 characters",
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(showpassword ? Icons.remove_outlined : Icons.remove_red_eye_outlined),
                      onPressed: () => showpassword ^= true,
                      )
                    )
                ),
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
