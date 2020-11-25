import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monday/controllers/shopping_controller.dart';
import 'package:monday/controllers/cart_controller.dart';
import 'package:monday/controllers/nav_controller.dart';
import 'package:monday/views/bottom_navbar.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  final navController =Get.put(NavController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                          '${controller.products[index].productDescription}'),
                                    ],
                                  ),
                                  Text('\$${controller.products[index].price}',
                                      style: TextStyle(fontSize: 24)),
                                ],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Text('Add to Cart'),
                              ),
                              Obx(() => IconButton(
                                  icon: controller
                                          .products[index].isFavourite.value
                                      ? Icon(Icons.check_box)
                                      : Icon(Icons.check_box_outline_blank),
                                  onPressed: () {
                                    controller.products[index].isFavourite
                                        .toggle();
                                  }))
                            ],
                          ),
                        ),
                      );
                    });
              }),
            ),

            // GetBuilder<CartController>(
            //   builder:(controller){
            //     return Text(
            //     'Total Amount: \$ ${controller.totalPrice}',
            //     style: TextStyle(fontSize: 32, color: Colors.white),);
            //   }
            // ),
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total Amount: \$ ${controller.totalPrice}',
                style: TextStyle(fontSize: 32, color: Colors.white),
              );
            }),
            Obx(() {
              return Text(
                'Total Amount: \$ ${cartController.totalPrice}',
                style: TextStyle(fontSize: 32, color: Colors.white),
              );
            }),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            navController.changeIndex(1);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomNavBar()));
          },
          backgroundColor: Colors.amber,
          icon: Icon(
            Icons.add_shopping_cart,
            color: Colors.black,
          ),
          label: GetX<CartController>(builder: (controller) {
            return Text(
              controller.count.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            );
          })),
    );
  }
}
