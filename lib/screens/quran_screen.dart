import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/consts.dart/consts.dart';
import 'package:quran_app/screens/page_screen.dart';
import 'package:quran_app/widgets/last_read_container.dart';

import 'package:quran_app/widgets/reusable_top_bar.dart';
import 'package:quran_app/screens/surah_screen.dart';
import 'package:quran_app/widgets/search_bar.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen>
    with TickerProviderStateMixin {
  // late TabController tabController;
  @override
  void initState() {
    super.initState();

    // tabController = TabController(length: 2, vsync: this);
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   tabController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backGroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 18, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                ReusableTopBar(
                  title: 'Quran App',
                  iconurl: 'assets/images/menu.svg',
                  searchBar: const MySearchBar(),
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  'Asalamu Alaikum !!!',
                  style: GoogleFonts.poppins(textStyle: text1Style),
                ),
                Text(
                  'Kashan Ahmad',
                  style: GoogleFonts.poppins(
                      textStyle: quranTitleStyle.copyWith(fontSize: 18)),
                ),
                const SizedBox(
                  height: 35,
                ),
                const LastReadContainer(),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  child: TabBar(
                    // controller: tabController,
                    tabs: [
                      Text(
                        'Surah',
                        style: GoogleFonts.poppins(
                          textStyle: quranTitleStyle.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        'page',
                        style: GoogleFonts.poppins(
                          textStyle: quranTitleStyle.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Expanded(
                  child: TabBarView(
                    // controller: tabController,
                    children: [
                      SurahScreen(),
                      PageScreen(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: fillcolor,
                      child: SvgPicture.asset('assets/images/quran1.svg'),
                    ),
                    CircleAvatar(
                      radius: 33,
                      backgroundColor: const Color(0xff300759),
                      child: SvgPicture.asset('assets/images/quran.svg'),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: fillcolor,
                      child: SvgPicture.asset('assets/images/mosque.svg'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
