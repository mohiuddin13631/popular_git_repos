import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:block_structure/data/repository/git_repository.dart';
import 'package:block_structure/data/util/util.dart';
import 'package:block_structure/models/git_repo/git_repo_model.dart';
import 'package:meta/meta.dart';

import '../../data/helper/local_data_base_helper.dart';
import '../../models/global/response_model/response_model.dart';
part 'git_event.dart';
part 'git_state.dart';

class GitBloc extends Bloc<GitEvent, GitState> {

  final GitRepository gitRepository;

  GitBloc(this.gitRepository) : super(GitInitial()) {
    on<GitRepoFetch>(_getRepoData);
  }

  void _getRepoData(
      GitRepoFetch event,
      Emitter<GitState> emit,
      ) async {

    emit(GitLoading());

    try {
      GitRepoModel gitModel = GitRepoModel();
      if(await checkInternetConnection() == false){
        // Try to fetch from API
        ResponseModel responseModel = await gitRepository.getData();

        print("response json: ${responseModel.responseJson.toString()}");

        // await LocalDBHelper.saveRepoData(responseModel.responseJson.toString());
        // Parse and emit
        gitModel = GitRepoModel.fromJson(responseModel.responseJson);

        await LocalDBHelper.saveRepoData(jsonEncode(gitModel.toJson()));


      }else{
        String? localData = await LocalDBHelper.getRepoData();

        if (localData != null) {
          print("Raw localData: $localData");

          var responseJson = jsonDecode(localData);
          gitModel = GitRepoModel.fromJson(responseJson as Map<String, dynamic>);

          emit(GitSuccess(gitModel: gitModel));
        } else {
          emit(GitFailure("Network error & no local data found"));
        }
      }
      emit(GitSuccess(gitModel: gitModel));
    } catch (e) {
      printE(e);
    }
  }

}
