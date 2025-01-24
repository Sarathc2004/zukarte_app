import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zukarte_app/Core/colors.dart';
import 'package:zukarte_app/Screens/OtpScreen/otpscreen.dart';
import 'package:zukarte_app/Screens/Signup/signupscreen.dart';
import 'package:zukarte_app/Widgets/dotindicator.dart';
import 'package:zukarte_app/Widgets/elevatedbutton.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  final ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top wave section with logo and signup button
            Stack(
              children: [
                Container(
                  width: screenWidth,
                  child: Image.asset(
                    'assets/images/Background 1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: screenWidth / 2.5,
                  bottom: screenWidth / 6,
                  child: Text(
                    "zukarte",
                    style: TextStyle(
                      fontSize: 29,
                      color: colorconstant.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 60,
                  child: GestureDetector(
                    child: Container(
                      height: 25,
                      width: 77,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: colorconstant.white,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Signup",
                          style: TextStyle(
                              color: colorconstant.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    onTap: () {
                      // Handle Signup tap
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ));
                    },
                  ),
                ),
              ],
            ),

            // Login form section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'User Name/Email/Phone',
                      labelStyle:
                          TextStyle(color: colorconstant.gray, fontSize: 14),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: colorconstant.gray),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  ValueListenableBuilder<bool>(
                    valueListenable: isPasswordVisible,
                    builder: (context, value, child) {
                      return TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(16),
                        ],
                        obscureText: !value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: colorconstant.gray, fontSize: 14),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorconstant.gray),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              value ? Icons.visibility : Icons.visibility_off,
                              color: colorconstant.gray,
                            ),
                            onPressed: () {
                              isPasswordVisible.value = !value;
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),

                  // Forgot password link
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        // Handle forgot password
                      },
                      child: Text(
                        "In case you forgot password?",
                        style: TextStyle(
                            color: colorconstant.purple,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),

                  // Login button
                  const SizedBox(height: 24),
                  Elevatedbutton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpScreen()));
                      },
                      text: "Login"),

                  // Or continue with section
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(child: Divider(color: colorconstant.gray)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or Continue with",
                          style: TextStyle(
                              color: colorconstant.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Expanded(child: Divider(color: colorconstant.gray)),
                    ],
                  ),

                  // Social login buttons
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialLoginButton(iconPath: 'assets/images/google.png'),
                      SizedBox(
                        width: 30,
                      ),
                      SocialLoginButton(iconPath: 'assets/images/facebook.png'),
                      SizedBox(
                        width: 30,
                      ),
                      SocialLoginButton(iconPath: 'assets/images/Group 92.png'),
                    ],
                  ),
                ],
              ),
            ),

            // Carousel slider section
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 174.0,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    _currentIndex.value = index;
                  },
                ),
                items: [
                  'assets/images/image 43.png',
                  'assets/images/image 43.png',
                  'assets/images/image 43.png',
                ]
                    .map((item) => ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            item,
                            width: screenWidth,
                            fit: BoxFit.cover,
                          ),
                        ))
                    .toList(),
              ),
            ),

            // Dot indicators
            const SizedBox(height: 16),
            ValueListenableBuilder<int>(
              valueListenable: _currentIndex,
              builder: (context, index, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (dotIndex) => DotIndicator(
                      currentIndex: index,
                      dotIndex: dotIndex,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.iconPath,
  });

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.asset(
          iconPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
