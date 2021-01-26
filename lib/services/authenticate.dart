

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup_with_nodeapi/secret/secret.dart';


class AuthService{


  Dio dio = new Dio();

  login(name, password) async {

    try{
      // var response = await http.post("https://login-signup-api-aditya.herokuapp.com/authenticate",headers: {"Content-type": "application/x-www-form-urlencoded","Accept": "application/json"},body: {"name": "adityapuri75@gmail.com","password": "Pavilion@15"},);
      return await dio.post(
        //your Api Url
        Secret().Signup,
        data: {"name": name,"password": password},
          options: Options(contentType:Headers.formUrlEncodedContentType )
          );
      // return response.body;
      // print(response);
    }
    on DioError catch(e){
      Fluttertoast.showToast(msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Color(0xffff0000),
        textColor: Color(0xffffffff),
        fontSize: 16

      );
    }
  }
  signup(name,password) async{
      return await dio.post(Secret().Login,
          data: {"name": name,"password": password},
          options: Options(contentType:Headers.formUrlEncodedContentType )
      );
    }
  }
