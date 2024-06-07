import 'package:flutter/material.dart';
import 'package:minimal_shoppingapp/components/list_tile.dart';
import 'package:minimal_shoppingapp/pages/intro_page.dart';
import 'package:minimal_shoppingapp/pages/my_cart.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade300,
      child: Column(
        children: [
          // header
          Container(
            margin: EdgeInsets.only(top: 90),
            child: Icon(Icons.shopping_cart,
                size: 60, color: Colors.grey.shade800),
          ),

          SizedBox(
            height: 60,
          ),
          //shop title

          MyListTile(
            text: 'shop',
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
            },
          ),

          SizedBox(
            height: 25,
          ),
          //cart title

          MyListTile(
              text: 'Cart',
              icon: Icons.shopping_cart_checkout,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyCart()));
              }),

          //exit
          Spacer(),

          MyListTile(
              text: 'Exit',
              icon: Icons.exit_to_app,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => IntroPage()));
              })
        ],
      ),
    );
  }
}
