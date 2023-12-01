import 'package:bookly/Core/utils/style.dart';
import 'package:bookly/Feature/home/presentation/views/widgets/similer_book_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksection extends StatelessWidget {
  const SimilarBooksection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'You can also like',
            style: Style.textstyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        const SimilarListviewBooks(),
      ],
    );
  }
}
