
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/util/app_color.dart';
import '../../core/util/dimensions.dart';
import '../../core/util/text_style.dart';

class CustomElevatedBtn extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final double radius;
  final double elevation;
  final Color? bgColor;
  final Color? textColor;
  final Color borderColor;
  final Color? shadowColor;
  final double width;
  final double height;
  final Widget? icon;
  final bool isLoading;
  final IconAlignment iconAlignment;
  const CustomElevatedBtn({
    super.key,
    required this.text,
    required this.onTap,
    this.radius = Dimensions.largeRadius,
    this.elevation = 0,
    this.bgColor,
    this.shadowColor,
    this.width = double.infinity,
    this.height = Dimensions.defaultButtonH,
    this.icon,
    this.isLoading = false,
    this.textColor = AppColor.white,
    this.borderColor = AppColor.transparentColor,
    this.iconAlignment = IconAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? ElevatedButton.icon(
            iconAlignment: iconAlignment,
            icon: isLoading ? const SizedBox.shrink() : icon ?? const SizedBox.shrink(),
            onPressed: () {
              if (isLoading == false) {
                FocusManager.instance.primaryFocus?.unfocus();
                onTap();
              }
            }, //
            style: ElevatedButton.styleFrom(
              backgroundColor: bgColor ?? AppColor.getPrimaryColor(), //
              elevation: elevation, //
              surfaceTintColor: bgColor ?? AppColor.getPrimaryColor().withValues(alpha: 0.5),
              overlayColor: bgColor ??
                  AppColor.getPrimaryColor().withValues(
                    alpha: 0.1,
                  ), // Set your splash color h
              shadowColor: shadowColor ?? AppColor.getPrimaryColor().withValues(alpha: 0.5),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(radius.r),
              ),
              maximumSize: Size.fromHeight(height),
              minimumSize: Size(width, height),
              splashFactory: InkRipple.splashFactory,
            ),
            label: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : Text(
                    text, //
                    style: AppTextStyle.buttonTextStyle1.copyWith(
                      color: textColor,
                    ),
                  ),
          )
        : ElevatedButton(
            onPressed: () {
              if (isLoading == false) {
                FocusManager.instance.primaryFocus?.unfocus();
                onTap();
              }
            }, //
            style: ElevatedButton.styleFrom(
              backgroundColor: bgColor ?? AppColor.getPrimaryColor(),
              elevation: elevation, //
              shadowColor: shadowColor ?? AppColor.getPrimaryColor().withValues(alpha: 0.5),
              overlayColor: bgColor ??
                  AppColor.getPrimaryColor().withValues(
                    alpha: 0.1,
                  ), // Set your splash color h
              splashFactory: InkRipple.splashFactory,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(radius.r),
              ),
              maximumSize: Size.fromHeight(height),
              minimumSize: Size(width, height),
            ),
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : Text(
                    text, //
                    style: AppTextStyle.buttonTextStyle1.copyWith(
                      color: textColor,
                    ),
                  ),
          );
  }
}
