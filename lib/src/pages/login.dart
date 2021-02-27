import 'package:demo/src/res/colors.dart';
import 'package:demo/src/res/constaints.dart';
import 'package:demo/src/utiles/my_ruotes.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {

  final _formKey= GlobalKey<FormState>();
 // final userNameEdControl= TextEditingController();
  var userName,password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow1,
      body: SafeArea(
        child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 50,),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 24),child: Icon(Icons.keyboard_arrow_left_sharp, color: Colors.black,size: 50)),
                        Padding(padding: EdgeInsets.only(left: 100),child: Text(AppConstants.login,style: TextStyle( fontSize: 28,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),))
                      ],
                    ),
                    SizedBox(height: 80,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                              autofocus: true,
                              validator: (value){
                                if (value.isEmpty) {
                                  return AppConstants.nameHint;
                                }
                                return null;
                              },
                              onChanged: (text){
                                userName= text;
                              },
                              decoration: InputDecoration(
                                hintText: AppConstants.nameHint,
                                labelText: AppConstants.labelName,
                                labelStyle: TextStyle(color: Colors.black),
                                hintStyle: TextStyle(fontSize: 12),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  )
                              ),
                            ),
                            SizedBox(height: 14,),
                            TextFormField(
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                              validator: (value){
                                if (value.isEmpty) {
                                  return AppConstants.passHint;
                                }
                                return null;
                              },
                              onChanged: (text){
                                password= text;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: AppConstants.passHint,
                                labelText: AppConstants.labelPass,
                                  labelStyle: TextStyle(color: Colors.black),
                                  hintStyle: TextStyle(fontSize: 12),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                    InkWell(
                      onTap: (){
                            if(_formKey.currentState.validate()){
                              _navigateToHome(context);
                            }
                      },
                      child: Container(
                        height: 60,
                        width: 180,
                        padding: EdgeInsets.only(left: 40,right: 40,bottom: 10,top: 10),
                        decoration: BoxDecoration(
                            color: AppColors.eerie_Black,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                           child: Center(child: Text(AppConstants.login,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),))
                      ),
                    )
                  ],
                ),
              )
            ],
        ),
      ),
    );
  }

    _navigateToHome(BuildContext context) async {
        await Navigator.pushNamed(context, MyRoute.homeRoute);
    }
}
