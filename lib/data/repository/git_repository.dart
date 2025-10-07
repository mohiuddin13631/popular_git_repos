
import '../models/global/response_model/response_model.dart';
import '../services/api_service.dart';
import '../../core/util/url_container.dart';

class GitRepository {

  Future<ResponseModel> getData() async {
    String url = '${UrlContainer.gitUrl}?q=Android&page=1&per_page=10';
    ResponseModel responseModel = await ApiService.getRequest(url);
    return responseModel;
  }

}