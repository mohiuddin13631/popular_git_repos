part of 'git_bloc.dart';

@immutable
sealed class GitState {}

final class GitInitial extends GitState {}

final class GitSuccess extends GitState {
  final GitRepoModel gitModel;

  GitSuccess({required this.gitModel});
}

final class GitFailure extends GitState {
  final String error;

  GitFailure(this.error);
}

final class GitLoading extends GitState {}