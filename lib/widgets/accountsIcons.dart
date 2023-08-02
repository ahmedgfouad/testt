import 'package:flutter/material.dart';
import '../images/images.dart';


class AccountsIcons extends StatelessWidget {
  // late final String connect;
   final void Function() onPressed;
  const AccountsIcons({super.key, 
    // required this.connect,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            InkWell(
              onTap: onPressed,
              child: Image.asset(
                ImgAssets.twitter,
                width: 30,
                height: 30,
              ),
            ),
             InkWell(
              onTap: onPressed,
              child: Image.asset(
                ImgAssets.google,
                width: 30,
                height: 30,
              ),
            ),

            InkWell(
              onTap: onPressed,
              child: Image.asset(
                ImgAssets.facebook,
                width: 30,
                height:30,
              ),
            ),
          ],
    );
  }
}
