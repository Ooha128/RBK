import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbk/AddScreenController.dart';
import 'package:rbk/utils/AppAssets.dart';
import 'package:rbk/utils/AppSpaces.dart';
import 'package:rbk/widget/FormElements.dart';
import 'package:rbk/widget/Buttons.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddScreenController>(
      init: AddScreenController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          AppSpaces.vertical30,
          Row(children: [
            AppSpaces.horizontal10,
            IconButton(
                onPressed: Get.back,
                icon: ImageIcon(AssetImage(AppAssets.arrow))),
            Spacer(),
            IconButton(
                onPressed: Get.back,
                icon: ImageIcon(AssetImage(AppAssets.menu))),
            AppSpaces.horizontal20,
          ]),
          AppSpaces.vertical10,
          Row(children: [
            AppSpaces.horizontal30,
            Text(
              'Create New task',
              style: TextStyle(
                color: Colors.black,
                fontSize: 27,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            Image.asset(
              AppAssets.note,
              height: 40,
            ),
            AppSpaces.horizontal30,
          ]),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              AppSpaces.vertical25,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: AppTextField(
                  label: 'Task Name',
                  value: 'Team Meeting',
                ),
              ),
              AppSpaces.vertical25,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(children: [
                  Expanded(
                    flex: 20,
                    child: AppTextField(
                      label: 'Date',
                      value: 'Monday, 1 June',
                    ),
                  ),
                  Spacer(flex: 10),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Get.theme.primaryColor,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                  ),
                ]),
              ),
              AppSpaces.vertical25,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(children: [
                  Expanded(
                    child: AppTextField(
                      label: 'Start Time',
                      value: '10:00 AM',
                      suffix: Image.asset(
                        AppAssets.arrow_down,
                        width: 25,
                      ),
                    ),
                  ),
                  AppSpaces.horizontal20,
                  Expanded(
                    child: AppTextField(
                      label: 'End Time',
                      value: '11:00 AM',
                      suffix: Image.asset(
                        AppAssets.arrow_down,
                        width: 25,
                      ),
                    ),
                  ),
                ]),
              ),
              AppSpaces.vertical25,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: AppTextField(
                  label: 'Describtion',
                  value: 'Discuss all question about project',
                ),
              ),
              AppSpaces.vertical25,
              Center(
                child: AppButton(
                  label: 'Create task',
                  onTap: () =>
                      Get.snackbar('Success', 'Task Created Successfully'),
                ),
              ),
              AppSpaces.vertical25,
            ],
          )),
        ]),
      ),
    );
  }
}
