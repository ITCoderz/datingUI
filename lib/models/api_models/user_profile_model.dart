import 'dart:convert';

class UserProfileData {
  bool success;
  List<User> userObj;
  String message;

  UserProfileData({
    required this.success,
    required this.userObj,
    required this.message,
  });

  factory UserProfileData.fromJson(Map<String, dynamic> json) => UserProfileData(
    success: json["success"],
    userObj: List<User>.from(json["data"].map((x) => User.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(userObj.map((x) => x.toJson())),
    "message": message,
  };
}

class User {
  int id;
  String name;
  String email;
  String contact;
  String gender;
  String height;
  String age;
  String relationShip;
  String city;
  DateTime dob;
  String token;
  dynamic about;
  dynamic fcmToken;
  int verified;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic address;
  dynamic language;
  dynamic isSports;
  dynamic isAlcohol;
  dynamic wantChild;
  dynamic hasChild;
  dynamic isSmoker;
  dynamic lat;
  dynamic lng;
  List<Media> media;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.contact,
    required this.gender,
    required this.height,
    required this.age,
    required this.relationShip,
    required this.city,
    required this.dob,
    required this.token,
    required this.about,
    required this.fcmToken,
    required this.verified,
    required this.createdAt,
    required this.updatedAt,
    required this.address,
    required this.language,
    required this.isSports,
    required this.isAlcohol,
    required this.wantChild,
    required this.hasChild,
    required this.isSmoker,
    required this.lat,
    required this.lng,
    required this.media,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    contact: json["contact"],
    gender: json["gender"],
    height: json["height"],
    age: json["age"],
    relationShip: json["relation_ship"],
    city: json["city"],
    dob: DateTime.parse(json["dob"]),
    token: json["token"],
    about: json["about"],
    fcmToken: json["fcm_token"],
    verified: json["verified"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    address: json["address"],
    language: json["language"],
    isSports: json["is_sports"],
    isAlcohol: json["is_alcohol"],
    wantChild: json["want_child"],
    hasChild: json["has_child"],
    isSmoker: json["is_smoker"],
    lat: json["lat"],
    lng: json["lng"],
    media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
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
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "token": token,
    "about": about,
    "fcm_token": fcmToken,
    "verified": verified,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "address": address,
    "language": language,
    "is_sports": isSports,
    "is_alcohol": isAlcohol,
    "want_child": wantChild,
    "has_child": hasChild,
    "is_smoker": isSmoker,
    "lat": lat,
    "lng": lng,
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
  };
}

class Media {
  int id;
  String modelType;
  int modelId;
  String uuid;
  String collectionName;
  String name;
  String fileName;
  String mimeType;
  String disk;
  String conversionsDisk;
  int size;
  List<dynamic> manipulations;
  List<dynamic> customProperties;
  List<dynamic> generatedConversions;
  List<dynamic> responsiveImages;
  int orderColumn;
  DateTime createdAt;
  DateTime updatedAt;
  String originalUrl;
  String previewUrl;

  Media({
    required this.id,
    required this.modelType,
    required this.modelId,
    required this.uuid,
    required this.collectionName,
    required this.name,
    required this.fileName,
    required this.mimeType,
    required this.disk,
    required this.conversionsDisk,
    required this.size,
    required this.manipulations,
    required this.customProperties,
    required this.generatedConversions,
    required this.responsiveImages,
    required this.orderColumn,
    required this.createdAt,
    required this.updatedAt,
    required this.originalUrl,
    required this.previewUrl,
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
    manipulations: List<dynamic>.from(json["manipulations"].map((x) => x)),
    customProperties: List<dynamic>.from(json["custom_properties"].map((x) => x)),
    generatedConversions: List<dynamic>.from(json["generated_conversions"].map((x) => x)),
    responsiveImages: List<dynamic>.from(json["responsive_images"].map((x) => x)),
    orderColumn: json["order_column"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
    "manipulations": List<dynamic>.from(manipulations.map((x) => x)),
    "custom_properties": List<dynamic>.from(customProperties.map((x) => x)),
    "generated_conversions": List<dynamic>.from(generatedConversions.map((x) => x)),
    "responsive_images": List<dynamic>.from(responsiveImages.map((x) => x)),
    "order_column": orderColumn,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "original_url": originalUrl,
    "preview_url": previewUrl,
  };
}
