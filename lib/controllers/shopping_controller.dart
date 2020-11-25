import 'package:get/get.dart';
import 'package:monday/models/product.dart';

class ShoppingController extends GetxController{
  var products = List<Product>().obs;

  @override
  void onInit(){
    super.onInit();
    fetchProducts();

  }

  void fetchProducts() async{
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
        id: 1,
        productName: 'name1',
        price: 50,
        productDescription: 'this is description 1',
        productImage: 'aaa',
      ),
      Product(
        id: 2,
        productName: 'name2',
        price: 53,
        productDescription: 'this is description 2',
        productImage: 'bbb',
      ),
    ];
    products.value = productResult;
  }
}
