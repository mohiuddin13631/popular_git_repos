part of 'git_bloc.dart';

@immutable
sealed class GitEvent {}

final class GitRepoFetch extends GitEvent {

}
