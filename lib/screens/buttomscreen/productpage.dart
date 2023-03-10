import 'package:flutter/material.dart';
import 'package:mero_gahana/repository/cart_repo.dart';

class ProductPage extends StatefulWidget {

  final String? pId;
  final String? pname;
  final String? image;
  final int? pprice;
  final String? pdescription;


  const ProductPage({ Key? key, required this.pId, this.pname,this.image, this.pdescription, this.pprice }): super(key: key);
  
  static const String route = "productpage";

  @override
  State<ProductPage> createState() => _ProductPageState();
}
  String route = "/productpage";

class _ProductPageState extends State<ProductPage> {


addToCart(String productId, String quantity) async {
    final isNewItemAddedToCart =
        await CartRepository().addProductToCart(productId, quantity);
    return isNewItemAddedToCart;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Product Detail"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.image!),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.pname!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: 'Roboto',
                letterSpacing: 1.5,
                shadows: <Shadow>[
                  Shadow(
                    offset: const Offset(1.0, 1.0),
                    blurRadius: 2.0,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Rs. ${widget.pprice!}",
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.pdescription!,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,

            child: Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton(
    onPressed: () {
      addToCart(widget.pId!,"1");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Product is Added to the Shopping"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    },
    child: const Text("Buy"),
  ),
),

          ),
        ],
      ),
    );
  }
}