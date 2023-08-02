import 'package:elearning/controller/logIn_controller.dart';
import 'package:elearning/sign_up.dart';
import 'package:elearning/widgets/accountsIcons.dart';
import 'package:elearning/widgets/colors.dart';
import 'package:elearning/widgets/default_button.dart';
import 'package:elearning/widgets/dfaultTextFormField.dart';
import 'package:elearning/widgets/having_accounts.dart';
import 'package:elearning/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'images/images.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ChangeNotifierProvider(
          create: (BuildContext context) =>LogInController(),
          child: SingleChildScrollView(
            child: Form(
              key: LogInController.formStat,
              child: Column(
                children: [
                  const Text(
                    "Lets get Started",
                    style: TextStyle(fontSize: 30),
                  ),
                  Image.asset(ImgAssets.login, width: 133, height: 176),
                  DefaultFormField(
                    tittle: "Email",
                    width: 300,
                    height: 45,
                    controller: LogInController.emailController,
                    type: TextInputType.name,
                    validate: (value) {
                      if(value!.length == 0){
                        return 'You should enter email' ;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Consumer<LogInController>(
                    builder: (BuildContext context, value, Widget? child) =>
                      DefaultFormField(
                      tittle: "Password",
                      width: 300,
                      height: 45,
                      controller: LogInController.passwordController,
                      type: TextInputType.name,
                        validate: (value) {
                          if(value!.isEmpty){
                            return 'You should enter password' ;
                          }
                          return null;
                        },
                      suffix: LogInController.obSecure ?Icons.visibility_off_outlined : Icons.remove_red_eye_outlined,
                      isPassword: true,
                      obSecure: LogInController.obSecure,
                      suffixButtonPressed: () {
                        value.changeObSecure();
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "forget password ?",
                        style: TextStyle(fontSize: 13, color: AppColors.purple),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  DefaultButton(
                    onPressed: () {
                     if(LogInController.formStat.currentState!.validate()){
                       defaultNavigatorAndReplacement(context, const Home());
                     }
                     else {
                       return ;
                     }

                    },
                    width: 300,
                    height: 45,
                    backgroundColor: AppColors.purple,
                    text: "Log in",
                    borderRadius: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HavingAccount(
                          question:  "Have an account ?",
                         screenName: "Sign Up",
                         routeScreenName: const SignUPScreen(),
                       ),
                    ],
                  ),
                  AccountsIcons(onPressed: (){}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
