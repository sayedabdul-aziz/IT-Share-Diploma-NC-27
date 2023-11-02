import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_pro/core/app_color.dart';
import 'package:muslim_pro/core/functions.dart';
import 'package:muslim_pro/feature/azkar/azkar_model/azkar_model.dart';
import 'package:muslim_pro/feature/azkar/view/azkar_details_view.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'الاذكار والادعية',
          // style: GoogleFonts.kufam(),
        ),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/azkar.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List res = json.decode(snapshot.data.toString());
            List<AzkarModel> azkar =
                res.map((zekr) => AzkarModel.fromJson(zekr)).toList();

            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //       fit: BoxFit.cover,
            //       image: AssetImage(
            //         'assets/images/big-background.png',
            //       ))),
            return azkar.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(10),
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AzkarDetailsView(
                                    body: azkar[index].body!,
                                    title: azkar[index].category!),
                              ));
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
                            title: Text(
                              azkar[index].category ?? '',
                              style: GoogleFonts.kufam(),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: azkar.length),
                  );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: AppStyle.cardColor2,
            ));
          }
        },
      ),
    );
  }
}
