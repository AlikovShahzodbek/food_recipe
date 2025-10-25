import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/routes/main_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText;

  void _loginFunction() {
    final login = _loginTextController.text.trim();
    final password = _passwordTextController.text.trim();
    if (login == "admin" && password == "admin") {
      errorText = null;
      Navigator.of(context).pushNamed(AppRoutes.main);
    } else {
      errorText = 'Неверный логин или пароль ';
    }
    setState(() {});
  }

  void goSignUp(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.register);
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    final signInDecoration = BoxDecoration(
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
            padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello,",
                  style: TextStyle(
                    color: AppColors().black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    color: AppColors().black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 57),
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
                  controller: _loginTextController,
                  decoration: textFileddecoration.copyWith(
                    hintText: "Enter Email",
                    hintStyle: TextStyle(color: AppColors().grey4),
                  ),
                  cursorColor: AppColors().grey1,
                ),
                SizedBox(height: 30),
                Text(
                  "Enter Password",
                  style: TextStyle(
                    color: AppColors().black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _passwordTextController,
                  decoration: textFileddecoration.copyWith(
                    hintText: "Enter Password",
                    hintStyle: TextStyle(color: AppColors().grey4),
                  ),
                  obscureText: true,
                  cursorColor: AppColors().grey1,
                ),
                SizedBox(height: 20),
                if (errorText != null)
                  Text(errorText, style: TextStyle(color: Colors.red)),
                SizedBox(height: 20),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: AppColors().secondary100),
                  ),
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
                  onPressed: _loginFunction,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign In",
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
                        decoration: signInDecoration,
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
                        decoration: signInDecoration,
                        padding: EdgeInsets.all(11),
                        child: SvgPicture.asset(
                          'assets/icons/social_icons/facebook.svg',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
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
                      onPressed: () => goSignUp(context),
                      child: Text(
                        "Sign up",
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
