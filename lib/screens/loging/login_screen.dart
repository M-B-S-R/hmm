
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmm/appcolor/app_colors.dart';
import 'package:hmm/routes/routes.dart';
import 'package:hmm/screens/loging/home.dart';
import 'package:hmm/signup/signup_screen.dart';
import 'package:hmm/styles/login_screen_stylies.dart';
import 'package:hmm/svgimages/svg_images.dart';
import 'package:hmm/widgets/my_button_widget.dart';
import 'package:hmm/widgets/my_textfromfield_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget buildTopPart() {
    return Column(
      children: [
        Image.asset(
          "images/Logo.png",
          height: 150,
        ),
        Column(
          children: [
            MyTextFromField(
              hintText: "E-mail",
              obscureText: false,
            ),
            MyTextFromField(
              hintText: "Password",
              obscureText: true,
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Expanded(
              //   child: MyButtonWidget(
              //     text: "Sign in",
              //     color: AppColors.baseDarkOrangeColor,
              //     onPress: () {
              //       PageRouting.goToNextPage(
              //         context: context,
              //         navigateTo: HomePage(),
              //       );
              //     },
              //   ),
              // ),
              Expanded(child: MaterialButton(
                child: Text("Login",style: TextStyle(color: Colors.white),),
                color: Colors.greenAccent,
                height: 45,
                elevation: 0,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ), onPressed: () {

                PageRouting.goToNextPage(
                context: context,
                         navigateTo: HomePage(),
                      );
              },

              )),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: MaterialButton(
                child: Text("Login",style: TextStyle(color: Colors.white),),
                color: Colors.greenAccent,
                height: 45,
                elevation: 0,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ), onPressed: () {

                PageRouting.goToNextPage(
                  context: context,
                  navigateTo: SignupScreen(),
                );
              },

              )),
            ],
          ),
        ),
         SizedBox(
          height: 20,
        ),
        Text(
          "Forgot password?",
          style: LoginScreenStylies.forgotPasswordStylies,
        ),
      ],
    );
  }

  Widget buildSocialButton({required Widget child, required Function onPressed}) {
    return MaterialButton(
      shape: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.5,
          color: AppColors.baseGrey40Color,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      onPressed: onPressed(),
      child: child,
    );
  }

  Widget buildBottomPart({required BuildContext context}) {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "or sign in with social networks",
            style: LoginScreenStylies.signinSocialStylies,
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // facebook social button
                buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.facebook,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),

                // google social button
                buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.google,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),
                // twitter social button
                buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.twitter,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: MaterialButton(
              color: AppColors.baseGrey10Color,
              height: 55,
              elevation: 0,
              shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  "Sign up",
                  style: LoginScreenStylies.signupButtonTextStylies,
                ),
              ),
              onPressed: () {
                PageRouting.goToNextPage(
                  context: context,
                  navigateTo: SignupScreen(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildTopPart(),
                  buildBottomPart(context: context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}