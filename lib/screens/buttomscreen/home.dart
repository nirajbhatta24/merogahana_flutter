
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mero_gahana/models/product.dart';
import 'package:mero_gahana/repository/product_repo.dart';
import 'package:mero_gahana/screens/buttomscreen/productpage.dart';
import '../../data_storage/remote_data_source/response/product_response.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();

  const HomeScreen({super.key});
}
class _HomeScreenState extends State<HomeScreen> {
  FutureBuilder<ProductResponse?> getAllProducts() {
    return FutureBuilder<ProductResponse?>(
      future: ProductRepository().getAllProduct(),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.hasData) {
          List<Product>? productList = snapshot.data!.data!;
          return Padding(
            padding: const EdgeInsets.only(
              left:10,
              right: 10,
            ),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) =>
                        ProductPage(
                          pId:productList[index].productId!,
                          pname: productList[index].productname! ,
                          pdescription: productList[index].productdetails!,
                          pprice:productList[index].price ,
                          image: productList[index].image!,

                        )
                      ));
                  },
                  child: Container(
                    height:450,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius:
                          BorderRadius.circular(7),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(247, 247, 247, 0.238),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 0.2), 
                        ),
                      ],
                    ),
                    child: SizedBox(
                      height:15,
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(7),
                            height:200,
                            width: 500,
                            decoration: BoxDecoration(
                              color: Theme.of(context).highlightColor,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(productList[index].image!),
                              ),
                              borderRadius: const BorderRadius.only(
                                  topLeft:
                                      Radius.circular(7),
                                  topRight:
                                      Radius.circular(7)),
                            ),
                          ),
                          // Card Details Section
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 220,
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      productList[index].productname!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 17,
                                        fontFamily: "Satoshi Medium",
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Rs. ${productList[index].price!}',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Satoshi Regular",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color:Colors.amber,
                                      size: 16,
                                    ),
                                    
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
  @override
  void initState(){
    super.initState();
    getAllProducts();

  }

   _goToAnotherPage() {
    Navigator.pushReplacementNamed(context, ProductPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 170,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://images.squarespace-cdn.com/content/v1/58292048414fb518a2b8885b/1487335532930-3OF1ZWNSWPH8YFD4TUOS/LEJ_DiamondCover.jpg?format=1000w')
                    ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
          ),
          Expanded(child: getAllProducts(),)
        ],
      )
    
    );
  }
}


