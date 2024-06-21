import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  int? id;
  List<Comment>? comments;
  String? name;
  String? description;
  String? price;
  int? quantity;
  String? gender;
  String? brand;
  String? size;
  String? color;
  String? image;
  String? lensId;
  String? lensGroupId;
  int? category;
  num? rating;

  Product({
    this.id,
    this.comments,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.gender,
    this.brand,
    this.size,
    this.color,
    this.image,
    this.lensId,
    this.lensGroupId,
    this.category,
    this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        comments: json["comments"] == null
            ? []
            : List<Comment>.from(
                json["comments"]!.map((x) => Comment.fromJson(x))),
        name: json["name"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        gender: json["gender"],
        brand: json["brand"],
        size: json["size"],
        color: json["color"],
        image: json["image"],
        lensId: json["lens_id"],
        lensGroupId: json["lens_group_id"],
        category: json["category"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comments": comments == null
            ? []
            : List<dynamic>.from(comments!.map((x) => x.toJson())),
        "name": name,
        "description": description,
        "price": price,
        "quantity": quantity,
        "gender": gender,
        "brand": brand,
        "size": size,
        "color": color,
        "image": image,
        "lens_id": lensId,
        "lens_group_id": lensGroupId,
        "category": category,
        "rating": rating,
      };
}

class Comment {
  int? id;
  String? text;
  DateTime? createdAt;
  int? product;
  String? user;
  int? sentiment;

  Comment({
    this.id,
    this.text,
    this.createdAt,
    this.product,
    this.user,
    this.sentiment,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        text: json["text"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        product: json["product"],
        user: json["user"],
        sentiment: json["sentiment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "created_at": createdAt?.toIso8601String(),
        "product": product,
        "user": user,
        "sentiment": sentiment,
      };
}
