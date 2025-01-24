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
      body: Column(
        children: [
          // Header Section
          Stack(
            children: [
              Container(
                height: screenHeight / 4,
                width: screenWidth,
                child: SvgPicture.asset(
                  "assets/images/Background 1.svg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 20,
                top: 30,
                child: GestureDetector(
                  child: Icon(
                    Icons.arrow_back,
                    color: colorconstant.white,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                left: 25,
                top: 70,
                child: Text(
                  "Activity",
                  style: TextStyle(
                    color: colorconstant.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          // ListView Section
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: 1, // Number of items
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        "assets/images/zukarte_logo.svg", // Replace with your logo
                        height: 30,
                        width: 30,
                      ),
                    ),
                    title: Text(
                      "Zukarte",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(
                      "Explore our marketplace filled with unique items.",
                      style: TextStyle(fontSize: 10),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Wed",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorconstant.purple,
                          ),
                        ),
                        SizedBox(height: 5),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.red,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
