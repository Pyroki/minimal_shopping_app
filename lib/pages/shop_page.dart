import 'package:flutter/material.dart';
import 'package:minimal_shoppingapp/components/my_drawer.dart';
import 'package:minimal_shoppingapp/components/product_tile.dart';
import 'package:minimal_shoppingapp/models/shop.dart';
import 'package:minimal_shoppingapp/pages/my_cart.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access product in shop
    final products = context.watch<shop>().Shop;

    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyCart()));
                },
                icon: Icon(Icons.shopping_cart_outlined))
          ],
          backgroundColor: Colors.transparent,
          title: Text(
            'Shop Page',
            style: TextStyle(
                color: Colors.grey.shade600, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: [
            //SUB title
            SizedBox(
              height: 25,
            ),
            Center(
                child: Text(
              'Pick Your Fav item and enjoy It !!',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 20),
            )),

            //product card
            SizedBox(
              height: 560,
              child: ListView.builder(
                itemCount: products.length,
                padding: EdgeInsets.all(25),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //get each individual product form shop
                  final product = products[index];

                  //return as product tile
                  return myproducttile(product: product);
                },
              ),
            ),
          ],
        ));
  }
}
