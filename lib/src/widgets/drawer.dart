import 'dart:ui';
import 'package:demo/src/res/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:demo/src/res/constaints.dart';


class MyDrawer{

   static Drawer mDrawer(BuildContext context) =>  Drawer(
     child: ListView(
       children: [
         DrawerHeader(
             padding: EdgeInsets.zero,
             child: UserAccountsDrawerHeader(
             accountName: Text(AppConstants.name,style: TextStyle(color: Colors.white),),
             accountEmail: Text( AppConstants.mailId,style: TextStyle(color: Colors.white),),
             currentAccountPicture: CircleAvatar(child: Image.asset(Assets.logo),),
             ),
             decoration: BoxDecoration(color: Colors.black,backgroundBlendMode: BlendMode.modulate),
             ),
         ListTile(
             leading: Icon(Icons.home, color: Colors.black,),
             title: Text(AppConstants.home),
             trailing: Icon(Icons.chevron_right,color: Colors.black,),
         ),
         ListTile(
             leading: Icon(Icons.help, color: Colors.black,),
             title: Text(AppConstants.help),
             trailing: Icon(Icons.chevron_right,color: Colors.black,),
         ),
         ListTile(
             leading: Icon(Icons.star_rate_rounded, color: Colors.black,),
             title: Text(AppConstants.rateUs),
             trailing: Icon(Icons.chevron_right,color: Colors.black,),
             )
         ],
       ),
   );

}