// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quran_app/consts.dart/consts.dart';

class AyatContainer extends StatelessWidget {
  final String ayat;
  // final String translation;
  const AyatContainer({
    super.key,
    required this.ayat,
    // required this.translation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(ayat,
          textAlign: TextAlign.end, softWrap: true, style: arbiStyle),
    );
  }
}


//  Column(
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     Text(ayat, style: arbiStyle),
      //     const SizedBox(
      //       height: 19,
      //     ),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Text(
      //           translation,
      //           style: arbiTranslationStyle,
      //           textAlign: TextAlign.center,
      //         ),
      //       ],
      //     )