// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// class LocationService {
//   Future<Position?> getCurrentLocation() async {
//     // Check if location services are enabled
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled
//       return Future.error('Location services are disabled.');
//     }
//
//     LocationPermission permission = await Geolocator.checkPermission();
//
//     if (permission == LocationPermission.denied) {
//       // Request permission again if denied
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied
//         return Future.error('Location permissions are denied.');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are permanently denied
//       return Future.error('Location permissions are permanently denied.');
//     }
//     // If permission is granted, get the current position
//     return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   }
// }