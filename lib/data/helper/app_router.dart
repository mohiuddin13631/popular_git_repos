import 'package:go_router/go_router.dart';
import 'package:block_structure/models/git_repo/git_repo_model.dart';
import '../../presentation/screens/git_repo/git_repo_screen.dart';
import '../../presentation/screens/repo_details/repo_details_screen.dart';
class AppRouter {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: homeScreen,
        path: '/',
        builder: (context, state) {
          return const GitRepoScreen();
        },
      ),

      GoRoute(
        name: repoDetailsScreen,
        path: '/$repoDetailsScreen',
        builder: (context, state) {
          RepoItem data = state.extra as RepoItem;
          return RepoDetailsScreen(model: data);
        },
      ),
    ],
  );


  static const String homeScreen = 'home_screen';
  static const String repoDetailsScreen = 'repo_details_screen';
}