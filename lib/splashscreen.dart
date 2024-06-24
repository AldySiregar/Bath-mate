// import 'package:firebase/welcome.dart';
// import 'package:firebase/welcome.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

//     Future.delayed(Duration(seconds: 2), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (_) => const Welcome(),
//         ),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: SystemUiOverlay.values); // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//           colors: [Colors.red, Colors.blueGrey],
//           begin: Alignment.topRight,
//           end: Alignment.bottomLeft,
//         )),
//         child: Column(
//           children: [
//             Image.asset('assets/aduhh.png'),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               'coba',
//               style: TextStyle(
//                 fontStyle: FontStyle.italic,
//                 fontSize: 32,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
