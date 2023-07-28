// import 'package:clothing/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../pref/shared_pref_controller.dart';
//
// class TestHomeScreen extends StatelessWidget {
//   const TestHomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('home'),
//         backgroundColor: const Color(ColorManager.mainColor),
//         actions: [
//           IconButton(
//             onPressed: () {
//               _showConfirmLogoutDialog(context);
//             },
//             icon: const Icon(Icons.logout),
//           )
//         ],
//       ),
//     );
//   }
//
//   void _showConfirmLogoutDialog(BuildContext context) async {
//     bool? result = await showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) {
//         return AlertDialog(
//           // contentTextStyle: ,
//           // titleTextStyle: ,
//           title: Text(
//             'Logging Out',
//             style: GoogleFonts.tajawal(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           content: Text(
//             'Are you sure?',
//             style: GoogleFonts.tajawal(
//               fontSize: 14,
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context, false);
//               },
//               child: Text(
//                 'Cancel',
//                 style: GoogleFonts.tajawal(),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context, true);
//               },
//               child: Text(
//                 'Logout',
//                 style: GoogleFonts.tajawal(
//                   color: Colors.red.shade600,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//     if(result ?? false){
//       // await SharedPrefController().removeValueFor(PrefKeys.loggedIn.name);
//       SharedPrefController().setValue(PrefKeys.loggedIn.name, false);
//       Future.delayed(
//           const Duration(milliseconds: 500), () =>
//           Navigator.pushReplacementNamed(context, '/login_screen')
//       );
//     }
//   }
// }
//
