import 'package:flutter/material.dart';

import '../../../../app/component/image/my_network_image_widget.dart';
import '../../../../core/util/app_color.dart';
import '../../../../data/models/git_repo/git_repo_model.dart';

class ImageSection extends StatelessWidget {
  final RepoItem model;
  const ImageSection({
    super.key,
    required this.model
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.primary.withValues(alpha: .4 ), width: 4)
            ),
            child: MyNetworkImageWidget(imageUrl: model.owner?.avatarUrl ?? "", radius: 100, height: 120, width: 120,)
        )
    );
  }
}