import 'package:bookly/Core/utils/style.dart';
import 'package:bookly/Feature/home/data/models/book_model/book_model.dart';
import 'package:bookly/Feature/home/presentation/views/widgets/book_action.dart';
import 'package:bookly/Feature/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Feature/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
 
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child:  CustomBookImage(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? ''
            ),
        ),
        const SizedBox(
          height: 28,
        ),
        Text(
          book.volumeInfo.title!,
          style: Style.style30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 4,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo.authors?[0] ??'',
            style: Style.textstyle18.copyWith(
                fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
         BookRating(mainAxisAlignment: MainAxisAlignment.center,
         count: book.volumeInfo.ratingsCount ?? 0,
         rating:book.volumeInfo.averageRating ?? 0),
        const SizedBox(
          height: 25,
        ),
         BookAction(bookModel: book,),
      ],
    );
  }
}
