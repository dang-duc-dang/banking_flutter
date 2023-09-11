import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/style/app_style.dart';

class WidgetCountDownTimer extends StatefulWidget {
  const WidgetCountDownTimer({super.key});

  @override
  State<WidgetCountDownTimer> createState() => WidgetCountDownTimerState();
}

class WidgetCountDownTimerState extends State<WidgetCountDownTimer>
    with SingleTickerProviderStateMixin {
  late CustomTimerController controller;
  @override
  void initState() {
    controller = CustomTimerController(
        vsync: this, begin: const Duration(minutes: 5), end: Duration.zero);
    controller.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTimer(
        controller: controller,
        builder: (state, time) {
          return Text("${time.minutes}:${time.seconds}",
              style: Style().smallTextBold.copyWith(color: Style.primary100));
        });
  }
}
