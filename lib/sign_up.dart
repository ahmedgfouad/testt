import 'package:elearning/controller/signup_controller.dart';
import 'package:elearning/log_in.dart';
import 'package:elearning/widgets/colors.dart';
import 'package:elearning/widgets/default_button.dart';
import 'package:elearning/widgets/dfaultTextFormField.dart';
import 'package:elearning/widgets/having_accounts.dart';
import 'package:elearning/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'images/images.dart';

class SignUPScreen extends StatelessWidget {
  const SignUPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ChangeNotifierProvider(
          create: (BuildContext context)=>SignUpController(),
          child: SingleChildScrollView(
            child: Form(
              key: SignUpController.formStat,
              child: Column(
                children: [
                  const Text(
                    "Lets get Started",
                    style: TextStyle(fontSize: 30),
                  ),
                  Image.asset(ImgAssets.login, width: 133, height: 176),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultFormField(
                        tittle: "First name",
                        width: 130,
                        height: 45,
                        controller: SignUpController.firstNameController,
                        type: TextInputType.name,
                        validate: (value) {
                          if(value!.isEmpty){
                            return 'You should enter first name' ;
                          }
                          return null;
                        }
                      ),
                      DefaultFormField(
                        tittle: "Last name",
                        width: 130,
                        height: 45,
                        controller: SignUpController.lastNameController,
                        type: TextInputType.name,
                        validate:  (value) {
                          if(value!.isEmpty){
                            return 'You should enter last name' ;
                          }
                          return null;
                        }
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  DefaultFormField(
                    tittle: "Email",
                    width: 300,
                    height: 45,
                    controller: SignUpController.emailController,
                    type: TextInputType.name,
                    validate:  (value) {
                      if(value!.isEmpty){
                        return 'You should enter email' ;
                      }
                      return null;
                    }
                  ),
                  const SizedBox(height: 20),
                  Consumer<SignUpController>(
                    builder: (BuildContext context, value, Widget? child) =>
                        DefaultFormField(
                      tittle: "Password",
                      width: 300,
                      height: 45,
                      controller: SignUpController.passwordController,
                      type: TextInputType.name,
                      validate:  (value) {
                        if(value!.isEmpty){
                          return 'You should enter password' ;
                        }
                        return null;
                      },
                      suffix: SignUpController.obSecurePassword ?Icons.visibility_off_outlined : Icons.remove_red_eye_outlined,
                      isPassword: true,
                      obSecure: SignUpController.obSecurePassword,
                      suffixButtonPressed: (){
                        value.changeObSecurePassword();
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Consumer<SignUpController>(
                    builder: (BuildContext context, value, Widget? child) =>
                        DefaultFormField(
                      tittle: "Confirm Password",
                      width: 300,
                      height: 45,
                      controller: SignUpController.confirmPasswordController,
                      type: TextInputType.name,
                      validate:  (value) {
                        if(value!.isEmpty){
                          return 'You should enter confirm password' ;
                        }
                        return null;
                      },
                      suffix: SignUpController.obSecureConfirmPassword ?Icons.visibility_off_outlined : Icons.remove_red_eye_outlined,
                      isPassword: true,
                      obSecure: SignUpController.obSecureConfirmPassword,
                      suffixButtonPressed: (){
                       value.changeObSecureConfirmPassword();
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "forget  password ?",
                    style: TextStyle(fontSize: 13),
                  ),
                  const SizedBox(height: 10),
                  DefaultButton(
                    onPressed: () {
                      if(SignUpController.formStat.currentState!.validate()){
                        defaultNavigatorAndReplacement(context, const Home());
                      }
                      else {
                        return ;
                      }

                    },
                    width: 300,
                    height: 45,
                    backgroundColor: AppColors.purple,
                    text: "SignUp",
                    borderRadius: 15,
                  ),
                  const SizedBox(height: 10),
                  HavingAccount(question: "Have account", screenName: "Login ", routeScreenName: const LogInScreen()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
