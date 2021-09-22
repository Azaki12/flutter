class HomeModel {
  bool status;
  HomeDataModel data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel {
  List<Map<String, dynamic>> banners = [];
  List<Map<String, dynamic>> products = [];

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(element);
    });
    json['products'].forEach((element) {
      products.add(element);
    });
  }
}

class BannerModel {
  int id;
  String image;

  BannerModel.fromJson(json) {
    image = json['image'];
    id = json['id'];
  }
}

class ProductsModel {
  int id;
  dynamic oldPrice;
  dynamic price;
  dynamic discount;
  String image;
  String name;
  bool inFavorites;
  bool inCart;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    oldPrice = json['old_price'];
    price = json['price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
