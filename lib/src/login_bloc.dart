import 'package:rxdart/rxdart.dart';

class LoginBloc {
  String userName;
  String password;

  bool isPassValid;
  bool isUserValid;

  BehaviorSubject<bool> _userNameBehaviorsubject;
  BehaviorSubject<bool> _passwordBehaviorsubject;
  BehaviorSubject<bool> _logincheckBehaviorsubject;

  Observable<bool> get observableUserName => _userNameBehaviorsubject.stream;
  Observable<bool> get observablePassword => _passwordBehaviorsubject.stream;
  Observable<bool> get observableLogincheck => _logincheckBehaviorsubject.stream;

  LoginBloc({this.userName, this.password})
  {
    _userNameBehaviorsubject = BehaviorSubject<bool>.seeded(isUserValid);
    _passwordBehaviorsubject = BehaviorSubject<bool>.seeded(isPassValid);
  }

  void validateUserName(String _username)
  {
    this.userName = _username;
    isUserValid = false;
    if(_username.length > 6)
    {
      isUserValid = true;
    }

    _userNameBehaviorsubject.sink.add(isUserValid);
  }

  void validatePassword(String _password)
  {
    this.password = _password;
    isPassValid = false;
    if(_password.length >= 6)
    {
      isPassValid = true;
    }

    _passwordBehaviorsubject.sink.add(isPassValid);
  }

  void checkLoginValidate()
  {
    _logincheckBehaviorsubject.sink.add(isUserValid && isPassValid);
  }

  void dispose()
  {
    _userNameBehaviorsubject.close();
    _passwordBehaviorsubject.close();
    _logincheckBehaviorsubject.close();
  }

  
}