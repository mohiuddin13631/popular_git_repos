import 'package:popular_git_repos/core/imports/app_imports.dart';

class GitRepository {

  Future<ResponseModel> getData() async {
    String url = '${UrlContainer.baseUrl}${UrlContainer.repositories}?q=Android&page=1&per_page=10';
    ResponseModel responseModel = await ApiService.getRequest(url);
    return responseModel;
  }

}