import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/Screen/Login/LoginPage.dart';
import 'package:restaurant/Themes/ColorsFrave.dart';
import 'package:restaurant/Widgets/AnimationRoute.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:restaurant/Widgets/Widgets.dart';

class CheckEmailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 90.0),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 50.0),
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        color: ColorsFrave.primaryColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: const Icon(FontAwesomeIcons.envelopeOpenText, size: 60, color: ColorsFrave.primaryColor),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const TextFrave(text: 'Check your mail', textAlign: TextAlign.center, fontSize: 32, fontWeight: FontWeight.w500 ),
                  const SizedBox(height: 20.0),
                  const TextFrave(text: 'We have send a password recover instructions to your email.', maxLine: 2, textAlign: TextAlign.center),
                  const SizedBox(height: 40.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 70.0),
                    child: BtnFrave(
                      text: 'Open email App', 
                      fontWeight: FontWeight.w500,
                      onPressed: () async {
                        
                        if( Platform.isAndroid ){

                          final intent = AndroidIntent(
                            action: 'action_view',
                            package: 'com.android.email'
                            );
                          intent.launch();

                        }
                      },
                    )
                  ),
                  const SizedBox(height: 40.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 70.0),
                    child: InkWell(
                      onTap: () => Navigator.pushReplacement(context, routeFrave(page: LoginPage())),
                      child: const TextFrave(text: 'Skip, I\'ll confirm later')
                    )
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15.0),
                child: const TextFrave(text: 'Did not receive the email? Check your spam filter.', color: Colors.grey, maxLine: 2 )
              ),
            ],
          ),
        ),
      ),
    );
  }
}