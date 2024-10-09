
class FavouriteModel {
  FavouriteModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final List<FavrtUser> data;
  late final String message;

  FavouriteModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e)=>FavrtUser.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class FavrtUser {
  FavrtUser({
    required this.id,
    required this.addedBy,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });
  late final int id;
  late final AddedBy addedBy;
  late final int userId;
  late final String createdAt;
  late final String updatedAt;
  late final User user;

  FavrtUser.fromJson(Map<String, dynamic> json){
    id = json['id'];
    addedBy = AddedBy.fromJson(json['added_by']);
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['added_by'] = addedBy.toJson();
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['user'] = user.toJson();
    return _data;
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
    this.about,
    this.fcmToken,
    required this.verified,
    required this.createdAt,
    required this.updatedAt,
    required this.language,
    required this.isSports,
    required this.isAlcohol,
    required this.wantChild,
    required this.hasChild,
    required this.isSmoker,
    this.lat,
    this.lng,
    this.userImage,
    required this.media,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String contact;
  late final String gender;
  late final String height;
  late final String age;
  late final String relationShip;
  late final String city;
  late final String dob;
  late final String token;
  late final String? about;
  late final Null fcmToken;
  late final int verified;
  late final String createdAt;
  late final String updatedAt;
  late final String language;
  late final String isSports;
  late final String isAlcohol;
  late final String wantChild;
  late final String hasChild;
  late final String isSmoker;
  late final Null lat;
  late final Null lng;
  late final String? userImage;
  late final List<Media> media;

  AddedBy.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    gender = json['gender'];
    height = json['height'];
    age = json['age'];
    relationShip = json['relation_ship'];
    city = json['city'];
    dob = json['dob'];
    token = json['token'];
    about = null;
    fcmToken = null;
    verified = json['verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    language = json['language'];
    isSports = json['is_sports'];
    isAlcohol = json['is_alcohol'];
    wantChild = json['want_child'];
    hasChild = json['has_child'];
    isSmoker = json['is_smoker'];
    lat = null;
    lng = null;
    userImage = null;
    media = List.from(json['media']).map((e)=>Media.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['contact'] = contact;
    _data['gender'] = gender;
    _data['height'] = height;
    _data['age'] = age;
    _data['relation_ship'] = relationShip;
    _data['city'] = city;
    _data['dob'] = dob;
    _data['token'] = token;
    _data['about'] = about;
    _data['fcm_token'] = fcmToken;
    _data['verified'] = verified;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['language'] = language;
    _data['is_sports'] = isSports;
    _data['is_alcohol'] = isAlcohol;
    _data['want_child'] = wantChild;
    _data['has_child'] = hasChild;
    _data['is_smoker'] = isSmoker;
    _data['lat'] = lat;
    _data['lng'] = lng;
    _data['user_image'] = userImage;
    _data['media'] = media.map((e)=>e.toJson()).toList();
    return _data;
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
  late final int id;
  late final String modelType;
  late final int modelId;
  late final String uuid;
  late final String collectionName;
  late final String name;
  late final String fileName;
  late final String mimeType;
  late final String disk;
  late final String conversionsDisk;
  late final int size;
  late final List<dynamic> manipulations;
  late final List<dynamic> customProperties;
  late final List<dynamic> generatedConversions;
  late final List<dynamic> responsiveImages;
  late final int orderColumn;
  late final String createdAt;
  late final String updatedAt;
  late final String originalUrl;
  late final String previewUrl;

  Media.fromJson(Map<String, dynamic> json){
    id = json['id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    uuid = json['uuid'];
    collectionName = json['collection_name'];
    name = json['name'];
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    disk = json['disk'];
    conversionsDisk = json['conversions_disk'];
    size = json['size'];
    manipulations = List.castFrom<dynamic, dynamic>(json['manipulations']);
    customProperties = List.castFrom<dynamic, dynamic>(json['custom_properties']);
    generatedConversions = List.castFrom<dynamic, dynamic>(json['generated_conversions']);
    responsiveImages = List.castFrom<dynamic, dynamic>(json['responsive_images']);
    orderColumn = json['order_column'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    originalUrl = json['original_url'];
    previewUrl = json['preview_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['model_type'] = modelType;
    _data['model_id'] = modelId;
    _data['uuid'] = uuid;
    _data['collection_name'] = collectionName;
    _data['name'] = name;
    _data['file_name'] = fileName;
    _data['mime_type'] = mimeType;
    _data['disk'] = disk;
    _data['conversions_disk'] = conversionsDisk;
    _data['size'] = size;
    _data['manipulations'] = manipulations;
    _data['custom_properties'] = customProperties;
    _data['generated_conversions'] = generatedConversions;
    _data['responsive_images'] = responsiveImages;
    _data['order_column'] = orderColumn;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['original_url'] = originalUrl;
    _data['preview_url'] = previewUrl;
    return _data;
  }
}

class User {
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
    this.about,
    this.fcmToken,
    required this.verified,
    required this.createdAt,
    required this.updatedAt,
    this.language,
    this.isSports,
    this.isAlcohol,
    this.wantChild,
    this.hasChild,
    this.isSmoker,
    this.lat,
    this.lng,
    this.userImage,
    required this.media,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String contact;
  late final String gender;
  late final String height;
  late final String age;
  late final String relationShip;
  late final String city;
  late final String dob;
  late final String token;
  late final String? about;
  late final Null fcmToken;
  late final int verified;
  late final String createdAt;
  late final String updatedAt;
  late final String? language;
  late final String? isSports;
  late final String? isAlcohol;
  late final String? wantChild;
  late final String? hasChild;
  late final String? isSmoker;
  late final Null lat;
  late final Null lng;
  late final String? userImage;
  late final List<Media> media;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    gender = json['gender'];
    height = json['height'];
    age = json['age'];
    relationShip = json['relation_ship'];
    city = json['city'];
    dob = json['dob'];
    token = json['token'];
    about = null;
    fcmToken = null;
    verified = json['verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    language = null;
    isSports = null;
    isAlcohol = null;
    wantChild = null;
    hasChild = null;
    isSmoker = null;
    lat = null;
    lng = null;
    userImage = null;
    media = List.from(json['media']).map((e)=>Media.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['contact'] = contact;
    _data['gender'] = gender;
    _data['height'] = height;
    _data['age'] = age;
    _data['relation_ship'] = relationShip;
    _data['city'] = city;
    _data['dob'] = dob;
    _data['token'] = token;
    _data['about'] = about;
    _data['fcm_token'] = fcmToken;
    _data['verified'] = verified;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['language'] = language;
    _data['is_sports'] = isSports;
    _data['is_alcohol'] = isAlcohol;
    _data['want_child'] = wantChild;
    _data['has_child'] = hasChild;
    _data['is_smoker'] = isSmoker;
    _data['lat'] = lat;
    _data['lng'] = lng;
    _data['user_image'] = userImage;
    _data['media'] = media.map((e)=>e.toJson()).toList();
    return _data;
  }
}