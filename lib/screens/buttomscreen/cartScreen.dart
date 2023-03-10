import 'package:flutter/material.dart';
import 'package:mero_gahana/data_storage/remote_data_source/response/cart_response.dart';
import 'package:mero_gahana/models/cart.dart';
import 'package:mero_gahana/repository/cart_repo.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Cart> cartList = [];

  // ...

  void deleteCartItem(int index) {
    setState(() {
      cartList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: getMyCart(),
          ),
        ],
      ),
    );
  }

  Widget buildCartItem(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(cartList[index].productId!.image!),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartList[index].productId!.productname!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Rs ${cartList[index].productId!.price!}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          IconButton(
            onPressed: () {
              deleteCartItem(index);
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCartList() {
    return ListView.builder(
      itemCount: cartList.length,
      itemBuilder: buildCartItem,
    );
  }

  FutureBuilder<CartResponse?> getMyCart() {
    return FutureBuilder<CartResponse?>(
      future: CartRepository().getAllCart(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          cartList = snapshot.data!.data!;
          return buildCartList();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
