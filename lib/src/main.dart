import 'package:demo/src/notifiers/notify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';
import 'pages/login.dart';
import 'utiles/my_ruotes.dart';
import 'widgets/themes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
         ChangeNotifierProvider<Notify>(
             create: (_) => Notify(),
         )
       ],
       child: MaterialApp(
        theme: MyTheme.lightTheme(context),
        initialRoute: MyRoute.homeRoute,
        routes: {
          MyRoute.loginRoute : (context) => LoginPage(),
          MyRoute.homeRoute : (context) => HomePage(context: context)
        },
      ),
    );
  }
}
