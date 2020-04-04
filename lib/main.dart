import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/redux/auth/auth_action.dart';
import 'package:learnflutter/redux/auth/auth_middleware.dart';
import 'package:learnflutter/redux/middleware.dart';
import 'package:learnflutter/redux/reducer.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_middleware.dart';
import 'package:learnflutter/screen/user/reset_avatar.dart';
import 'package:learnflutter/screen/chat_screen.dart';
import 'package:learnflutter/screen/loading_screen.dart';
import 'package:learnflutter/screen/root_screen.dart';
import 'package:learnflutter/screen/login/sign_screen.dart';
import 'package:learnflutter/service/loginService.dart';
import 'package:learnflutter/service/userInfoService.dart';
import 'package:redux/redux.dart';
import 'model/user.dart';
import 'screen/main/home_screen.dart';

void main()  {
WidgetsFlutterBinding.ensureInitialized();
runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}






class _MyAppState extends State<MyApp> {
   Store<AppState> store;
    final _navigatorKey = GlobalKey<NavigatorState>();
   final userRepo = UserRepository(FirebaseAuth.instance, Firestore.instance);
   
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store=Store<AppState>(
        appReducer,
        initialState:AppState.init(),
        middleware: createStoreMiddleware(userRepo)
          ..addAll(createAuthMiddleware(userRepo, _navigatorKey))
          ..addAll(createUserMiddleware(userRepo))

    );
    new Future.delayed(Duration(seconds: 3),()  {
      print("Flutter即时通讯APP界面实现...");
      store.dispatch(VerifyAuth());

    });

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,

      child:  MaterialApp(
        title: 'Flutter Chat UI',
        debugShowCheckedModeBanner: false,
        navigatorKey: _navigatorKey,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
            primaryColor: Color(0xffa6e3e9),//Colors.red,
            accentColor:Color(0xfffcf8e8) //Color(0xfffcf8e8)

        ),
        home:LoadingScreen(),


        routes: {

          '/app': (BuildContext context)=> HomeScreen(),


          '/login':(BuildContext context)=>LoginIn(),

        },
      ),
    );
  }
}

//class CollectPersonalInfoPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return DefaultTextStyle(
//      style: Theme.of(context).textTheme.display1,
//      child: GestureDetector(
//        onTap: () {
//          // This moves from the personal info page to the credentials page,
//          // replacing this page with that one.
//          Navigator.of(context)
//              .pushReplacementNamed('signup/choose_credentials');
//        },
//        child: Container(
//          color: Colors.lightBlue,
//          alignment: Alignment.center,
//          child: Text('Collect Personal Info Page'),
//        ),
//      ),
//    );
//  }
//}
//
//class ChooseCredentialsPage extends StatelessWidget {
//  const ChooseCredentialsPage({
//    this.onSignupComplete,
//  });
//
//  final VoidCallback onSignupComplete;
//
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: onSignupComplete,
//      child: DefaultTextStyle(
//        style: Theme.of(context).textTheme.display1,
//        child: Container(
//          color: Colors.pinkAccent,
//          alignment: Alignment.center,
//          child: Text('Choose Credentials Page'),
//        ),
//      ),
//    );
//  }
//}
//class SignUpPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // SignUpPage builds its own Navigator which ends up being a nested
//    // Navigator in our app.
//    return Column(
//      children: <Widget>[
//        Text('aaa'),
//        Container(
//          height: 100.0,
//          child:  Navigator(
//            initialRoute: 'signup/personal_info',
//            onGenerateRoute: (RouteSettings settings) {
//              WidgetBuilder builder;
//              switch (settings.name) {
//                case 'signup/personal_info':
//                // Assume CollectPersonalInfoPage collects personal info and then
//                // navigates to 'signup/choose_credentials'.
//                  builder = (BuildContext _) => CollectPersonalInfoPage();
//                  break;
//                case 'signup/choose_credentials':
//                // Assume ChooseCredentialsPage collects new credentials and then
//                // invokes 'onSignupComplete()'.
//                  builder = (BuildContext _) => ChooseCredentialsPage(
//                    onSignupComplete: () {
//                      // Referencing Navigator.of(context) from here refers to the
//                      // top level Navigator because SignUpPage is above the
//                      // nested Navigator that it created. Therefore, this pop()
//                      // will pop the entire "sign up" journey and return to the
//                      // "/" route, AKA HomePage.
//                      Navigator.of(context).pop();
//                    },
//                  );
//                  break;
//                default:
//                  throw Exception('Invalid route: ${settings.name}');
//              }
//              return MaterialPageRoute(builder: builder, settings: settings);
//            },
//          ),
//        )
//      ],
//    );
//  }
//}
//




