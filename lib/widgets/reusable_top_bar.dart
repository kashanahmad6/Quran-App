// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:quran_app/consts.dart/consts.dart';
import 'package:quran_app/provider/search_bar_provider.dart';

// ignore: must_be_immutable
class ReusableTopBar extends StatelessWidget {
  final String title;
  final String iconurl;
  final Widget? searchBar;
  void Function()? onTap;

  ReusableTopBar({
    super.key,
    required this.title,
    required this.iconurl,
    this.searchBar,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SearchBarProvider>(context, listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // state.showSearchField ? const Text('') :
        GestureDetector(onTap: onTap, child: SvgPicture.asset(iconurl)),
        const SizedBox(
          width: 15,
        ),
        Text(
          state.showSearchField ? '' : title,
          style: GoogleFonts.poppins(textStyle: quranTitleStyle),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          child: searchBar,
        ),
      ],
    );
  }
}
