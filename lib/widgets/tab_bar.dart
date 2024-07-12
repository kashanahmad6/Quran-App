import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/consts.dart/consts.dart';

class ReusableTabBar extends StatefulWidget {
  const ReusableTabBar({super.key});

  @override
  State<ReusableTabBar> createState() => _ReusableTabBarState();
}

class _ReusableTabBarState extends State<ReusableTabBar>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
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
    );
  }
}
