import 'package:flutter/material.dart';
import 'package:minimal_shoppingapp/models/product.dart';
import 'package:minimal_shoppingapp/models/shop.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  void removeitemfromcart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                content: Text('Remove this item from your cart?'),
                actions: [
                  //cancel
                  MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'),
                  ),

                  MaterialButton(
                    onPressed: () {
                      //Remove it
                      context.read<shop>().removefromcart(product);

                      //pop it
                      Navigator.pop(context);
                    },
                    child: Text('Yes'),
                  )
                ]));
  }

  @override
  Widget build(BuildContext context) {
    //get access to cart
    final cart = context.watch<shop>().Cart;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty
                  ? Center(
                      child: Text(
                      'Your Cart is empty',
                      style: TextStyle(fontSize: 18),
                    ))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (BuildContext, index) {
                        final item = cart[index];

                        //return the cart
                        return Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            title: Text(
                              item.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              item.price.toStringAsFixed(2),
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            trailing: IconButton(
                                onPressed: () =>
                                    removeitemfromcart(context, item),
                                icon: Icon(Icons.remove)),
                          ),
                        );
                      }))
        ],
      ),
    );
  }
}
