import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iqgeneral/controller/getcontroller.dart';
import 'package:iqgeneral/core/constants.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});

  final getcontroller = Get.put(Cryptocontroller());

  bool starvalue = true;

  @override
  Widget build(BuildContext context) {
    // print(getcontroller.livedata);

    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                width: screenwidth,
                color: const Color.fromARGB(255, 32, 28, 47),
                child: Row(
                  children: [
                    SizedBox(
                      width: screenwidth * 0.35,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.star,
                            color: kwhitecolor,
                          ),
                          const Icon(
                            Icons.currency_bitcoin,
                            color: kwhitecolor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                cryptoname[index],
                                style: TextStyle(
                                    color: kwhitecolor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                cryptoshortname[index],
                                style: TextStyle(
                                    color: kwhitecolor, fontSize: 14.sp),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    linechart(
                        screenwidth: screenwidth,
                        getcontroller: getcontroller,
                        index: index),
                    const Spacer(),

                    GetBuilder<Cryptocontroller>(builder: (getdata) {
                      List shareprice = [
                        getdata.count,
                        getdata.counttwo,
                        getdata.countthree,
                        getdata.countfour,
                        getdata.countfive,
                        getdata.count,
                        getdata.counttwo,
                        getdata.countthree,
                        getdata.countfour,
                        getdata.countfive,
                        getdata.count,
                      ];

                      final indeone = shareprice[index].value;

                      return SizedBox(
                        width: screenwidth * 0.21,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                '\$ 000${shareprice[index].toString()}',
                                style: TextStyle(
                                    color: kwhitecolor, fontSize: 17.sp),
                              ),
                            ),
                            Row(
                              children: [
                                Obx(
                                  () => Icon(Icons.arrow_circle_up,
                                      color: shareprice[index].value > indeone
                                          ? kgreencolor
                                          : kredcolor),
                                ),
                                Obx(() => Text(
                                      ' ${shareprice[index + 1].toString()}%',
                                      style: TextStyle(
                                          color: kwhitecolor, fontSize: 17.sp),
                                    ))
                              ],
                            )
                          ],
                        ),
                      );
                    })
                    // }
                    // )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 3,
              );
            },
            itemCount: cryptoname.length));
  }
}

class linechart extends StatelessWidget {
  final index;
  const linechart(
      {Key? key,
      required this.screenwidth,
      required this.getcontroller,
      required this.index})
      : super(key: key);

  final double screenwidth;
  final Cryptocontroller getcontroller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenwidth * 0.35,
      height: 55,
      child: GetBuilder<Cryptocontroller>(builder: (getdata) {
        // final price = double.parse(getdata.count.toString());

        return Obx(() => LineChart(
              LineChartData(
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
                maxY: 45,
                maxX:
                    double.parse((getcontroller.incrementtimevalue).toString()),
                minY: 5,
                minX: double.parse(
                    (getcontroller.incrementtimevalue.value - 15).toString()),
                lineTouchData: LineTouchData(enabled: true),
                lineBarsData: [
                  LineChartBarData(
                    show: true,
                    spots: getdata.livedata,
                    isCurved: true,
                    barWidth: 2,
                    color: index % 2 == 0 ? kredcolor : kgreencolor,
                    dotData: FlDotData(
                      show: false,
                    ),
                  ),
                ],
                // minY: 0,

                titlesData: FlTitlesData(show: false),
              ),
            ));
      }),
    );
  }
}
