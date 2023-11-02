import 'package:flutter/material.dart';

class QuranPageView extends StatefulWidget {
  QuranPageView({super.key, required this.surahPage});
  int surahPage;

  @override
  State<QuranPageView> createState() => _QuranPageViewState();
}

class _QuranPageViewState extends State<QuranPageView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: PageView.builder(
            controller: PageController(initialPage: widget.surahPage),
            scrollDirection: Axis.horizontal,
            itemCount: 604,
            onPageChanged: (value) {
              setState(() {
                widget.surahPage = value;
              });
            },
            itemBuilder: (context, index) {
              //assets\quran-images\page253.png
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        'assets/quran-images/page${widget.surahPage}.png'),
                    Text(widget.surahPage.toString())
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
