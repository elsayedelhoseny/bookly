import 'package:bookly/Core/widgets/custom_error.dart';
import 'package:bookly/Core/widgets/custom_loading_widget.dart';
import 'package:bookly/Feature/home/presentation/manger/fetch_similar_books/fetch_similar_books_cubit.dart';
import 'package:bookly/Feature/home/presentation/manger/fetch_similar_books/fetch_similar_books_state.dart';
import 'package:bookly/Feature/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarListviewBooks extends StatelessWidget {
  const SimilarListviewBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookState>(
      builder: (context, state) {
        if (state is SimilarBookCubitSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CustomBookImage(
                    imageUrl: state
                            .books[index].volumeInfo!.imageLinks?.thumbnail ??
                        '',
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBookCubitFailuer) {
          return CustomErrorWidgets(errMessage: state.errMessage);
        } else {
          return const CustomLoadingWidgets();
        }
      },
    );
  }
}
