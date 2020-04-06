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
import 'package:learnflutter/service/friendService.dart';
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
   final friendRepo=new FriendRepository(Firestore.instance);
  @override
  void initState() {
    // TODO: implement initState


    super.initState();
    store=Store<AppState>(
        appReducer,
        initialState:AppState.init(),
        middleware: createStoreMiddleware(friendRepo)
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






