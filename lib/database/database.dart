// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:news_api/auth/auth_view.dart';
import 'package:news_api/news/indexNews.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBase {
  static funSaveDB(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    var a = await pref.setBool('login', true);
    if (a) {
      funGetDB(context);
    }
  }

  static funGetDB(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    var login = pref.getBool('login');
    if (login == true) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => IndexNews(),
        ),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => AuthView(),
        ),
        (route) => false,
      );
    }
  }
}
