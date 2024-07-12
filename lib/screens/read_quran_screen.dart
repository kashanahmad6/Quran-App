// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:quran_app/consts.dart/consts.dart';
import 'package:quran_app/model/quran_model.dart';
import 'package:quran_app/provider/api_provider.dart';
import 'package:quran_app/widgets/ayat_container.dart';
import 'package:quran_app/widgets/reusable_top_bar.dart';

// ignore: must_be_immutable
class ReadQuranScreen extends StatefulWidget {
  Quran quran;
  ReadQuranScreen({
    super.key,
    required this.quran,
  });

  @override
  State<ReadQuranScreen> createState() => _ReadQuranScreenState();
}

class _ReadQuranScreenState extends State<ReadQuranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              ReusableTopBar(
                title: 'Quran',
                iconurl: 'assets/images/backarrow.svg',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.quran.englishName,
                        style: GoogleFonts.poppins(
                          textStyle: quranTitleStyle.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Verse ${widget.quran.ayahs.length}',
                        style: GoogleFonts.poppins(
                            textStyle: quranTitleStyle.copyWith(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        '(${widget.quran.englishNameTranslation})',
                        style: GoogleFonts.poppins(
                            textStyle: quranTitleStyle.copyWith(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/share_icon.svg'),
                      const SizedBox(
                        width: 30,
                      ),
                      SvgPicture.asset('assets/images/play_icon.svg'),
                      const SizedBox(
                        width: 30,
                      ),
                      SvgPicture.asset('assets/images/saved_icon.svg'),
                      const SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: Consumer<ApiProvider>(
                builder: (context, ref, child) {
                  return ListView.builder(
                    itemCount: widget.quran.ayahs.length,
                    itemBuilder: (context, index) {
                      final arabic = widget.quran.ayahs[index];
                      return AyatContainer(
                        ayat: arabic.text,
                      );
                    },
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
