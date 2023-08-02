import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier{
  static final GlobalKey<FormState> formStat = GlobalKey();


  static final TextEditingController firstNameController =
      TextEditingController();
  static final TextEditingController lastNameController =
      TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  static final TextEditingController confirmPasswordController =
      TextEditingController();

  static bool obSecurePassword = true;
  static bool obSecureConfirmPassword = true;

  changeObSecurePassword() {
    obSecurePassword =! obSecurePassword;
    notifyListeners();
  }

 changeObSecureConfirmPassword() {
   obSecureConfirmPassword =! obSecureConfirmPassword;
    notifyListeners();
  }

}
