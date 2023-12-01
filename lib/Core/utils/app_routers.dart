import 'package:bookly/Core/utils/service_locator.dart';
import 'package:bookly/Feature/home/data/models/book_model/book_model.dart';
import 'package:bookly/Feature/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Feature/home/presentation/manger/fetch_similar_books/fetch_similar_books_cubit.dart';
import 'package:bookly/Feature/home/presentation/views/book_details_view.dart';
import 'package:bookly/Feature/home/presentation/views/home_view.dart';
import 'package:bookly/Feature/search/search_view.dart';
import 'package:bookly/Feature/splash/Presentation/Views/SplashView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const khomepage = '/HomeView';
  static const kbookDetailsView = '/bookDetailsView';
  static const kserchview = '/serchview';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: khomepage,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kbookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBookCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kserchview,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
