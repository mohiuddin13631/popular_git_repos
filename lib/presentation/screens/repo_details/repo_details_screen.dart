import 'package:block_structure/data/helper/date_converter.dart';
import 'package:block_structure/data/util/app_color.dart';
import 'package:block_structure/data/util/app_strings.dart';
import 'package:block_structure/data/util/dimensions.dart';
import 'package:block_structure/models/git_repo/git_repo_model.dart';
import 'package:block_structure/presentation/component/custom_app_bar.dart';
import 'package:block_structure/presentation/component/image/my_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../data/helper/app_router.dart';
import '../../../data/util/text_style.dart';
import '../../component/custom_elevated_button.dart';
class RepoDetailsScreen extends StatefulWidget {

  final RepoItem model;

  const RepoDetailsScreen({super.key, required this.model});

  @override
  State<RepoDetailsScreen> createState() => _RepoDetailsScreenState();
}

class _RepoDetailsScreenState extends State<RepoDetailsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBGColor,
      appBar: const CustomAppBar(
        title: AppStrings.repoDetails,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 14, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(Dimensions.space8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1), // 👈 pushes shadow 6px downward
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ImageSection(widget: widget),
                  const SizedBox(height: 14,),

                  Row(
                    children: [
                      Text("${AppStrings.lastUpdate} : ", style: AppTextStyle.sectionBodyBoldTextStyle.copyWith(color: AppColor.black)),
                      Text(DateConverter.estimatedDateTime(DateTime.parse(widget.model.updatedAt ?? "")), style: AppTextStyle.sectionBodyTextStyle.copyWith(fontSize: 14),),
                    ],
                  ),
                  SizedBox(height: Dimensions.space4.h,),
                  Row(
                    children: [
                      Text("${AppStrings.name} : ", style: AppTextStyle.sectionBodyBoldTextStyle.copyWith(color: AppColor.black)),
                      Text(widget.model.fullName ?? "", style: AppTextStyle.sectionBodyTextStyle.copyWith(fontSize: 15),),
                    ],
                  ),
                  SizedBox(height: Dimensions.space4.h,),
                  Text(AppStrings.description, style: AppTextStyle.sectionBodyBoldTextStyle.copyWith(color: AppColor.black)),
                  SizedBox(height: Dimensions.space4.h,),
                  Text(widget.model.description ?? "" , style: AppTextStyle.bodyTextStyle1.copyWith(fontSize: 15)),

                  SizedBox(height: Dimensions.space14.h,),
                  CustomElevatedBtn(
                    radius: Dimensions.largeRadius.r,
                    bgColor: AppColor.getPrimaryColor(),
                    text: AppStrings.viewRepo,
                    onTap: () {
                      context.pushNamed(AppRouter.webViewScreen, extra: widget.model.htmlUrl ?? "");
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.widget,
  });

  final RepoDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.primary.withValues(alpha: .4 ), width: 4)
            ),
            child: MyNetworkImageWidget(imageUrl: widget.model.owner?.avatarUrl ?? "", radius: 100, height: 120, width: 120,)
        )
    );
  }
}
