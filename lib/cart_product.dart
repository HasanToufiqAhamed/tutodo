class CartProduct {
  CartProduct({
    this.thumbnailImg,
    this.id,
    this.name,
    this.stock,
    this.price,
    this.discountAmount,
    this.discountType,
    this.shippingTime,
    this.quantity,
    this.discountedPrice,
  });

  String? thumbnailImg;
  String? id;
  String? name;
  int? stock;
  int? price;
  int? discountAmount;
  String? discountType;
  String? shippingTime;
  int? quantity;
  int? discountedPrice;

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
    thumbnailImg: json["thumbnailImg"],
    id: json["_id"],
    name: json["name"],
    stock: json["stock"],
    price: json["price"],
    discountAmount: json["discountAmount"],
    discountType: json["discountType"],
    shippingTime: json["shippingTime"],
    quantity: json["quantity"],
    discountedPrice: json["discountedPrice"].floor(),
  );

  Map<String, dynamic> toJson() => {
    "thumbnailImg": thumbnailImg,
    "_id": id,
    "name": name,
    "stock": stock,
    "price": price,
    "discountAmount": discountAmount,
    "discountType": discountType,
    "shippingTime": shippingTime,
    "quantity": quantity,
    "discountedPrice": discountedPrice,
  };

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "thumbnailImg": thumbnailImg,
      "id": id,
      "name": name,
      "stock": stock,
      "price": price,
      "discountAmount": discountAmount,
      "discountType": discountType,
      "shippingTime": shippingTime,
      "quantity": quantity,
      "discountedPrice": discountedPrice,
    };
    return map;
  }

  CartProduct.fromMap(Map<String, dynamic> map) {
    thumbnailImg = map["thumbnailImg"];
    id = map["id"];
    name = map["name"];
    stock = map["stock"];
    price = map["price"];
    discountAmount = map["discountAmount"];
    discountType = map["discountType"];
    shippingTime = map["shippingTime"];
    quantity = map["quantity"];
    discountedPrice = map["discountedPrice"];
  }
}