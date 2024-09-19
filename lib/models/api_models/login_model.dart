// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? success;
  Data? data;
  String? message;

  LoginModel({
    this.success,
    this.data,
    this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  int? id;
  String? name;
  String? email;
  String? contact;
  String? gender;
  String? height;
  String? age;
  String? relationShip;
  String? city;
  String? dob;
  String? token;
  dynamic about;
  dynamic fcmToken;
  int? verified;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic address;
  dynamic language;
  dynamic isSports;
  dynamic isAlcohol;
  dynamic wantChild;
  dynamic hasChild;
  dynamic isSmoker;
  dynamic lat;
  dynamic lng;
  List<Media>? media;

  Data({
    this.id,
    this.name,
    this.email,
    this.contact,
    this.gender,
    this.height,
    this.age,
    this.relationShip,
    this.city,
    this.dob,
    this.token,
    this.about,
    this.fcmToken,
    this.verified,
    this.createdAt,
    this.updatedAt,
    this.address,
    this.language,
    this.isSports,
    this.isAlcohol,
    this.wantChild,
    this.hasChild,
    this.isSmoker,
    this.lat,
    this.lng,
    this.media,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    contact: json["contact"],
    gender: json["gender"],
    height: json["height"],
    age: json["age"],
    relationShip: json["relation_ship"],
    city: json["city"],
    dob: json["dob"],
    token: json["token"],
    about: json["about"],
    fcmToken: json["fcm_token"],
    verified: json["verified"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    address: json["address"],
    language: json["language"],
    isSports: json["is_sports"],
    isAlcohol: json["is_alcohol"],
    wantChild: json["want_child"],
    hasChild: json["has_child"],
    isSmoker: json["is_smoker"],
    lat: json["lat"],
    lng: json["lng"],
    media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "contact": contact,
    "gender": gender,
    "height": height,
    "age": age,
    "relation_ship": relationShip,
    "city": city,
    "dob": dob,
    "token": token,
    "about": about,
    "fcm_token": fcmToken,
    "verified": verified,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "address": address,
    "language": language,
    "is_sports": isSports,
    "is_alcohol": isAlcohol,
    "want_child": wantChild,
    "has_child": hasChild,
    "is_smoker": isSmoker,
    "lat": lat,
    "lng": lng,
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toJson())),
  };
}

class Media {
  int? id;
  String? modelType;
  int? modelId;
  String? uuid;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  String? conversionsDisk;
  int? size;
  List<dynamic>? manipulations;
  List<dynamic>? customProperties;
  List<dynamic>? generatedConversions;
  List<dynamic>? responsiveImages;
  int? orderColumn;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? originalUrl;
  String? previewUrl;

  Media({
    this.id,
    this.modelType,
    this.modelId,
    this.uuid,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.conversionsDisk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.generatedConversions,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
    this.originalUrl,
    this.previewUrl,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    modelType: json["model_type"],
    modelId: json["model_id"],
    uuid: json["uuid"],
    collectionName: json["collection_name"],
    name: json["name"],
    fileName: json["file_name"],
    mimeType: json["mime_type"],
    disk: json["disk"],
    conversionsDisk: json["conversions_disk"],
    size: json["size"],
    manipulations: json["manipulations"] == null ? [] : List<dynamic>.from(json["manipulations"]!.map((x) => x)),
    customProperties: json["custom_properties"] == null ? [] : List<dynamic>.from(json["custom_properties"]!.map((x) => x)),
    generatedConversions: json["generated_conversions"] == null ? [] : List<dynamic>.from(json["generated_conversions"]!.map((x) => x)),
    responsiveImages: json["responsive_images"] == null ? [] : List<dynamic>.from(json["responsive_images"]!.map((x) => x)),
    orderColumn: json["order_column"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    originalUrl: json["original_url"],
    previewUrl: json["preview_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model_type": modelType,
    "model_id": modelId,
    "uuid": uuid,
    "collection_name": collectionName,
    "name": name,
    "file_name": fileName,
    "mime_type": mimeType,
    "disk": disk,
    "conversions_disk": conversionsDisk,
    "size": size,
    "manipulations": manipulations == null ? [] : List<dynamic>.from(manipulations!.map((x) => x)),
    "custom_properties": customProperties == null ? [] : List<dynamic>.from(customProperties!.map((x) => x)),
    "generated_conversions": generatedConversions == null ? [] : List<dynamic>.from(generatedConversions!.map((x) => x)),
    "responsive_images": responsiveImages == null ? [] : List<dynamic>.from(responsiveImages!.map((x) => x)),
    "order_column": orderColumn,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "original_url": originalUrl,
    "preview_url": previewUrl,
  };
}
