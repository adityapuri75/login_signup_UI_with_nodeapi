import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_signup_with_nodeapi/login_page.dart';
import 'package:login_signup_with_nodeapi/services/authenticate.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var name,password,token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/mobile_wallpaper2_by_maria_shanina@2x.png'),
                fit: BoxFit.fill,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100,left: 30),
                child: Text("Hello Moon!",style: TextStyle(color: Colors.white,fontSize: 40,decoration: TextDecoration.underline,fontWeight: FontWeight.bold ),),

              ),
              Padding(
                padding: const EdgeInsets.only(top: 0,left: 30),
                child: Text("The Moon is magic for the soul and light for the senses.",style: TextStyle(color: Colors.white,fontSize: 10 ),),

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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(right: 30),
              //       child: Text("Forgot Password?",style: TextStyle(color: Colors.white),),
              //     ),
              //   ],
              // ),

              SizedBox(height: 40,),

              InkWell(
                onTap: (){

                },
                child: InkWell(
                  onTap: (){
                      AuthService().signup(name, password).then((val){
                        if(val.data["msg"]=="Successfully saved"){
                          Fluttertoast.showToast(msg: 'Success',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16,

                          );
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                        }else{
                          Fluttertoast.showToast(msg: 'Email Already Exist',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16

                          );
                        }
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
                      child: Center(child: Text("Sign Up",style: TextStyle(fontSize: 20,color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60,),

              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Row(
                  children: [
                    Text("Already have an account?",style: TextStyle(color: Colors.white),),
                    InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                        },
                        child: Text(" sign In",style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold),)),
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
