import 'package:flutter/material.dart';
import 'package:zukarte_app/Core/colors.dart';
import 'package:zukarte_app/Core/database.dart';
import 'package:zukarte_app/Widgets/elevatedbutton.dart';

class CategoryScreen extends StatelessWidget {
  final _selectedCategories =
      ValueNotifier<List<bool>>(List.generate(12, (_) => false));

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // Stack for background image and title
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
                top: 44,
                left: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's know your favorite categories",
                      style: TextStyle(
                        color: colorconstant.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Please select maximum of your favorite 5 categories",
                      style: TextStyle(
                        color: colorconstant.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ValueListenableBuilder<List<bool>>(
              valueListenable: _selectedCategories,
              builder: (context, selectedCategories, _) {
                return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero, // No extra padding
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      _selectedCategories.value[index] =
                          !_selectedCategories.value[index];
                      _selectedCategories.notifyListeners();
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorconstant.white,
                            boxShadow: [
                              BoxShadow(
                                color: colorconstant.gray,
                                blurRadius: 7,
                                offset: const Offset(2, 3),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Image.asset(
                                  Mainlist.categorylist[index],
                                ),
                              ),
                              if (selectedCategories[index])
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Color(0xff5F3DF6),
                                    child: Icon(
                                      Icons.check,
                                      color: colorconstant.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          Mainlist.categorytexts[index],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Buttons and Skip for now text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Elevatedbutton(onPressed: () {}, text: "Continue"),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Handle skip
                  },
                  child: Text(
                    "Skip for now",
                    style: TextStyle(
                      color: colorconstant.purple,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
