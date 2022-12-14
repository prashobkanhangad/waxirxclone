import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:iqgeneral/core/constants.dart';

class Cryptocontroller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    incrementnumber();
    incrementtime();
  }

  List<FlSpot> livedata = [
    const FlSpot(15, 10),
    const FlSpot(15, 10),
    const FlSpot(15, 10),
    const FlSpot(15, 10),
    const FlSpot(15, 10),
    const FlSpot(15, 10),
    const FlSpot(15, 10),
    const FlSpot(15, 10),
    const FlSpot(15, 10),
    const FlSpot(15, 10),
    const FlSpot(15, 10),
    const FlSpot(15, 10),
    const FlSpot(15, 10),
  ].obs;
  bool starvalue = true;
  var incrementvalue = Random();
  var count = 1.obs;
  var counttwo = 2.obs;
  var countthree = 2.obs;
  var countfour = 2.obs;
  var countfive = 2.obs;

  RxInt incrementtimevalue = 15.obs;

  incrementnumber() {
    Timer timer;
    var n = 1;

    for (var i = 0; i < n; i++) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        counttwo.value = incrementvalue.nextInt(30) + 20;

        count.value = incrementvalue.nextInt(30) + 10;

        countthree.value = incrementvalue.nextInt(30) + 35;

        countfour.value = incrementvalue.nextInt(30) + 30;

        countfive.value = incrementvalue.nextInt(30) + 40;
        addtolist();

        n++;
      });
    }

    refresh();
  }

  incrementtime() {
    int n = 1;

    for (int i = 0; i < n; i++) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        incrementtimevalue.value++;
        n++;
      });
    }
  }

  addtolist() {
    livedata.add(
        FlSpot(incrementtimevalue.value.toDouble(), count.value.toDouble()));

    livedata.removeAt(0);

    return livedata;
  }
}
