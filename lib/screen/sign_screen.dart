import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginIn extends StatefulWidget {
  @override
  _LoginInState createState() => _LoginInState();
}

class SignIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return new Scaffold(
      body: Stack(
        alignment: const Alignment(0.0, 0.6),
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/signup.jpeg",fit:BoxFit.cover,),
          //_showForm()
          Opacity(
            opacity: 0.7,
            child: new Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 100),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Light Chat ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 55.0,color: Colors.white),),
                        Text("Leads Lovely Life",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0,color: Colors.white),),
                      ],
                    ),
                  ),

                  Column(

                    children: <Widget>[

                      GestureDetector(
                        onTap:
                            (){Navigator.of(context).pushNamed('/login');}
                        ,
                        child:
                        Container(

                          decoration: new BoxDecoration(

                              color: Colors.white70.withOpacity(0.9),
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              boxShadow: [BoxShadow(
                                  color: Colors.grey,blurRadius: 5.0,offset: Offset(3.0,3.0)
                              )]
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.7,
                          alignment: Alignment.center,
                          child: Text("LOGIN",style: TextStyle(color:Colors.blueGrey,fontSize: 24,fontWeight: FontWeight.w700 ),),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: ()=>{
                          Navigator.of(context).pushReplacementNamed('/signup')
                        },
                        child: Container(

                          decoration: new BoxDecoration(
                              color: Color(0xffebe6e6),
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              boxShadow: [BoxShadow(
                                  color: Colors.grey,blurRadius: 5.0,offset: Offset(3.0,3.0)
                              )]
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.7,
                          alignment: Alignment.center,
                          child: Text("REGISTER HERE",style: TextStyle(color:Colors.blueGrey,fontSize: 24,fontWeight: FontWeight.w700 ),),

                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );;
  }
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
  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(

        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
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

        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          fillColor: Colors.white,
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
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
        }
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
                    child:  Text("SIGN IN",style: TextStyle(color: Colors.white,fontSize: 45.0,fontWeight: FontWeight.bold)),
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
           // onPressed: validateAndSubmit,
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

