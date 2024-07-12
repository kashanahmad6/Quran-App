// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:quran_app/consts.dart/consts.dart';
// import 'package:quran_app/provider/api_provider.dart';
// import 'package:quran_app/screens/read_quran_screen.dart';

// class ParahScreen extends StatelessWidget {
//   const ParahScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ApiProvider>(
//       builder: (context, value, child) {
//         if (value.surahslist.isNotEmpty) {
//           return ListView.builder(
//               itemCount: value.surahslist.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) {
//                               return const ReadQuranScreen();
//                             }),
//                           );
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               children: [
//                                 Text(
//                                   value.surahslist[index].englishName,
//                                   style: GoogleFonts.poppins(
//                                     textStyle: quranTitleStyle.copyWith(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 8,
//                                 ),
//                                 Text(
//                                   'Verse ${value.surahslist[index].ayahs.length}',
//                                   style: GoogleFonts.poppins(
//                                       textStyle: quranTitleStyle.copyWith(
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                                 const SizedBox(
//                                   height: 6,
//                                 ),
//                                 Text(
//                                   '(${value.surahslist[index].englishNameTranslation})',
//                                   style: GoogleFonts.poppins(
//                                       textStyle: quranTitleStyle.copyWith(
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                               ],
//                             ),
//                             Text(
//                               value.surahslist[index].name,
//                               style: GoogleFonts.poppins(
//                                 textStyle: quranTitleStyle.copyWith(
//                                     fontSize: 24, fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Divider(
//                         thickness: 1,
//                         color: text1Color,
//                       ),
//                     ],
//                   ),
//                 );
//               });
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }
