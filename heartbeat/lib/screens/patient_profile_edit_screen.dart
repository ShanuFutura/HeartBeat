import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/ClickableContainer.dart';
import 'package:heartbeat/providers/db_helper.dart';
// import 'package:heartbeat/helpers/db_helper.dart';
import 'package:provider/provider.dart';

class PatientProfilEditScreen extends StatefulWidget {
  static const String routeName = 'patient Profile edit';
  @override
  State<PatientProfilEditScreen> createState() =>
      _PatientProfilEditScreenState();
}

class _PatientProfilEditScreenState extends State<PatientProfilEditScreen> {
  // const PatientProfilEditScreen({ Key? key }) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  var _name = '';

  var _age = '';

  String? _gender;

  var _email = '';

  var _phone = '';

  var _pword = '';

  void trySubmit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
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
        _formKey.currentState!.save();
        final done = Provider.of<DBHelper>(context, listen: false)
            .patientProfUpdate(_name, _age, _gender!, _email, _phone);
        if (true) {
          //DO THIS!!!!!
          Navigator.of(context).pop();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: 'patient name',
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
                  labelStyle: TextStyle(color: Colors.black, fontSize: 12),
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
                      initialValue: 'xx',
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
                      hint: Text(_gender == null ? 'gender' : _gender!),
                      // value: 'patient gender',
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
                      onChanged: (val) {
                        setState(() {
                          _gender = val.toString();
                          // _selectedGender = val;
                        });
                      })
                ],
              ),
              TextFormField(
                initialValue: 'pemail',
                style: const TextStyle(color: Colors.black),
                key: const ValueKey('em'),
                validator: (v) {
                  return v!.isEmpty ? 'email cannot be empty' : null;
                },
                onSaved: (vl) {
                  _email = vl!;
                },
                decoration: const InputDecoration(
                  hintText: 'patient email',
                  labelText: 'email',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 12),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              TextFormField(
                initialValue: 'pmob',
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                key: const ValueKey('mob'),
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'phone number cannot be empty';
                  } else if (v.length > 10 || v.length < 10) {
                    return 'Enter valid phone number';
                  }
                  return null;
                },
                onSaved: (vl) {
                  _phone = vl!;
                },
                decoration: const InputDecoration(
                  labelText: 'phone',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 12),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              // TextFormField(
              //   initialValue: 'ppw',
              //   obscureText: true,
              //   style: const TextStyle(color: Colors.black),
              //   key: const ValueKey('pw'),
              //   validator: (v) {
              //     if (v!.trim().isEmpty) {
              //       return 'password cannot be empty';
              //     } else if (v.trim().length < 8) {
              //       return 'password too short';
              //     }
              //     return null;
              //   },
              //   onSaved: (vl) {
              //     _pword = vl!;
              //   },
              //   decoration: const InputDecoration(
              //     labelText: 'password',
              //     labelStyle: TextStyle(color: Colors.black, fontSize: 12),
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.black),
              //     ),
              //     focusedBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.black),
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: trySubmit, child: Text('EDIT'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
