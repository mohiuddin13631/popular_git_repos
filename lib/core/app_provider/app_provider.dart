import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/bloc/git_bloc/git_bloc.dart';
import '../../data/repository/git_repository.dart';

class AppProviders {
  static Widget provide({required Widget child}) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => GitRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GitBloc(context.read<GitRepository>())),
        ],
        child: child,
      ),
    );
  }
}
