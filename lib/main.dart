import 'package:bookly/Core/utils/app_routers.dart';
import 'package:bookly/Core/utils/service_locator.dart';
import 'package:bookly/Feature/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Feature/home/presentation/manger/feature_books_cubit/feature_books_cubit_cubit.dart';
import 'package:bookly/Feature/home/presentation/manger/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceAllocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(
          create: (context) => FutureBooksCubitCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeatuersBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubitCubit(
             getIt.get<HomeRepoImpl>())..fetchNewestBooks(),
        ),
      ],         
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Kprimarycolor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
