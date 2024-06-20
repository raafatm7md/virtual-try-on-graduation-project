class UserData {
  UserData({
    this.id,
    this.user,
    this.userName,
    this.userEmail,
    this.phoneNumber,
    this.image,
    this.address,
  });

  UserData.fromJson(dynamic json) {
    id = json['id'];
    user = json['user'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    phoneNumber = json['phone_number'];
    image = json['image'];
    address = json['address'];
  }
  num? id;
  num? user;
  String? userName;
  String? userEmail;
  String? phoneNumber;
  String? image;
  String? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user'] = user;
    map['user_name'] = userName;
    map['user_email'] = userEmail;
    map['phone_number'] = phoneNumber;
    map['image'] = image;
    map['address'] = address;
    return map;
  }
}
