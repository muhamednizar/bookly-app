import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/domain/entities/book_entity.dart';

abstract class AppRouter {
  static const String kHomeView = '/homeView';
  static const String kBookDetailsView = '/bookdetailsView';
  static const String kSearchView = '/searchView';
  
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRouter.kHomeView,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: AppRouter.kBookDetailsView,
        builder: (context, state) {
          final BookEntity book =
              state.extra as BookEntity; // استلام الـ BookEntity
          return BookDetailsView(book: book); // تمرير الـ BookEntity فقط
        },
      ),
      GoRoute(
          path: AppRouter.kSearchView,
          builder: (context, state) {
            final BookEntity book =
                state.extra as BookEntity; // استلام الـ BookEntity
            return SearchView(book: book); // تمرير الـ BookEntity فقط
          }),
    ],
  );
}
