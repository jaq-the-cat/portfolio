import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Review extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final name = TextEditingController();
  final message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post a review")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  labelText:  "E-mail",
                ),
                validator: (text) =>
                  (text != null && EmailValidator.validate(text)) ? null : "Please enter a valid email",
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  labelText:  "Name",
                ),
                validator: (text) =>
                  (text != null && text.trim().isNotEmpty) ? null : "Please enter a valid name",
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: message,
                    maxLines: null,
                    minLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border:  OutlineInputBorder(),
                    ),
                    validator: (text) =>
                      (text != null && text.split(" ").length < 15)
                        ? null
                        : "Please enter a longer review message",
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Minimum length of 15 words",
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(height: 15),
              ElevatedButton.icon(
                icon: Icon(Icons.check),
                label: Text("Add review"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print("${email.text}\n${name.text}\n${message.text}");
                  }
              }),
            ]
          ),
        )
      )
    );
  }
}