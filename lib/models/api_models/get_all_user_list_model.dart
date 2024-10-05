// To parse this JSON data, do
//
//     final getAllUserListModel = getAllUserListModelFromJson(jsonString);

import 'dart:convert';

GetAllUserListModel getAllUserListModelFromJson(String str) => GetAllUserListModel.fromJson(json.decode(str));

String getAllUserListModelToJson(GetAllUserListModel data) => json.encode(data.toJson());

class GetAllUserListModel {
  bool success;
  List<UserProfileDataObj> data;
  String message;

  GetAllUserListModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory GetAllUserListModel.fromJson(Map<String, dynamic> json) => GetAllUserListModel(
    success: json["success"],
    data: List<UserProfileDataObj>.from(json["data"].map((x) => UserProfileDataObj.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class UserProfileDataObj {
  int id;
  String name;
  String email;
  String contact;
  String gender;
  String height;
  String age;
  String relationShip;
  String city;
  String dob;
  String token;
  String? about;
  dynamic fcmToken;
  int verified;
  DateTime createdAt;
  DateTime updatedAt;
  String? language;
  String? isSports;
  String? isAlcohol;
  String? wantChild;
  String? hasChild;
  String? isSmoker;
  String? lat;
  String? lng;
  String? userImage;
  List<Media> media;

  UserProfileDataObj({
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
    required this.language,
    required this.isSports,
    required this.isAlcohol,
    required this.wantChild,
    required this.hasChild,
    required this.isSmoker,
    required this.lat,
    required this.lng,
    required this.userImage,
    required this.media,
  });

  factory UserProfileDataObj.fromJson(Map<String, dynamic> json) => UserProfileDataObj(
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
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    language: json["language"],
    isSports: json["is_sports"],
    isAlcohol: json["is_alcohol"],
    wantChild: json["want_child"],
    hasChild: json["has_child"],
    isSmoker: json["is_smoker"],
    lat: json["lat"],
    lng: json["lng"],
    userImage: json["user_image"],
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
    "dob": dob,
    "token": token,
    "about": about,
    "fcm_token": fcmToken,
    "verified": verified,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "language": language,
    "is_sports": isSports,
    "is_alcohol": isAlcohol,
    "want_child": wantChild,
    "has_child": hasChild,
    "is_smoker": isSmoker,
    "lat": lat,
    "lng": lng,
    "user_image": userImage,
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
  };
}

class Media {
  int id;
  ModelType modelType;
  int modelId;
  String uuid;
  CollectionName collectionName;
  String name;
  String fileName;
  MimeType mimeType;
  Disk disk;
  Disk conversionsDisk;
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
    modelType: modelTypeValues.map[json["model_type"]]!,
    modelId: json["model_id"],
    uuid: json["uuid"],
    collectionName: collectionNameValues.map[json["collection_name"]]!,
    name: json["name"],
    fileName: json["file_name"],
    mimeType: mimeTypeValues.map[json["mime_type"]]!,
    disk: diskValues.map[json["disk"]]!,
    conversionsDisk: diskValues.map[json["conversions_disk"]]!,
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
    "model_type": modelTypeValues.reverse[modelType],
    "model_id": modelId,
    "uuid": uuid,
    "collection_name": collectionNameValues.reverse[collectionName],
    "name": name,
    "file_name": fileName,
    "mime_type": mimeTypeValues.reverse[mimeType],
    "disk": diskValues.reverse[disk],
    "conversions_disk": diskValues.reverse[conversionsDisk],
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

enum CollectionName {
  IMAGES
}

final collectionNameValues = EnumValues({
  "images": CollectionName.IMAGES
});

enum Disk {
  PUBLIC
}

final diskValues = EnumValues({
  "public": Disk.PUBLIC
});

enum MimeType {
  IMAGE_JPEG,
  IMAGE_PNG
}

final mimeTypeValues = EnumValues({
  "image/jpeg": MimeType.IMAGE_JPEG,
  "image/png": MimeType.IMAGE_PNG
});

enum ModelType {
  APP_MODELS_USER
}

final modelTypeValues = EnumValues({
  "App\\Models\\User": ModelType.APP_MODELS_USER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
