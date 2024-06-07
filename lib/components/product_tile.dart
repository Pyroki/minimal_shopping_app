import 'package:flutter/material.dart';
import 'package:minimal_shoppingapp/models/product.dart';
import 'package:minimal_shoppingapp/models/shop.dart';
import 'package:provider/provider.dart';

class myproducttile extends StatelessWidget {
  final Product product;
  const myproducttile({super.key, required this.product});

  //add to cart

  void addtocart(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(content: Text('Add this item to your cart?'), actions: [
              //cancel
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),

              MaterialButton(
                onPressed: () {
                  //add it
                  context.read<shop>().addtocart(product);

                  //pop it
                  Navigator.pop(context);
                },
                child: Text('Yes'),
              )
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //product image
          AspectRatio(
            aspectRatio: 1,
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(product.imagepath)),
          ),

          SizedBox(
            height: 15,
          ),

          //product name
          Text(
            product.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          //product description
          Text(
            product.description,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
          ),
          Spacer(),

          //product price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\Inr ' + product.price.toStringAsFixed(2),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                      onPressed: () => addtocart(context),
                      icon: Icon(Icons.add)))
            ],
          ),

          //button to add to cart
        ],
      ),
    );
  }
}
