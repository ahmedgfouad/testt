import 'package:elearning/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class HavingAccount extends StatelessWidget {
  String question;
  String screenName;
  Widget routeScreenName;
  HavingAccount({super.key, required this.question,required this.screenName,required this.routeScreenName});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
           question,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 12,
          ),
        ),
        TextButton(
          child: Text(
            screenName,style: const TextStyle(
            color: AppColors.purple,
            fontSize: 14,
          ),),
          onPressed: () {
            defaultNavigatorAndReplacement(context, routeScreenName);
          },
        ),
      ],
    );
  }
}
