import 'package:popular_git_repos/core/imports/app_imports.dart';

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
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ImageSection(model: widget.model),
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


