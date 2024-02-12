// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class InternetCheckScreen extends StatefulWidget {
//   @override
//   _InternetCheckScreenState createState() => _InternetCheckScreenState();
// }
//
// class _InternetCheckScreenState extends State<InternetCheckScreen> {
//   bool _isConnected = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _checkInternet();
//   }
//
//   Future<void> _checkInternet() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.none) {
//       setState(() {
//         _isConnected = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _isConnected ? TwoScreen() : FirstScreen();
//   }
// }
//
// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('First Screen'),
//       ),
//       body: Center(
//         child: Text('First Screen - No Internet'),
//       ),
//     );
//   }
// }
//
// class TwoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Two Screen'),
//       ),
//       body: Center(
//         child: Text('Two Screen - Internet Available'),
//       ),
//     );
//   }
// }