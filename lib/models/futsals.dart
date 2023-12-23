List<Futsal> futsalsFromJson(List<dynamic> futsalsJson) => List<Futsal>.from(
    futsalsJson.map((futsalJson) => Futsal.fromJson(futsalJson)));

class Futsal {
  int? id;
  String? name;
  String? phone;
  String? email;
  bool? isAvailable;
  String? fromDate;
  String? toDate;
  String? futsalName;
  String? location;
  String? banner;
  String? image;
  String? price;
  String? description;
  String? createdAt;
  String? updatedAt;

  Futsal(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.isAvailable,
      this.fromDate,
      this.toDate,
      this.futsalName,
      this.location,
      this.banner,
      this.image,
      this.price,
      this.description,
      this.createdAt,
      this.updatedAt});

  Futsal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    isAvailable = json['is_available'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    futsalName = json['futsal_name'];
    location = json['location'];
    banner = json['banner'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['is_available'] = isAvailable;
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['futsal_name'] = futsalName;
    data['location'] = location;
    data['banner'] = banner;
    data['image'] = image;
    data['price'] = price;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
