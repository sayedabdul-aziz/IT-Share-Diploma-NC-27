import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:muslim_pro/core/app_color.dart';
import 'package:muslim_pro/core/functions.dart';
import 'package:muslim_pro/feature/sebha/data/data.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text(
            'السبحة الالكترونية',
            // style: GoogleFonts.kufam(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CarouselSlider(
              items: [
                for (int i = 0; i < sebhaTitle.length; i++)
                  ZekrItemView(
                      zekr: sebhaTitle[i], desc: sebhaSub[i], counter: count[i])
              ],
              options: CarouselOptions(
                  height: double.infinity, viewportFraction: .88)),
        ),
      ),
    );
  }
}

class ZekrItemView extends StatefulWidget {
  ZekrItemView(
      {super.key,
      required this.zekr,
      required this.desc,
      required this.counter});
  final String zekr;
  final String desc;
  int counter;
  @override
  State<ZekrItemView> createState() => _ZekrItemViewState();
}

class _ZekrItemViewState extends State<ZekrItemView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppStyle.cardColor3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.zekr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const Divider(endIndent: 20, indent: 20, thickness: 3),
                  Text(
                    widget.desc,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: Center(child: LoaderWidget(count: widget.counter))),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (widget.counter == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('احسنت ! '),
                              action: SnackBarAction(
                                label: 'اعادة التسبيح',
                                onPressed: () {
                                  setState(() {
                                    widget.counter = 100;
                                  });
                                },
                              ),
                            ),
                          );
                        } else {
                          setState(() {
                            widget.counter--;
                          });
                        }

                        print(widget.counter);
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppStyle.cardColor1,
                        radius: 40,
                        child: Text(
                          'تسبيح',
                          style: TextStyle(color: AppStyle.titleBlack),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.counter = 100;
                        });
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppStyle.cardColor1,
                        radius: 40,
                        child: Text(
                          'اعادة\n التسبيح',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppStyle.titleBlack),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoaderWidget extends StatefulWidget {
  const LoaderWidget({super.key, required this.count});
  final int count;

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .36,
      child: FittedBox(
        child: CircularPercentIndicator(
          radius: 100.0,
          progressColor: AppStyle.cardColor2,
          lineWidth: 11.0,
          backgroundWidth: 10.0,
          percent: widget.count / 100,
          center: Text(
            AppFunctions.replaceFarsiNumber(widget.count.toString()),
            style: Theme.of(context).textTheme.displayMedium,
          ),
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: AppStyle.cardColor3,
        ),
      ),
    );
  }
}
