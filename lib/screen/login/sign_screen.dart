import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnflutter/redux/auth/auth_action.dart';
import 'package:learnflutter/service/loginService.dart';
class LoginIn extends StatefulWidget {
//  LoginIn({this.auth, this.loginCallback});
//
//   final BaseAuth auth;
//   final VoidCallback loginCallback;

  @override
  _LoginInState createState() => _LoginInState();
}



class _LoginInState extends State<LoginIn> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  bool _isLoginForm;
  bool _isLoading;
  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }
  Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        style: TextStyle(color: Colors.white),
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(

          focusedBorder: UnderlineInputBorder(
           borderSide: BorderSide(
               color:Colors.white
           )
          ),
          fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.white),
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.white,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        style: TextStyle(color: Colors.white),
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          fillColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color:Colors.white
                )
            ),
            focusColor: Colors.white,
            hintStyle: TextStyle(color: Colors.white),
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.white,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }
  Widget showSecondaryButton() {
    return new FlatButton(
        child: new Text(
            _isLoginForm ? 'Create an account' : 'Have an account? Sign in',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300,color: Colors.white70)),
        onPressed: toggleFormMode);
  }
  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }
  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          final loginAction=Login(email:_email,password:_password);
          StoreProvider.of(context).dispatch(loginAction);
//          userId = await widget.auth.signIn(_email, _password);
//          print('Signed in: $userId');
        } else {
          final signUpAction=Signup(email:_email,password:_password);
          StoreProvider.of(context).dispatch(signUpAction);
//          userId = await widget.auth.signUp(_email, _password);
////          //widget.auth.sendEmailVerification();
////          //_showVerifyEmailSentDialog();
////          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

//        if (userId.length > 0 && userId != null && _isLoginForm) {
//          //Navigator.of(context).pushReplacementNamed('/app');
//          widget.loginCallback();
//        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }
  Widget _showForm() {
    return  Center(
      child: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(16.0),
            child: new Form(
              key: _formKey,
              child: new Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //shrinkWrap: true,
                children: <Widget>[
                  Center(
                    child:  Text(_isLoginForm ? 'SIGN IN' : 'REGISTER HERE',style: TextStyle(color: Colors.white,fontSize: 45.0,fontWeight: FontWeight.bold)),
                  ),
                  showEmailInput(),
                  showPasswordInput(),
                  showPrimaryButton(),
                  showSecondaryButton(),
                  showErrorMessage(),
                ],
              ),
            )),
      )
    );
  }

  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.blue,

            child: new Text(_isLoginForm ? 'Login' : 'Create account',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: validateAndSubmit,
          ),
        ));
  }
  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        alignment: const Alignment(0.0, 0.6),
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/signup.jpeg",fit:BoxFit.cover,),
          _showForm()

        ],
      ),
    );
  }
}

