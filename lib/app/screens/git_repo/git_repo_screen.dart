import 'package:popular_git_repos/core/imports/app_imports.dart';

class GitRepoScreen extends StatefulWidget {
  const GitRepoScreen({super.key});

  @override
  State<GitRepoScreen> createState() => _GitRepoScreenState();
}

class _GitRepoScreenState extends State<GitRepoScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GitBloc>().add(GitRepoFetch());
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColor.screenBGColor,
      appBar: const CustomAppBar(
        title: AppStrings.gitRepo,
        isShowLeading: false,
      ),
      body: SafeArea(
        child: BlocBuilder<GitBloc, GitState>(builder: (context, state) {
          if (state is GitFailure) {
            return Center(
              child: Text(state.error),
            );
          }
        
          if (state is! GitSuccess) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        
          final data = state.gitModel;
        
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: Dimensions.space12),
              itemCount: data.items?.length ?? 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.pushNamed(AppRouter.repoDetailsScreen, extra: data.items?[index]);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8.h),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        MyNetworkImageWidget(
                          height: 50,
                          width: 50,
                          imageUrl: data.items?[index].owner?.avatarUrl ?? "",
                        ),
                        SizedBox(width: 10.w,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.items?[index].id.toString() ?? "", style: AppTextStyle.sectionTitle3),
                              SizedBox(height: 4.h,),
                              Text(data.items?[index].fullName.toString() ?? "", style: AppTextStyle.sectionBodyTextStyle),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(AppStrings.viewType, style: AppTextStyle.sectionBodyBoldTextStyle.copyWith(fontSize: 13.sp),),
                            Text(data.items?[index].owner?.userViewType ?? "", style: AppTextStyle.sectionBodyTextStyle.copyWith(fontSize: 13.sp),),
                          ],
                        )
                      ],
                    )
                  ),
                );
              },
            ),
          );
        }),
      ),

    );
  }
}


