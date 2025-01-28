import 'package:flutter/material.dart';
import 'package:zukarte_app/Core/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cartItems = [
      {
        'title': 'Zara Seoul Perfume For Men',
        'soldBy': 'Zara',
        'price': '₹180',
        'image': 'assets/images/Group 185.png',
        'isChecked': false,
      },
      {
        'title': 'Gucci Mini GG Marmont Shoulder Bag',
        'soldBy': 'Farftech',
        'price': '₹180',
        'image': 'assets/images/Group 1000004333.png',
        'isChecked': true,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorconstant.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: colorconstant.purple,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
            child: const Text(
          'Shopping Cart',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        )),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    // Cart Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("2 items"),
                        GestureDetector(
                          child: const Text(
                            'Remove All',
                            style: TextStyle(color: Colors.red),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff99999980),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                          side:
                              BorderSide(color: colorconstant.purple, width: 2),
                        ),
                        const Text(
                          'All',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Cart Items
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return _buildCartItem(
                          title: item['title'],
                          soldBy: item['soldBy'],
                          price: item['price'],
                          image: item['image'],
                          isChecked: item['isChecked'],
                        );
                      },
                    ),

                    // Total Amount Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0xffD6C8DDAB)),
                          color: const Color(0xff801DF),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total Amount',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  '₹1180',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Shipping/Discount',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '₹20',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            const Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Amount Payable',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '₹1200',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Delivery Address Section
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0xffEAEAEA)),
                          color: colorconstant.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Deliver to',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Edit',
                                  style: TextStyle(color: colorconstant.purple),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Fullworth Nesta Berkeley delivery Point Near Sri Lakshmi Garden, Garudachar Palaya, Pincode: 670022',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff3B3A3A)),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Contact: 9844224218',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0xffEAEAEA)),
                          color: colorconstant.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: colorconstant.purple,
                          ),
                          label: Text(
                            'Add New Address',
                            style: TextStyle(color: colorconstant.purple),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Bar with Total and Button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '₹1200',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Grand Total',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorconstant.purple,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Proceed to Pay',
                          style: TextStyle(color: colorconstant.white),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward_outlined,
                          color: colorconstant.white,
                        ),
                      ],
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

  Widget _buildCartItem({
    required String title,
    required String soldBy,
    required String price,
    required String image,
    required bool isChecked,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Checkbox(
                  value: isChecked,
                  onChanged: (value) {},
                  side: BorderSide(color: colorconstant.purple, width: 2),
                ),
              ),
              Image.asset(image, width: 94, height: 90),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Sold by:$soldBy",
                      style: TextStyle(color: colorconstant.gray, fontSize: 12),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 16,
                      width: 46,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: colorconstant.gray)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "100ml",
                            style: TextStyle(
                                fontSize: 8, fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '₹699',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: colorconstant.gray,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: colorconstant.gray),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 32,
                                width: 25,
                                child: GestureDetector(
                                  child: const Icon(Icons.remove, size: 16),
                                  onTap: () {},
                                ),
                              ),
                              Container(
                                width: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: colorconstant.gray),
                                    right:
                                        BorderSide(color: colorconstant.gray),
                                  ),
                                ),
                                child: Text(
                                  "1",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 32,
                                width: 25,
                                child: GestureDetector(
                                  child: const Icon(Icons.add, size: 16),
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Deal Method",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 92,
                          height: 21,
                          decoration: BoxDecoration(
                            color: colorconstant.lightorange,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Delivery',
                                style: TextStyle(
                                  color: Color(0xff37474F),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Color(0xff37474F),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(
            indent: 30,
            endIndent: 30,
          )
        ],
      ),
    );
  }
}
