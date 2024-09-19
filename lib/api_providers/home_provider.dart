// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;
//
// import 'package:docmobile/get_storage/get_storage_controller.dart';
// import 'package:docmobile/models/api_models/doctorHome.dart';
// import 'package:docmobile/models/api_models/doctor_call_model.dart';
// import 'package:docmobile/models/api_models/doctor_profile.dart';
// import 'package:docmobile/models/api_models/get_appointments_model.dart';
// import 'package:docmobile/models/api_models/get_calanders.dart';
// import 'package:docmobile/models/api_models/get_pricing.dart';
// import 'package:docmobile/models/api_models/message_model.dart';
// import 'package:docmobile/models/api_models/nearby_patients.dart';
// import 'package:docmobile/models/api_models/patient_payment_history.dart';
// import 'package:docmobile/models/api_models/pricing_list_model.dart';
// import 'package:docmobile/reusable_widgets/dialogs/appDialogeBoxes.dart';
// import 'package:docmobile/services/dio/dio_nertwork_service.dart';
// import 'package:docmobile/utils/api_urls/app_urls.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
//
// import '../models/api_models/doctor_pricing_history.dart';
// import '../screens/patient/profile/patient_payment_history.dart';
//
// class DoctorHomeProvider {
//   DoctorHomeProvider._();
//
//   static final DoctorHomeProvider _instance = DoctorHomeProvider._();
//
//   factory DoctorHomeProvider() {
//     return _instance;
//   }
//
//   final DioNetworkService _dioNetworkService = DioNetworkService();
//
//   Future<NearbyPatients?> nearbyPatients() async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.get(
//           requestURL: AppUrl.nearbyPatients, header: headers);
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         log(jsonEncode(data));
//         return NearbyPatients.fromJson(data);
//       }
//     } catch (e) {
//       return null;
//     }
//     return null;
//   }
//
//   Future<DoctorHome?> doctorsHome() async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.get(
//           requestURL: AppUrl.doctorHome, header: headers);
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         log(jsonEncode(data));
//         return DoctorHome.fromJson(data);
//       }
//     } catch (e) {
//       return null;
//     }
//     return null;
//   }
//
//   Future<DoctorProfile?> doctorProfile() async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.get(
//           requestURL: AppUrl.doctorProfile, header: headers);
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         log(jsonEncode(data));
//         return DoctorProfile.fromJson(data);
//       }
//     } catch (e) {
//       return null;
//     }
//     return null;
//   }
//
//   Future<GetAppointments?> doctorAppointments() async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.get(
//           requestURL: AppUrl.doctorAppointments, header: headers);
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         log(jsonEncode(data));
//         return GetAppointments.fromJson(data);
//       }
//     } catch (e) {
//       return null;
//     }
//     return null;
//   }
//
//   doctorDelete() async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.post(
//           requestURL: AppUrl.doctorDelete, header: headers);
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         Get.find<StorageController>().removeStorage();
//       }
//     } catch (e) {
//       return null;
//     }
//     return null;
//   }
//
//   doctorLogout() async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.post(
//           requestURL: AppUrl.doctorLogout, header: headers);
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         Get.find<StorageController>().removeStorage();
//       }
//     } catch (e) {
//       return null;
//     }
//     return null;
//   }
//
//   Future<bool> doctorProfileUpdate({
//     required String email,
//     required String pin,
//     required String name,
//     required String lastName,
//     required String phoneNumber,
//     required String dob,
//     required String gender,
//     required String address,
//     required String country,
//     required String licenseNo,
//     required String graduation,
//     required String yearOfGraduation,
//     required String nameOfUniversity,
//     required String yearOfExperience,
//     required String specialty,
//     required String? profilePath,
//     required String? degreeImagePath,
//     required String? photoidPath,
//   }) async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       var data = dio.FormData.fromMap({
//         if (profilePath != null)
//           'profile_pic': [
//             await dio.MultipartFile.fromFile(profilePath ?? '',
//                 filename: profilePath),
//           ],
//         if (photoidPath != null)
//           'photo_id': [
//             await dio.MultipartFile.fromFile(photoidPath ?? '',
//                 filename: photoidPath),
//           ],
//         if (degreeImagePath != null)
//           'degree_image': [
//             await dio.MultipartFile.fromFile(degreeImagePath ?? '',
//                 filename: degreeImagePath),
//           ],
//         'name': name,
//         'last_name': lastName,
//         'phone_number': phoneNumber,
//         'dob': dob,
//         'gender': gender,
//         'email': email,
//         'address': address,
//         'country': country,
//         'pin': pin,
//         'graduation': graduation,
//         'yearOfGraduation': yearOfGraduation,
//         'nameOfUniversity': nameOfUniversity,
//         'yearOfExperience': yearOfExperience,
//         'licenseno': licenseNo,
//         'specialty': specialty,
//       });
//
//       final response = await _dioNetworkService.dio.request(
//         AppUrl.doctorProfileUpdate,
//         options: dio.Options(
//           method: 'POST',
//           headers: headers,
//         ),
//         data: data,
//       );
//
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         log(jsonEncode(data));
//         return true;
//       } else {
//         if (response.data['email'] != null &&
//             (response.data['email'] as List).isNotEmpty) {
//           final errorMessage = response.data['email'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['message'] == 'Some error occur') {
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: "Server Error");
//           return false;
//         } else if (response.data['pin'] != null &&
//             (response.data['pin'] as List).isNotEmpty) {
//           final errorMessage = response.data['pin'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['graduation'] != null &&
//             (response.data['graduation'] as List).isNotEmpty) {
//           final errorMessage = response.data['graduation'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['yearOfGraduation'] != null &&
//             (response.data['yearOfGraduation'] as List).isNotEmpty) {
//           final errorMessage = response.data['yearOfGraduation'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['nameOfUniversity'] != null &&
//             (response.data['nameOfUniversity'] as List).isNotEmpty) {
//           final errorMessage = response.data['nameOfUniversity'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['yearOfExperience'] != null &&
//             (response.data['yearOfExperience'] as List).isNotEmpty) {
//           final errorMessage = response.data['yearOfExperience'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['licenseno'] != null &&
//             (response.data['licenseno'] as List).isNotEmpty) {
//           final errorMessage = response.data['licenseno'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['gender'] != null &&
//             (response.data['gender'] as List).isNotEmpty) {
//           final errorMessage = response.data['gender'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['dob'] != null &&
//             (response.data['dob'] as List).isNotEmpty) {
//           final errorMessage = response.data['dob'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['dob'] != null &&
//             (response.data['dob'] as List).isNotEmpty) {
//           final errorMessage = response.data['dob'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         }
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//     return false;
//   }
//
//   Future<bool> doctorSupportHelp({
//     required String email,
//     required String subject,
//     required String description,
//     required String file,
//   }) async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.post(
//         requestURL: AppUrl.doctorSupportHelp,
//         header: headers,
//         bodyParameters: {
//           'email': email,
//           'subject': subject,
//           'description': description,
//         },
//         multiFileParameters: {
//           // 'file': file,
//         },
//       );
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         log(jsonEncode(data));
//         return true;
//       } else {
//         if (response.data['email'] != null &&
//             (response.data['email'] as List).isNotEmpty) {
//           final errorMessage = response.data['email'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['message'] == 'Some error occur') {
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: "Server Error");
//           return false;
//         } else if (response.data['subject'] != null &&
//             (response.data['subject'] as List).isNotEmpty) {
//           final errorMessage = response.data['subject'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['description'] != null &&
//             (response.data['description'] as List).isNotEmpty) {
//           final errorMessage = response.data['description'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['file'] != null &&
//             (response.data['file'] as List).isNotEmpty) {
//           final errorMessage = response.data['file'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         }
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//     return false;
//   }
//
//   Future<GetCalander?> doctorGetCalander() async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.get(
//           requestURL: AppUrl.doctorGetCalander, header: headers);
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         log(jsonEncode(data));
//         return GetCalander.fromJson(data);
//       }
//     } catch (e) {
//       return null;
//     }
//     return null;
//   }
//
//   Future<bool> doctorPricingUpdate({
//     required String price,
//     required String bank_name,
//     required String bank_account_number,
//     required String bank_address,
//     required String moncash_account_name,
//     required String moncash_account_number,
//     required String bank_routing_number,
//   }) async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.post(
//         requestURL: AppUrl.doctorPricingUpdate,
//         header: headers,
//         bodyParameters: {
//           'price': price,
//           'bank_routing_number': bank_routing_number,
//           'bank_name': bank_name,
//           'bank_address': bank_address,
//           'bank_account_number': bank_account_number,
//           'moncash_account_name': moncash_account_name,
//           if (moncash_account_number != '')
//             'moncash_account_number': moncash_account_number,
//         },
//       );
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         log(jsonEncode(data));
//         return true;
//       } else {
//         if (response.data['price'] != null &&
//             (response.data['price'] as List).isNotEmpty) {
//           final errorMessage = response.data['price'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['message'] == 'Some error occur') {
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: "Server Error");
//           return false;
//         } else if (response.data['bank_name'] != null &&
//             (response.data['bank_name'] as List).isNotEmpty) {
//           final errorMessage = response.data['bank_name'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['bank_address'] != null &&
//             (response.data['bank_address'] as List).isNotEmpty) {
//           final errorMessage = response.data['bank_address'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['bank_account_number'] != null &&
//             (response.data['bank_account_number'] as List).isNotEmpty) {
//           final errorMessage = response.data['bank_account_number'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['moncash_account_name'] != null &&
//             (response.data['moncash_account_name'] as List).isNotEmpty) {
//           final errorMessage = response.data['moncash_account_name'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         } else if (response.data['moncash_account_number'] != null &&
//             (response.data['moncash_account_number'] as List).isNotEmpty) {
//           final errorMessage = response.data['moncash_account_number'][0];
//           kDialouge.show_snackBarMessage(
//               title: "Attention", description: errorMessage);
//           return false;
//         }
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//     return false;
//   }
//
//   Future<GetPricing?> doctorGetPricing() async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.get(
//           requestURL: AppUrl.doctorGetPricing, header: headers);
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         log(jsonEncode(data));
//         return GetPricing.fromJson(data);
//       }
//     } catch (e) {
//       return null;
//     }
//     return null;
//   }
//
//   Future<bool> doctorCalanderUpdate({
//     required String monday,
//     required String monday_start,
//     required String monday_end,
//     required String tuesday,
//     required String tuesday_start,
//     required String tuesday_end,
//     required String wednesday,
//     required String wednesday_start,
//     required String wednesday_end,
//     required String thursday,
//     required String thursday_start,
//     required String thursday_end,
//     required String friday,
//     required String friday_start,
//     required String friday_end,
//     required String saturday,
//     required String saturday_start,
//     required String saturday_end,
//     required String sunday,
//     required String sunday_start,
//     required String sunday_end,
//   }) async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.post(
//         requestURL: AppUrl.doctorCalanderUpdate,
//         header: headers,
//         bodyParameters: {
//           'monday': monday,
//           'monday_start': monday_start,
//           'monday_end': monday_end,
//           'tuesday': tuesday,
//           'tuesday_start': tuesday_start,
//           'tuesday_end': tuesday_end,
//           'wednesday': wednesday,
//           'wednesday_start': wednesday_start,
//           'wednesday_end': wednesday_end,
//           'thursday': thursday,
//           'thursday_start': thursday_start,
//           'thursday_end': thursday_end,
//           'friday': friday,
//           'friday_start': friday_start,
//           'friday_end': friday_end,
//           'saturday': saturday,
//           'saturday_start': saturday_start,
//           'saturday_end': saturday_end,
//           'sunday': sunday,
//           'sunday_start': sunday_start,
//           'sunday_end': sunday_end
//         },
//       );
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         log(jsonEncode(data));
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
//
//   Future<DoctorCallModel?> doctorCall({required upcomingId}) async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.get(
//           requestURL: "/doctor/video/$upcomingId/call", header: headers);
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         return DoctorCallModel.fromJson(data);
//       }
//     } catch (e) {
//       return null;
//     }
//     return null;
//   }
//
//   Future<MessageModel?> doctorSendMessage(
//       {required upcomingId, required message,required image}) async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//
//       var request = http.MultipartRequest('POST', Uri.parse('https://portal.docmobilapp.com/api/doctor/message/$upcomingId/send'));
//       debugPrint("<============================Parameter send to api Start=================================>");
//       debugPrint("<============================Image is:$image=================================>");
//       debugPrint("<============================Message is:$message=================================>");
//       debugPrint("<============================Parameter send to api End=================================>");
//       request.fields.addAll({
//         'message': message.toString().isEmpty?'empty': message
//       });
//       if(image.toString().isNotEmpty) {
//         request.files.add(await http.MultipartFile.fromPath('file', image));
//       }
//       request.headers.addAll(headers);
//
//       http.StreamedResponse response = await request.send();
//
//       if (response.statusCode == 200) {
//         print(await response.stream.bytesToString());
//       }
//       else {
//         print(response.reasonPhrase);
//       }
//       print("<----------------------Response ${response.statusCode}------------------------>");
//
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//     return null;
//   }
//
//   Future<MessageModel?> doctorGetMessage({required upcomingId}) async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.get(
//           requestURL: "/doctor/message/$upcomingId/list", header: headers);
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         return MessageModel.fromJson(data);
//       }
//     } catch (e) {
//       return null;
//     }
//     return null;
//   }
//
//   Future<bool> reScheduleAppointment(
//       {required id, required date, required time}) async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.post(
//           requestURL: "/doctor/appointment/$id/reschedule",
//           header: headers,
//           bodyParameters: {'rescheduleDate': date, 'rescheduleTime': time});
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         debugPrint(jsonEncode(data));
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       return false;
//     }
//   }
//
//   Future<bool> cancelAppointment({required id, required context}) async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.post(
//           requestURL: "/doctor/appointment/$id/cancel", header: headers);
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         debugPrint(jsonEncode(data));
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       return false;
//     }
//   }
//
//   Future<PricingList?> doctorPricingList() async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.get(
//           requestURL: AppUrl.doctorPricingList, header: headers);
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         return PricingList.fromJson(data);
//       }
//     } catch (e) {
//       return null;
//     }
//     return null;
//   }
//
//   Future<PatientPaymentHistory?> doctorPaymentHistory() async {
//     try {
//       var headers = {
//         'Authorization':
//             'Bearer ${Get.find<StorageController>().getDoctorLoginModel()!.token}'
//       };
//       final response = await _dioNetworkService.get(
//           requestURL: AppUrl.doctorPaymentHistory, header: headers);
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         final data = response.data;
//         return PatientPaymentHistory.fromJson(data);
//       }
//     } catch (e) {
//       return null;
//     }
//     return null;
//   }
// }
