import 'package:bookly/Core/utils/style.dart';
import 'package:bookly/Core/widgets/custom_button.dart';
import 'package:bookly/Feature/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});

 final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomButton(
          style: Style.textstyle18.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
          text: '19.99€',
          backgroundColor: Colors.white,
          borderradius: const BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        )),
        Expanded(
            child: CustomButton(
              onPressed:() async {
                Uri url = Uri.parse(bookModel.volumeInfo.previewLink!);
                 if (!await launchUrl(url)) { }
              }, 
          style: Style.textstyle16.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          text: 'Free preview',
          backgroundColor: const Color(0xffEF8262),
          borderradius: const BorderRadius.only(
              topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
        )),
      ],
    );
  }
}
