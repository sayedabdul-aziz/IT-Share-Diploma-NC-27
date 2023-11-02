import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_pro/core/app_color.dart';
import 'package:muslim_pro/core/functions.dart';
import 'package:muslim_pro/feature/azkar/azkar_model/body.dart';

class AzkarDetailsView extends StatelessWidget {
  const AzkarDetailsView({super.key, required this.body, required this.title});
  final List<Body> body;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 13,
                  backgroundColor: AppStyle.cardColor1,
                  child: Text(
                    AppFunctions.replaceFarsiNumber((index + 1).toString()),
                    style: const TextStyle(
                        color: AppStyle.titleBlack,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                title: Text(
                  body[index].zekr ?? '',
                  style: GoogleFonts.kufam(),
                ),
                subtitle: Text(
                  body[index].description ?? '',
                  style: GoogleFonts.kufam(),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: body.length),
      ),
    );
  }
}
