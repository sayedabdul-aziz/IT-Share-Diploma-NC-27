import 'package:calculator_app/core/constants.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  ResultView({super.key, required this.result});
  double result;

  String getClassification(result) {
    if (result > 18.5 && result < 25) {
      return 'Normal';
    } else {
      return 'Obese Class III';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackground,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColor.scaffoldBackground,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getClassification(result),
                      style:
                          TextStyle(fontSize: 30, color: AppColor.whiteColor),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      result.toStringAsFixed(2),
                      style:
                          TextStyle(fontSize: 40, color: AppColor.whiteColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // w/h*h

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultView(
                            result: result,
                          )));
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 10),
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Re-Calculate',
                    style: TextStyle(
                        color: AppColor.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
