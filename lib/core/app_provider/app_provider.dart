import 'package:popular_git_repos/core/imports/app_imports.dart';

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
