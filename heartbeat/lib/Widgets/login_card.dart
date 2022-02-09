// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/ClickableContainer.dart';
import 'package:heartbeat/screens/patient_signup_page.dart';

class LoginCard extends StatelessWidget {
  // const LoginCard({ Key? key }) : super(key: key);
  final Function valuePasser;
  LoginCard(this.valuePasser);
  final _formKey = GlobalKey<FormState>();

  void trySubmit(BuildContext context) {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();

      valuePasser(_username, _password, context);
    }
  }

  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClickableContainer(
        radius: 20,
        heit: 500,
        widt: 300,
        padd: 20,
        kalar: const Color.fromRGBO(255, 255, 255, .4),
        kid: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                // style: const TextStyle(color: Colors.white),
                key: const ValueKey('nm'),
                validator: (v) {
                  return v!.isEmpty ? 'patient name cannot be empty' : null;
                },
                onSaved: (vl) {
                  _username = vl!;
                },
                decoration: const InputDecoration(
                  labelText: 'username',
                  // labelStyle: TextStyle(color: Colors.white, fontSize: 12),
                  enabledBorder: UnderlineInputBorder(
                      // borderSide: BorderSide(color: Colors.white),
                      ),
                  focusedBorder: UnderlineInputBorder(
                      // borderSide: BorderSide(color: Colors.white),
                      ),
                ),
              ),
              TextFormField(
                // style: const TextStyle(color: Colors.white),
                key: const ValueKey('pw'),
                validator: (v) {
                  return v!.isEmpty ? 'patient name cannot be empty' : null;
                },
                onSaved: (vl) {
                  _password = vl!;
                },
                decoration: const InputDecoration(
                  labelText: 'Password',
                  // labelStyle: TextStyle(color: Colors.white, fontSize: 12),
                  enabledBorder: UnderlineInputBorder(
                      // borderSide: BorderSide(color: Colors.white),
                      ),
                  focusedBorder: UnderlineInputBorder(
                      // borderSide: BorderSide(color: Colors.white),
                      ),
                ),
              ),
              ClickableContainer(
                radius: 20,
                heit: 50,
                widt: 90,
                kalar: const Color.fromRGBO(255, 255, 255, 1),
                tap: () {
                  trySubmit(context);
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                kid: const Center(
                    child: Text(
                  'Login',
                  // style: TextStyle(color: Colors.white),
                )),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(PatientSignupPage.routeName,
                      arguments: trySubmit);
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'New here? Signup instead.',
                    // style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
