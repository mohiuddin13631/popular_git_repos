import 'package:block_structure/data/util/app_strings.dart';
import 'package:block_structure/models/git_repo/git_repo_model.dart';
import 'package:block_structure/presentation/component/custom_app_bar.dart';
import 'package:block_structure/presentation/component/image/my_network_image_widget.dart';
import 'package:flutter/material.dart';

import '../../../data/util/text_style.dart';
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
      appBar: const CustomAppBar(
        title: AppStrings.repoDetails,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            MyNetworkImageWidget(imageUrl: widget.model.owner?.avatarUrl ?? ""),

            Text(widget.model.nodeId ?? "", style: AppTextStyle.sectionTitle3),
            Text(widget.model.name ?? "", style: AppTextStyle.bodyTextStyle1),
            Text(widget.model.fullName ?? "" , style: AppTextStyle.bodyTextStyle1),
          ],
        ),
      ),
    );
  }
}
