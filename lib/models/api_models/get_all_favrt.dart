class FavouriteModel {
  FavouriteModel({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool? success;
  final Data? data;
  final String? message;

  factory FavouriteModel.fromJson(Map<String, dynamic> json){
    return FavouriteModel(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
    );
  }

}

class Data {
  Data({
    required this.favourite,
    required this.pickedBy,
  });

  final List<Favourite> favourite;
  final List<Favourite> pickedBy;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      favourite: json["favourite"] == null ? [] : List<Favourite>.from(json["favourite"]!.map((x) => Favourite.fromJson(x))),
      pickedBy: json["pickedBy"] == null ? [] : List<Favourite>.from(json["pickedBy"]!.map((x) => Favourite.fromJson(x))),
    );
  }

}

class Favourite {
  Favourite({
    required this.id,
    required this.addedBy,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  final int? id;
  final AddedBy? addedBy;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final AddedBy? user;

  factory Favourite.fromJson(Map<String, dynamic> json){
    return Favourite(
      id: json["id"],
      addedBy: json["added_by"] == null ? null : AddedBy.fromJson(json["added_by"]),
      userId: json["user_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      user: json["user"] == null ? null : AddedBy.fromJson(json["user"]),
    );
  }

}

class AddedBy {
  AddedBy({
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

  final int? id;
  final String? name;
  final String? email;
  final String? contact;
  final String? gender;
  final String? height;
  final String? age;
  final String? relationShip;
  final String? city;
  final String? dob;
  final String? token;
  final String? about;
  final dynamic fcmToken;
  final int? verified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? language;
  final String? isSports;
  final String? isAlcohol;
  final String? wantChild;
  final String? hasChild;
  final String? isSmoker;
  final dynamic lat;
  final dynamic lng;
  final String? userImage;
  final List<Media> media;

  factory AddedBy.fromJson(Map<String, dynamic> json){
    return AddedBy(
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
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      language: json["language"],
      isSports: json["is_sports"],
      isAlcohol: json["is_alcohol"],
      wantChild: json["want_child"],
      hasChild: json["has_child"],
      isSmoker: json["is_smoker"],
      lat: json["lat"],
      lng: json["lng"],
      userImage: json["user_image"],
      media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
    );
  }

}

class Media {
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

  final int? id;
  final String? modelType;
  final int? modelId;
  final String? uuid;
  final String? collectionName;
  final String? name;
  final String? fileName;
  final String? mimeType;
  final String? disk;
  final String? conversionsDisk;
  final int? size;
  final List<dynamic> manipulations;
  final List<dynamic> customProperties;
  final List<dynamic> generatedConversions;
  final List<dynamic> responsiveImages;
  final int? orderColumn;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? originalUrl;
  final String? previewUrl;

  factory Media.fromJson(Map<String, dynamic> json){
    return Media(
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
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      originalUrl: json["original_url"],
      previewUrl: json["preview_url"],
    );
  }

}
