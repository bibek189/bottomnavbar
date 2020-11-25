import 'package:get/get.dart';
import 'package:monday/models/product.dart';

class CartController extends GetxController{
  var cartItems = List<Product>().obs;
  double get totalPrice => cartItems.fold(0, (sum,item ) => sum + item.price);
  int get count => cartItems.length;

  var testAmount = 0.0;
  addToCart( Product product){
    cartItems.add(product);
    testAmount = totalPrice;
    update();
  }
}