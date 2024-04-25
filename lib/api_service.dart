import 'package:dio/dio.dart';
import 'package:untitled6/model.dart';

class ApiService {
  final dio = Dio();
  List<String> banners = [];
  List<Model> products = [];

  fetchBannersData() async {
    var response = await dio.get('https://student.valuxapps.com/api/home');
    if (response.statusCode != 200) {
      print('smt went wrong');
    } else {
      for (var element in response.data['data']['banners']) {
        banners.add(element['image']);
      }
      return banners;
    }
  }

  fetchProductsData() async {
    var response = await dio.get('https://student.valuxapps.com/api/home');
    if (response.statusCode != 200) {
      print('smt went wrong');
    } else {
      for (var element in response.data['data']['products']) {
        products.add(
          Model(
            productImageUrl: element['image'],
            productName: element['name'],
            oldPrice: element['old_price'],
            price: element['price'],
          ),
        );

      }
    }
    return products;
  }
}
