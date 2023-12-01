import 'package:bookly/Core/utils/app_routers.dart';
import 'package:bookly/Core/widgets/custom_error.dart';
import 'package:bookly/Core/widgets/custom_loading_widget.dart';
import 'package:bookly/Feature/home/presentation/manger/feature_books_cubit/feature_books_cubit_cubit.dart';
import 'package:bookly/Feature/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeatureBooksListView extends StatelessWidget {
  const FeatureBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FutureBooksCubitCubit, FutureBooksCubitState>(
        builder: (context, state) {
      if (state is FutureBooksCubitSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
              AppRouter.kbookDetailsView,
            extra: state.books[index]);
                  },
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                  ),
                ),
              );
            },
          ),
        );
      } else if (state is FutureBooksCubitFailure) {
        return CustomErrorWidgets(
          errMessage: state.errMessage,
        );
      } else {
        return const CustomLoadingWidgets();
      }
    });
  }
}
