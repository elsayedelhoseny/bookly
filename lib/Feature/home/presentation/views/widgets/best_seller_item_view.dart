import 'package:bookly/Core/utils/app_routers.dart';
import 'package:bookly/Core/utils/style.dart';
import 'package:bookly/Feature/home/data/models/book_model/book_model.dart';
import 'package:bookly/Feature/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Feature/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});
 final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        GoRouter.of(context).push(
          AppRouter.kbookDetailsView,
          extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??'' ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        bookModel.volumeInfo.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Style.textstyle20.copyWith(
                          fontFamily: kGTSectraFine,
                        ),
                      )),
                  const SizedBox(
                    height: 3,
                  ),
                   Text(
                    bookModel.volumeInfo.authors![0],
                    style: Style.textstyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Style.textstyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                       BookRating(
                        rating: bookModel.volumeInfo.averageRating?.round() ?? 0,
                        count: bookModel.volumeInfo.ratingsCount??0,
                       ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}