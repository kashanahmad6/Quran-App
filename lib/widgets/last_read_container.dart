import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/consts.dart/consts.dart';

class LastReadContainer extends StatelessWidget {
  const LastReadContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: fillcolor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.menu_book_rounded),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Last Read',
                      style: GoogleFonts.poppins(
                        textStyle: quranTitleStyle.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Al-Fatiah',
                  style: GoogleFonts.poppins(
                      textStyle: quranTitleStyle.copyWith(
                          fontSize: 13, fontWeight: FontWeight.w700)),
                ),
                Text(
                  'Ayah no. 1',
                  style: GoogleFonts.poppins(
                      textStyle: quranTitleStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            SvgPicture.asset('assets/images/flag.svg'),
          ],
        ),
      ),
    );
  }
}
