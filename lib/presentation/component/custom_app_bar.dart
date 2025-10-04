import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/util/app_color.dart';
import '../../data/util/app_strings.dart';
import '../../data/util/text_style.dart';
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {

  final String title;
  final bool isShowLeading;

  const CustomAppBar ({
    super.key,
    required this.title,
    this.isShowLeading = true,
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
      leading: widget.isShowLeading ? IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back, color: AppColor.white)) : null,
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.primary,
      titleTextStyle: AppTextStyle.appBarTitle.copyWith(color: AppColor.white),
      title: Text(widget.title),
    );
  }

}