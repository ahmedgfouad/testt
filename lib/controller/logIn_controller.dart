import 'package:flutter/cupertino.dart';

class LogInController extends ChangeNotifier {
  static final GlobalKey<FormState> formStat = GlobalKey();

  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();

  static bool obSecure = true;

  changeObSecure() {
    obSecure = !obSecure;
    notifyListeners();
  }

}
