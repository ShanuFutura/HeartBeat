import 'package:flutter/material.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:provider/provider.dart';
// import 'package:heartbeat/Widgets/ClickableContainer.dart';
// import 'package:heartbeat/helpers/db_helper.dart';
// import 'package:heartbeat/providers/db_helper.dart';

class DocProfileeditScreen extends StatefulWidget {
  static const String routeName = 'doc Profile edit';
  @override
  State<DocProfileeditScreen> createState() => _PatientProfilEditScreenState();
}

class _PatientProfilEditScreenState extends State<DocProfileeditScreen> {
  final _formKey = GlobalKey<FormState>();

  var _name = '';

  var _age = '';

  String? _gender;

  var _email = '';

  var _phone = '';

  var _pword = '';

  var _quali = '';

  void trySubmit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      Provider.of<DBHelper>(context, listen: false)
          .docProfileUpdate(_name, _email, _phone);
      // if (_gender == null) {
      //   showDialog(
      //       context: context,
      //       builder: (BuildContext context) {
      //         return const AlertDialog(
      //           title: Text('Something missing'),
      //           content: Text('please enter gender'),
      //         );
      //       });
      // } else {

      // }
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
      body: FutureBuilder(
          future: Provider.of<DBHelper>(context).getDocDetails(),
          builder: (context, snap) {
            print('HERE');
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(26.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        initialValue: (snap.data as dynamic)['doc_name'],
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
                      // DropdownButton(
                      //     // hint: const Text('gender'),
                      //     value: (snap.data as dynamic)['gender'],
                      //     items: const [
                      //       DropdownMenuItem(
                      //         child: Text('male'),
                      //         value: 'male',
                      //       ),
                      //       DropdownMenuItem(
                      //         child: Text('female'),
                      //         value: 'female',
                      //       )
                      //     ],
                      //     onChanged: (val) {
                      //       setState(() {
                      //         _gender = val.toString();
                      //       });
                      //     }),
                      TextFormField(
                        initialValue: (snap.data as dynamic)['email'],
                        style: const TextStyle(color: Colors.black),
                        key: const ValueKey('em'),
                        validator: (v) {
                          return v!.isEmpty ? 'email cannot be empty' : null;
                        },
                        onSaved: (vl) {
                          _email = vl!;
                        },
                        decoration: const InputDecoration(
                          hintText: 'email id',
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
                        initialValue: (snap.data as dynamic)['mobile'],
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.black),
                        key: const ValueKey('mob'),
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'phone number cannot be empty';
                          } else if (v.length > 11 || v.length < 10) {
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
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     Container(
                      //       width: 100,
                      //       child: TextFormField(
                      //         initialValue:
                      //             (snap.data as dynamic)['quaifiation'],
                      //         style: const TextStyle(color: Colors.black),
                      //         key: const ValueKey('ql'),
                      //         validator: (v) {
                      //           if (v!.trim().isEmpty) {
                      //             return 'Qualification cannot be empty';
                      //           } else
                      //             return null;
                      //         },
                      //         onSaved: (vl) {
                      //           _quali = vl!;
                      //         },
                      //         decoration: const InputDecoration(
                      //           labelText: 'Qualification',
                      //           labelStyle: TextStyle(
                      //               color: Colors.black, fontSize: 12),
                      //           enabledBorder: UnderlineInputBorder(
                      //             borderSide: BorderSide(color: Colors.black),
                      //           ),
                      //           focusedBorder: UnderlineInputBorder(
                      //             borderSide: BorderSide(color: Colors.black),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Container(
                      //       width: 90,
                      //       child: TextFormField(
                      //         initialValue:
                      //             (snap.data as dynamic)['experience'],
                      //         keyboardType: TextInputType.number,
                      //         style: const TextStyle(color: Colors.black),
                      //         key: const ValueKey('ex'),
                      //         validator: (v) {
                      //           if (v!.trim().isEmpty) {
                      //             return 'experience cannot be empty';
                      //           } else if (v.trim().length > 2 || v == '0') {
                      //             return 'enter a valid experience';
                      //           }

                      //           return null;
                      //         },
                      //         onSaved: (v) {
                      //           _age = v!;
                      //         },
                      //         decoration: const InputDecoration(
                      //           labelText: 'Eperience',
                      //           labelStyle: TextStyle(
                      //               color: Colors.black, fontSize: 12),
                      //           enabledBorder: UnderlineInputBorder(
                      //             borderSide: BorderSide(color: Colors.black),
                      //           ),
                      //           focusedBorder: UnderlineInputBorder(
                      //             borderSide: BorderSide(color: Colors.black),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: trySubmit, child: Text('EDIT'))
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
