import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/consts.dart/consts.dart';
import 'package:quran_app/provider/api_provider.dart';
import 'package:quran_app/screens/read_quran_screen.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(builder: (context, value, child) {
      return value.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: value.filteredList.length,
              itemBuilder: (context, index) {
                final surah = value.filteredList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return ReadQuranScreen(
                                quran: surah,
                              );
                            }),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  surah.englishName,
                                  style: GoogleFonts.poppins(
                                    textStyle: quranTitleStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Verse ${surah.ayahs.length}',
                                  style: GoogleFonts.poppins(
                                      textStyle: quranTitleStyle.copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  '(${surah.englishNameTranslation})',
                                  style: GoogleFonts.poppins(
                                      textStyle: quranTitleStyle.copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            Text(
                              surah.name,
                              style: GoogleFonts.poppins(
                                textStyle: quranTitleStyle.copyWith(
                                    fontSize: 24, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        color: text1Color,
                      ),
                    ],
                  ),
                );
              });
    });
  }
}
