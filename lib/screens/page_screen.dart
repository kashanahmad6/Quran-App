import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:quran_app/consts.dart/consts.dart';
import 'package:quran_app/provider/api_provider.dart';
import 'package:quran_app/widgets/ayat_container.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, value, child) {
        if (value.allSurahsCombine.isNotEmpty) {
          return ListView.builder(
              itemCount: value.allSurahsCombine.length,
              itemBuilder: (context, index) {
                final surahs = value.allSurahsCombine[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(surahs.name,
                        textAlign: TextAlign.end,
                        softWrap: true,
                        style: arbiStyle),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: value.allSurahsCombine[index].ayahs.length,
                        itemBuilder: (context, indx) {
                          final ayah =
                              value.allSurahsCombine[index].ayahs[indx];
                          return AyatContainer(ayat: ayah.text);
                        }),
                  ],
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
