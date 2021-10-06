import 'package:flutter/material.dart';
import 'package:women_safety_app/Screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Image(
                    image: const AssetImage('assets/images/police_logo.png'),
                    height: 250,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'SRILANKA POLICE DEPARTMENT',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black38,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  child: Column(
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                autovalidateMode: AutovalidateMode.always,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  icon: Icon(Icons.mail),
                                  hintText: 'Enter Email',
                                  labelText: 'Email',
                                ),
                                validator: (String? value) {
                                  return value!.contains('@')
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                obscureText: true,
                                autovalidateMode: AutovalidateMode.always,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  icon: Icon(Icons.lock),
                                  hintText: 'Enter Password',
                                  labelText: 'Email',
                                ),
                                validator: (String? value) {
                                  return value!.contains('@')
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                height: 50,
                                width: MediaQuery.of(context).size.width / 2,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 8.0,
                                        primary: Colors.white12,
                                        shadowColor: Colors.black,
                                        textStyle:
                                            const TextStyle(fontSize: 15),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()));
                                    },
                                    child: Text('Login'.toUpperCase())),
                              )
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
