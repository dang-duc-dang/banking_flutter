import 'package:flutter/cupertino.dart';
import 'package:food_flutter/constants/enum_file.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/page/notification/notification_controller.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:food_flutter/widget/_custom_header.dart';
import 'package:food_flutter/widget/_title_default_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/src/rating_bar.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          appBar: CustomHeaderWidget(
            isShowBack: false,
            title: "Notifications",
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTab(),
              SizedBox(height: 10.w),
              Expanded(
                child: _buildListNotification(),
              )
            ],
          )),
    );
  }

  Widget _buildTab() {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(vertical: 10.w),
        color: Colors.white,
        child: DefaultTabController(
          length: controller.tabs.length,
          child: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              color: Style.primary100,
            ),
            unselectedLabelColor: Style.primary100,
            controller: controller.tabController,
            labelColor: Colors.white,
            labelStyle: Style().smallerTextBold,
            dividerColor: Colors.red,
            indicatorColor: Style.primary100,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            tabs: List.generate(
              controller.tabs.length,
              (index) => Container(
                alignment: Alignment.center,
                width: (Get.width - 80.w) / 3,
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Text(
                  controller.tabs[index].rawValue,
                ),
              ),
            ),
            onTap: (index) {
              controller.indexTab.value = index;
            },
          ),
        ),
      ),
    );
  }

  Widget _buildListNotification() {
    return SizedBox(
      height: 218,
      child: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: ListView.builder(
            padding: EdgeInsets.only(left: 10.w),
            itemCount: controller.listNoti.length,
            itemBuilder: (BuildContext ontext, int index) {
              return Container(
                margin: const EdgeInsets.only(right: 12),
                child: _buildItemNotification(controller.listNoti[index]),
              );
            }),
      ),
    );
  }

  Widget _buildItemNotification(List<Map<String, String>> data) {
    return Column(
      children: [
        Text(
          "Today",
          style: Style().smallerTextBold,
        ),
        SizedBox(
          height: 10.h,
        ),
        ...data.map((e) => Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              margin: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(
                  color: Style.gray4,
                  borderRadius: BorderRadius.circular(12.w)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e['title'].toString(),
                            style: Style().smallerTextBold,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            e['subTitle'].toString(),
                            style: Style()
                                .smallerTextRegular
                                .copyWith(color: Style.gray3),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "30 mins ago",
                            style: Style().smallTextRegular.copyWith(
                                fontSize: 7,
                                color: Style.gray3,
                                fontWeight: FontWeight.w400),
                          )
                        ]),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Image.asset(
                    ImageConstant.noti,
                    width: 28.w,
                    height: 28.h,
                  )
                ],
              ),
            ))
      ],
    );
  }
}
