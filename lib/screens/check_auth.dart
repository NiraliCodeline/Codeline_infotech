import 'package:shared_preferences/shared_preferences.dart';

/*class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    var token = GetStorage().read("token");
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = AllLangStudentList();
    } else {
      child = LogInScreen();
    }
    return Scaffold(
      body: child,
    );
  }
}*/

class SharedPrefsManager {
  static Future setUserEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('email', email);
  }

  static Future getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  static Future logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('email');
  }
}
