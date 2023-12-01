import 'package:bookly/Core/utils/style.dart';
import 'package:bookly/Feature/home/presentation/views/widgets/Featrue_List_view.dart';
import 'package:bookly/Feature/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/Feature/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 30),
                  child: CustomAppBar()),
              FeatureBooksListView(),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 30),
                child: Text(
                  'Newest Books',
                  style: Style.textstyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: BestSellerListViewBuilder(),
        )
      ],
    );
  }
}
