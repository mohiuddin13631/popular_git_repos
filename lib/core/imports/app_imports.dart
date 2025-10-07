export 'package:popular_git_repos/environment.dart';

// system
export 'package:flutter/material.dart';
export 'dart:async';
export 'dart:io';
export 'dart:convert';

//packages
export 'package:flutter_secure_storage/flutter_secure_storage.dart';
export 'package:path_provider/path_provider.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:dio/dio.dart';
export 'package:permission_handler/permission_handler.dart';
export 'package:sqflite/sqflite.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:device_info_plus/device_info_plus.dart';
export 'package:logger/logger.dart';
export 'package:go_router/go_router.dart';

//services
export 'package:flutter/services.dart';
export 'package:popular_git_repos/data/services/api_service.dart';
export 'package:popular_git_repos/data/services/shared_pref_service.dart';

//data/repository
export 'package:popular_git_repos/data/bloc/git_bloc/git_bloc.dart';

//data/model
export 'package:popular_git_repos/data/models/git_repo/git_repo_model.dart';
export 'package:popular_git_repos/data/models/global/response_model/response_model.dart';

//data/bloc
export 'package:popular_git_repos/data/repository/git_repository.dart';

//core
export 'package:popular_git_repos/core/route/app_router.dart';
export 'package:popular_git_repos/core/app_provider/app_provider.dart';
export 'package:popular_git_repos/core/util/app_color.dart';
export 'package:popular_git_repos/core/util/app_strings.dart';
export 'package:popular_git_repos/core/util/dimensions.dart';
export 'package:popular_git_repos/core/util/text_style.dart';
export 'package:popular_git_repos/core/util/url_container.dart';
export 'package:popular_git_repos/core/helper/string_format_helper.dart';
export 'package:popular_git_repos/core/helper/date_converter.dart';
export 'package:popular_git_repos/core/helper/local_data_base_helper.dart';
export 'package:popular_git_repos/core/util/util.dart';

//components
export 'package:popular_git_repos/app/component/custom_app_bar.dart';
export 'package:popular_git_repos/app/component/image/my_network_image_widget.dart';
export 'package:popular_git_repos/app/component/custom_elevated_button.dart';
export 'package:popular_git_repos/app/component/webview_widget.dart';


//screen
export 'package:popular_git_repos/app/screens/git_repo/git_repo_screen.dart';
export 'package:popular_git_repos/app/screens/repo_details/repo_details_screen.dart';
export 'package:popular_git_repos/app/screens/web_view/web_view_screen.dart';
export 'package:popular_git_repos/app/screens/repo_details/widget/image_section.dart';





