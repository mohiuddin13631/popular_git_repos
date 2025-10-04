import 'package:block_structure/presentation/screens/web_view/web_view_screen.dart';
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

      GoRoute(
        name: webViewScreen,
        path: '/$webViewScreen',
        builder: (context, state) {
          final redirectUrl = state.extra as String;
          return WebViewScreen(redirectUrl: redirectUrl);
        },
      ),
    ],
  );


  static const String homeScreen = 'home_screen';
  static const String repoDetailsScreen = 'repo_details_screen';
  static const String webViewScreen = 'web_view_screen';
}