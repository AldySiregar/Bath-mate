// import 'dart:convert';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:firebase/Screen/drawer.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/services.dart';

// double lat = 0;
// double long = 0;

// class MapPage extends StatefulWidget {
//   const MapPage({super.key});

//   @override
//   State<MapPage> createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   final _database = FirebaseDatabase.instance.ref();
//   late StreamSubscription _bathmate;

//   void initState() {
//     super.initState();
//     _activateListeners();
//     // LatLng _pGoolePlex = LatLng(lat, long);
//   }

//   void _activateListeners() {
//     _bathmate = _database.child('lat').onValue.listen((event) {
//       final fblat = event.snapshot.value;
//       setState(() {
//         String latString = '$fblat';
//         lat = double.parse(latString);
//       });
//     });
//     _bathmate = _database.child('long').onValue.listen((event) {
//       final fblong = event.snapshot.value;
//       setState(() {
//         String longString = '$fblong';
//         long = double.parse(longString);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Color.fromARGB(255, 0, 114, 171),
//         centerTitle: true,
//         title: Text(
//           "Radar's Location",
//           style: GoogleFonts.poppins(
//             textStyle: const TextStyle(
//                 fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//         ),
//       ),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: LatLng(lat, long),
//           zoom: 13,
//         ),
//         markers: {
//           Marker(
//             markerId: MarkerId(
//               "_currentLocation",
//             ),
//             icon: BitmapDescriptor.defaultMarker,
//             position: LatLng(lat, long),
//           ),
//         },
//       ),
//       drawer: MyDrawer(),
//     );
//   }
// }
