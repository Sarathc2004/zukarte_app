import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zukarte_app/Core/colors.dart';
import 'package:zukarte_app/Screens/Login/loginscreen.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Section
          Container(
            height: screenHeight,
          ),
          Container(
            width: screenWidth,
            height: screenHeight / 5.4,
            child: SvgPicture.asset(
              "assets/images/Background 1.svg",
              fit: BoxFit.cover,
            ),
          ),
          // Back Button and Title
          Positioned(
            top: 20, // 20px from the top
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: colorconstant.white,
                    size: 30,
                  ),
                ),
                Text(
                  "Activity",
                  style: TextStyle(
                    color: colorconstant.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Positioned Content Container
          Positioned(
            top: screenHeight / 14,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight - 30, // Remaining height
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: ListView.builder(
                  itemCount: 1, // Number of items
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 1,
                      margin: const EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: colorconstant.purple,
                              ),
                              shape: BoxShape.circle),
                          child: Image.asset(
                              "assets/images/zukarte_short_logo-removebg-preview 1.png"),
                        ),
                        title: Text(
                          "Zukarte",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        subtitle: Text(
                          "Welcome to Zukarte.. Explore our Marketplace filled with unique items.. exciting deals. Signup or login now to unlock exclusive features like managing your cart, saving pinned items, chatting with sellers, and more. Don’t miss out! Create your account today and start shopping!",
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Wed",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: colorconstant.purple,
                              ),
                            ),
                            const SizedBox(height: 10),

                            Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: colorconstant.purple,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                      color: colorconstant.white,
                                    ),
                                  ),
                                ))
                            // CircleAvatar(
                            //   radius: 7,
                            //   backgroundColor: colorconstant.purple,
                            //   child: Center(
                            //       child: Text(
                            //     "1",
                            //     style: TextStyle(color: colorconstant.white),
                            //   )),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
