import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_signup_with_nodeapi/home.dart';
import 'package:login_signup_with_nodeapi/services/authenticate.dart';
import 'package:login_signup_with_nodeapi/signup_page.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var name,password,token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/mobile_wallpaper3_by_maria_shanina@2x.png'),
              fit: BoxFit.values[2],
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100,left: 30),
                child: Text("Hello Sun!",style: TextStyle(color: Colors.white,fontSize: 40,decoration: TextDecoration.underline,fontWeight: FontWeight.bold ),),

              ),
              Padding(
                padding: const EdgeInsets.only(top: 0,left: 30),
                child: Text("Keep your face to the sun and you will never see the shadows",style: TextStyle(color: Colors.white,fontSize: 10 ),),

              ),
              SizedBox(height: 360,),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: TextField(
                  decoration: InputDecoration(hintText: "Email",hintStyle: TextStyle(color: Colors.white),icon: Icon(Icons.email,color: Colors.white,)),
                  onChanged: (val){
                    name = val;
                  },
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password",hintStyle: TextStyle(color: Colors.white),icon: Icon(Icons.lock,color: Colors.white,)),
                  onChanged: (val){
                    password = val;
                  },
                ),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("Forgot Password?",style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),

              SizedBox(height: 25,),

              InkWell(
               //  onTap: ()async{
               // var data =await   AuthService().login(name, password);
               //      var jsonDAta= jsonDecode(data);
               //      if(jsonDAta["sucess"]){
               //        token = jsonDAta["token"];
               //        Fluttertoast.showToast(msg: 'Success',
               //            toastLength: Toast.LENGTH_SHORT,
               //            gravity: ToastGravity.BOTTOM,
               //            backgroundColor: Colors.green,
               //            textColor: Colors.white,
               //            fontSize: 16
               //
               //        );
               //      }
               //
               //  },
                onTap: (){
                  AuthService().login(name, password).then((val){
                    if(val.data["sucess"]){
                      token = val.data["token"];
                      Fluttertoast.showToast(msg: 'Success',
                                     toastLength: Toast.LENGTH_SHORT,
                                     gravity: ToastGravity.BOTTOM,
                                     backgroundColor: Colors.green,
                                     textColor: Colors.white,
                                     fontSize: 16

                                 );
                    }
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                  });
                },
                child: Center(
                  child: Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width/1.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),

                    ),
                    child: Center(child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),
              SizedBox(height: 60,),

              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Row(
                  children: [
                    Text("Don't have an account?",style: TextStyle(color: Colors.white),),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
                      },
                        child: Text(" sign up",style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold),)),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
