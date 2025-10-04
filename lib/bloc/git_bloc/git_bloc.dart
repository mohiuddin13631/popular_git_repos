import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:block_structure/data/repository/git_repository.dart';
import 'package:block_structure/models/git_repo/git_repo_model.dart';

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
      ResponseModel responseModel = await gitRepository.getData();

      GitRepoModel gitModel = GitRepoModel.fromJson(responseModel.responseJson);

      emit(GitSuccess(gitModel: gitModel));
    } catch (e) {
      emit(GitFailure(e.toString()));
    }
  }
}
