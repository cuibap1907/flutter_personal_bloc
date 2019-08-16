import 'package:flutter/material.dart';
import 'package:flutter_practice001/src/home.dart';
import 'package:flutter_practice001/src/login_bloc.dart';

void main() {
  runApp(MyLoginScreen());
}

class MyLoginScreen extends StatefulWidget {

  @override
  MainLoginView createState() => MainLoginView();
}

class MainLoginView extends State<MyLoginScreen> {
  LoginBloc _loginBloc = new LoginBloc();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          color: Colors.indigoAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: StreamBuilder<bool>(
                    stream: _loginBloc.observableUserName,
                    builder: (context, snapshot) {
                      return TextField(
                        onChanged: (text) {
                          _loginBloc.validateUserName(text);
                        },
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        decoration: InputDecoration(
                            labelText: "Input User Name",
                            errorText: snapshot.data == true
                                ? null
                                : "invalid user name.",
                            labelStyle:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: StreamBuilder<bool>(
                    stream: _loginBloc.observablePassword,
                    builder: (context, snapshot) {
                      return TextField(
                        onChanged: (text) {
                          _loginBloc.validatePassword(text);
                        },
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        obscureText: true,
                        decoration: InputDecoration(
                            errorText: snapshot.data == true
                                ? null
                                : "invalid password.",
                            labelText: "Input password",
                            labelStyle:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: onLoginBtnClicked,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onLoginBtnClicked() {
      bool isValidAll = _loginBloc.checkLoginValidate();
      
      if (isValidAll) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeState()));
      }
    }
}
