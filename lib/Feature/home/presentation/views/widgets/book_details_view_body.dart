import 'package:bookly/Feature/home/data/models/book_model/book_model.dart';
import 'package:bookly/Feature/home/presentation/views/widgets/book_details.dart';
import 'package:bookly/Feature/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly/Feature/home/presentation/views/widgets/similar_book_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
final BookModel bookModel; 
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
               const CustomBookDetailsAppbar(),
                BookDetailsSection(
                  book: bookModel,
                ),
              const  Expanded(
                  child: SizedBox(
                    height: 32,
                  ),
                ),
               const SimilarBooksection(),
               const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
