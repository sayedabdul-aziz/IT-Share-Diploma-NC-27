import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_pro/core/app_color.dart';
import 'package:muslim_pro/core/functions.dart';
import 'package:muslim_pro/feature/quran/quran_model/quran_model.dart';
import 'package:muslim_pro/feature/quran/quran_page_view.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text(
            'القران الكريم',
            // style: GoogleFonts.kufam(),
          ),
        ),
        body: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/quran.json'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List res = json.decode(snapshot.data.toString());
              List<QuranModel> quran =
                  res.map((zekr) => QuranModel.fromJson(zekr)).toList();
              print(quran[0].name);
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //       fit: BoxFit.cover,
              //       image: AssetImage(
              //         'assets/images/big-background.png',
              //       ))),
              return quran.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Container(
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(10),
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => QuranPageView(
                                          surahPage:
                                              quran[index].ayahs![0].page ?? 0,
                                        )));
                              },
                              leading: CircleAvatar(
                                radius: 13,
                                backgroundColor: AppStyle.cardColor1,
                                child: Text(
                                  AppFunctions.replaceFarsiNumber(
                                      (index + 1).toString()),
                                  style: const TextStyle(
                                      color: AppStyle.titleBlack,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              title: SvgPicture.asset(
                                'assets/surah_name/00${quran[index].number}.svg',
                                alignment: Alignment.centerRight,
                                width: 120,
                                color: Colors.black,
                              ),
                              subtitle: Text(
                                quran[index].revelationType ?? '',
                                style: GoogleFonts.kufam(),
                              ),
                              trailing: Text(
                                'اياتها : ${quran[index].ayahs?.length.toString() ?? ''}',
                                style: GoogleFonts.kufam(),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: quran.length),
                    );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppStyle.cardColor2,
              ));
            }
          },
        ),
      ),
    );
  }
}
