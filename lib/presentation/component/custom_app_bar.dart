import 'package:flutter/material.dart';

import '../../data/util/app_color.dart';
import '../../data/util/app_strings.dart';
import '../../data/util/text_style.dart';
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {

  final String title;

  const CustomAppBar ({
    super.key,
    required this.title
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 50);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.primary,
      titleTextStyle: AppTextStyle.appBarTitle.copyWith(color: AppColor.white),
      title: Text(widget.title),
    );
  }

}