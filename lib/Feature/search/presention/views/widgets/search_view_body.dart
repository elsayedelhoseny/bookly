import 'package:bookly/Core/utils/style.dart';
import 'package:bookly/Feature/search/presention/views/widgets/custom_search_text.dart';
import 'package:flutter/material.dart';

class SearchViewBoody extends StatelessWidget {
  const SearchViewBoody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          CustomSearchTextFiled(),
          SizedBox(
            height: 16,
          ),
          Text(
            'Best Seller',
            style: Style.textstyle18,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(child: SearchResultListview()),
        ],
      ),
    );
  }
}

class SearchResultListview extends StatelessWidget {
  const SearchResultListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 30, vertical: 10),
          // 
          child: Text('data'),
        );
      },
    );
  }
}
