import 'package:flutter/material.dart' hide Action;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/redux/auth/auth_middleware.dart';
import 'package:learnflutter/redux/middleware.dart';
import 'package:learnflutter/redux/reducer.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/a.dart';
import 'package:learnflutter/screen/chat_screen.dart';
import 'package:learnflutter/screen/loading_screen.dart';
import 'package:learnflutter/screen/root_screen.dart';
import 'package:learnflutter/screen/sign_screen.dart';
import 'package:learnflutter/service/loginService.dart';
import 'package:redux/redux.dart';
import 'model/user.dart';
import 'screen/home_screen.dart';

void main()  {
WidgetsFlutterBinding.ensureInitialized();
runApp(MyApp());
}





class MyApp extends StatelessWidget {
  final Store<AppState> store;
  static final _navigatorKey = GlobalKey<NavigatorState>();


  MyApp():store=Store<AppState>(
      appReducer,
      initialState:,
      middleware: createStoreMiddleware()..addAll(createAuthMiddleware(new Auth(), _navigatorKey))
  );

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
          '/root':(BuildContext context)=>RootPage(),
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




