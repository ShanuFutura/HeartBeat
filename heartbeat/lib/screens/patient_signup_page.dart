import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/ClickableContainer.dart';
import 'package:heartbeat/providers/db_helper.dart';
// import 'package:heartbeat/helpers/db_helper.dart';
import 'package:provider/provider.dart';

class PatientSignupPage extends StatefulWidget {
  static const String routeName = 'signup';

  // final Function? submit;
  // PatientSignupPage({
  //   this.submit = null,
  // });
  @override
  State<PatientSignupPage> createState() => _LoginCardState();
}

final _formKey = GlobalKey<FormState>();
// String? _selectedGender;

String _phone = '';
String _name = '';
String? _gender;
String _age = '';
String _uname = '';
String _pword = '';
String _email = '';
final controller = TextEditingController();

class _LoginCardState extends State<PatientSignupPage> {
  @override
  Widget build(BuildContext context) {
    // final Function arg = ModalRoute.of(context)!.settings.arguments as Function ;

    void trySubmit() {
      final isValid = _formKey.currentState!.validate();
      if (isValid) {
        _formKey.currentState!.save();
        if (_gender == null) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text('Something missing'),
                  content: Text('please enter gender'),
                );
              });
        } else {
          Provider.of<DBHelper>(context, listen: false).signupCall(
              _name, _age, _gender!, _email, _phone, _uname, _pword, context);
          print(_uname);
          // print(_age);
          // print(_gender);
          // print(_email);
          // print(_phone);
          // print(_pword);
          // print(_name);
        }

        // widget.submit!(
        //   _uname,
        //   _email,
        //   _pword,
        // );
      }
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/heart.png'), fit: BoxFit.cover),
        ),
        child: Center(
          child: ClickableContainer(
            radius: 20,
            heit: 700,
            widt: 350,
            kalar: const Color.fromRGBO(255, 255, 255, .7),
            kid: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      key: const ValueKey('nm'),
                      validator: (v) {
                        if (v!.trim().isEmpty) {
                          return 'patient name cannot be empty';
                        } else if (v.trim().length < 3) {
                          return 'enter a valid name';
                        }
                      },
                      onSaved: (vl) {
                        _name = vl!;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 12),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      key: const ValueKey('unm'),
                      validator: (v) {
                        if (v!.trim().isEmpty) {
                          return 'patient name cannot be empty';
                        } else if (v.trim().length < 3) {
                          return 'enter a valid user name';
                        }
                      },
                      onSaved: (vl) {
                        _uname = vl!;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 12),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 90,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black),
                            key: const ValueKey('ag'),
                            validator: (v) {
                              if (v!.trim().isEmpty) {
                                return 'age cannot be empty';
                              } else if (v.trim().length > 2 || v == '0') {
                                return 'enter a valid age';
                              }

                              return null;
                            },
                            onSaved: (v) {
                              _age = v!;
                            },
                            decoration: const InputDecoration(
                              labelText: 'age',
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        DropdownButton(
                            // style: TextStyle(color: Colors.black),
                            // focusColor: Colors.black,
                            hint: const Text('gender'),
                            value: _gender,
                            items: const [
                              DropdownMenuItem(
                                child: Text('male'),
                                value: 'male',
                              ),
                              DropdownMenuItem(
                                child: Text('female'),
                                value: 'female',
                              )
                            ],
                            onChanged: (String? val) {
                              setState(() {
                                _gender = val;
                                // _selectedGender = val;
                              });
                            })
                      ],
                    ),
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      key: const ValueKey('em'),
                      validator: (v) {
                        return v!.isEmpty ? 'email cannot be empty' : null;
                      },
                      onSaved: (vl) {
                        _email = vl!;
                      },
                      decoration: const InputDecoration(
                        labelText: 'email',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 12),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.black),
                      key: const ValueKey('mob'),
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'phone number cannot be empty';
                        } else if (v.length != 10) {
                          return 'Enter valid phone number';
                        }
                        return null;
                      },
                      onSaved: (vl) {
                        _phone = vl!;
                      },
                      decoration: const InputDecoration(
                        labelText: 'phone',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 12),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      style: const TextStyle(color: Colors.black),
                      key: const ValueKey('pw'),
                      validator: (v) {
                        if (v!.trim().isEmpty) {
                          return 'password cannot be empty';
                        } else if (v.trim().length < 8) {
                          return 'password too short';
                        }
                        return null;
                      },
                      onSaved: (vl) {
                        _pword = vl!;
                      },
                      decoration: const InputDecoration(
                        labelText: 'password',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 12),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClickableContainer(
                            radius: 20,
                            heit: 50,
                            widt: 90,
                            kalar: const Color.fromRGBO(255, 255, 255, 1),
                            tap: () {
                              trySubmit();
                            },
                            kid: const Center(child: Text('Signup'))),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     trySubmit();
                        //   },
                        //   child: Text('SignUp'),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
