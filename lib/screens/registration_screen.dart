import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practick_project/components/registration_screen/custom_checkbox.dart';
import 'package:practick_project/Theme/colors.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool? isChacked = false;

  void goSignIn() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final signUpDecoration = BoxDecoration(
      color: AppColors().white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(30, 0, 0, 0),
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    );
    final textFileddecoration = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      isCollapsed: true,
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors().primary80, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors().grey3),
      ),
    );
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 70, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create an account",
                  style: TextStyle(
                    color: AppColors().black,
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Let’s help you set up your account,\nit won’t take long.",
                ),
                SizedBox(height: 20),
                Text(
                  "Name",
                  style: TextStyle(
                    color: AppColors().black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: textFileddecoration.copyWith(
                    hintText: "Enter Name",
                    hintStyle: TextStyle(color: AppColors().grey4),
                  ),
                  cursorColor: AppColors().grey1,
                ),
                SizedBox(height: 20),
                Text(
                  "Email",
                  style: TextStyle(
                    color: AppColors().black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: textFileddecoration.copyWith(
                    hintText: "Enter Email",
                    hintStyle: TextStyle(color: AppColors().grey4),
                  ),
                  cursorColor: AppColors().grey1,
                ),
                SizedBox(height: 20),
                Text(
                  "Password",
                  style: TextStyle(
                    color: AppColors().black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: textFileddecoration.copyWith(
                    hintText: "Enter Password",
                    hintStyle: TextStyle(color: AppColors().grey4),
                  ),
                  obscureText: true,
                  cursorColor: AppColors().grey1,
                ),
                SizedBox(height: 20),
                Text(
                  "Confirm Password",
                  style: TextStyle(
                    color: AppColors().black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: textFileddecoration.copyWith(
                    hintText: "Retype Password",
                    hintStyle: TextStyle(color: AppColors().grey4),
                  ),
                  obscureText: true,
                  cursorColor: AppColors().grey1,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 15),
                    CustomCheckbox(),
                    SizedBox(width: 10),
                    Text(
                      "Accept terms & Condition",
                      style: TextStyle(color: AppColors().secondary100),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      AppColors().primary100,
                    ),
                    minimumSize: WidgetStatePropertyAll(Size(243, 54)),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      SvgPicture.asset(
                        "assets/icons/outlined_icons/arrow-right.svg",
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      child: Divider(color: AppColors().grey4),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or Sign In With',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors().grey4,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Divider(color: AppColors().grey4),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                      onTap: () {},
                      child: Container(
                        decoration: signUpDecoration,
                        padding: EdgeInsets.all(11),
                        child: SvgPicture.asset(
                          'assets/icons/social_icons/google.svg',
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    InkWell(
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                      onTap: () {},
                      child: Container(
                        decoration: signUpDecoration,
                        padding: EdgeInsets.all(11),
                        child: SvgPicture.asset(
                          'assets/icons/social_icons/facebook.svg',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
                      style: TextStyle(
                        color: AppColors().black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: () => goSignIn(),
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: AppColors().secondary100),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
