import 'package:flutter/material.dart';
import 'package:minimal_shoppingapp/components/my_button.dart';
import 'package:minimal_shoppingapp/pages/shop_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Center(
            child: Icon(
              Icons.shopping_bag,
              size: 76,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
          ),

          SizedBox(
            height: 20,
          ),

          //title
          Text(
            'Minimal Shop',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inverseSurface),
          ),

          SizedBox(
            height: 10,
          ),

          //subtitile
          Text(
            'Premium Quality products ',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          SizedBox(
            height: 25,
          ),

          //button
          MyButton(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShopPage()));
              },
              child: Icon(Icons.arrow_forward))
        ],
      ),
    );
  }
}
