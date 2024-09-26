import 'package:flutter/material.dart';
import '../../../../core/constant/size/app_size.dart';
import 'custom_row_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSize.screenHeight(context: context) * 0.81,
        width: AppSize.screenWidth(context: context) * 0.6,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(70)),
        child: Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            shadowColor: Colors.black54,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 14, left: 10),
                    child: CustomRowDrawer(
                      icon: Icons.help,
                      iconColor: Colors.blue,
                      textInDrawer: 'Help & Support',
                    ),
                  ),
                  Divider(
                    thickness: 3,
                    color: Colors.grey,
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: CustomRowDrawer(
                      icon: Icons.settings,
                      iconColor: Colors.red,
                      textInDrawer: 'Settings              ',
                      backIcon: true,
                    ),
                  ),
                ],
              ),
            )));
  }
}
