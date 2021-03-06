import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inicial_gewete/net/flutterfire.dart';
import 'package:flutter_inicial_gewete/ui/home_page.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key, Title? title}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passField = TextEditingController();
  final urlImage = 'assets.images/layout_set_logo-removebg-preview.png';
  Timer? _timer;

  bool shouldNavigate = false;
  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    EasyLoading.showSuccess('Use in initState');
    // EasyLoading.removeCallbacks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   child: Image.asset(urlImage),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: _emailField,
                  decoration: const InputDecoration(
                      // hintText: "@merkur-casino.com",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: _passField,
                  obscureText: true,
                  decoration: const InputDecoration(
                      // hintText: "password",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      labelText: "password",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: MaterialButton(
                  onPressed: () async => {
                    EasyLoading.show(status: 'loading...'),
                    shouldNavigate =
                        await singIn(_emailField.text, _passField.text),
                    if (shouldNavigate)
                      {
                        Navigator.pushReplacementNamed(context, 'home'),
                        EasyLoading.dismiss(),
                      }
                    else
                      {EasyLoading.showError('Failed with Error')}
                  },
                  child: const Text('Login'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: MaterialButton(
                  onPressed: () async => {
                    shouldNavigate =
                        await register(_emailField.text, _passField.text)
                  },
                  child: const Text('Register'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
            ],
          )),
    );
  }
}
