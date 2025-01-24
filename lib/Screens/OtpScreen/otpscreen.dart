import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:zukarte_app/Core/colors.dart';
import 'package:zukarte_app/Screens/Category/categoryscreen.dart';
import 'package:zukarte_app/Widgets/carousalwidget.dart';
import 'package:zukarte_app/Widgets/dotindicator.dart';
import 'package:zukarte_app/Widgets/elevatedbutton.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    final ValueNotifier<int> _currentIndex = ValueNotifier(0);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: screenheight / 3.5,
                ),
                // Background image container
                Container(
                  width: screenWidth,
                  child: Image.asset(
                    'assets/images/Background 1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 30, // Adjust this value for overlap on top
                  left: screenWidth / 4, // Center horizontally
                  child: Image.asset(
                    "assets/images/Frame.png",
                    width: screenWidth / 2, // Adjust width if needed
                  ),
                ),
              ],
            ),

            Text(
              "Enter OTP",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5), // Add space between title and description
            Text(
              "We have sent you access code via mail",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 5), // Add space between description lines
            Text(
              "verification",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 20), // Add space between text and OTP input field
            // Pinput OTP Field with adjusted spacing
            Pinput(
              length: 4,
              separatorBuilder: (index) => Container(
                width: 30,
              ),
              defaultPinTheme: PinTheme(
                width: 60,
                height: 60,
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 194, 193, 193),
                      blurRadius: 4,
                      offset:
                          const Offset(3, 6), // Shadow only on right and left
                    ),
                  ],
                ),
              ),
              onChanged: (value) {
                // Handle value changes here
              },
              onCompleted: (value) {
                // Handle OTP completion here
              },
            ),
            SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Elevatedbutton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryScreen(),
                        ));
                  },
                  text: "Verify"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Didn't Receive the OTP?",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                // Handle forgot password
              },
              child: Text(
                "Resend Code",
                style: TextStyle(
                    color: colorconstant.purple,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Expanded(child: Divider(color: colorconstant.gray)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or",
                      style: TextStyle(
                          color: colorconstant.gray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Expanded(child: Divider(color: colorconstant.gray)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                // Handle forgot password
              },
              child: Text(
                "Go with Password",
                style: TextStyle(
                    color: colorconstant.purple,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),

            const SizedBox(height: 20),
            CarousalWidget(
                currentIndex: _currentIndex, screenWidth: screenWidth),

            // Dot indicators
            const SizedBox(height: 16),
            ValueListenableBuilder<int>(
              valueListenable:
                  _currentIndex, // _currentIndex is a ValueNotifier<int>
              builder: (context, index, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (dotIndex) => DotIndicator(
                      currentIndex:
                          index, // Use 'index' provided by ValueListenableBuilder
                      dotIndex: dotIndex,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
