import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/consts.dart/consts.dart';

import 'package:quran_app/provider/api_provider.dart';
import 'package:quran_app/screens/quran_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Provider.of<ApiProvider>(context, listen: false).getSurahs();
    // ignore: use_build_context_synchronously
    await Provider.of<ApiProvider>(context, listen: false).getcompleteQuran();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backGroundColor,
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Text(
                    'Quran App',
                    style: GoogleFonts.poppins(textStyle: quranTitleStyle),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Learn Quran every day and ',
                    style: GoogleFonts.poppins(textStyle: text1Style),
                  ),
                  Text(
                    'recite once everyday',
                    style: GoogleFonts.poppins(textStyle: text1Style),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 450,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: quranTitleColor,
                  image: const DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      'assets/images/mosque.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 105,
          top: 670,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(text1Color),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const QuranScreen();
                }));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Get started',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 230, 221, 237))),
                ),
              )),
        )
      ]),
    );
  }
}
