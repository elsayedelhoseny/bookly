import 'package:bookly/Core/widgets/custom_error.dart';
import 'package:bookly/Core/widgets/custom_loading_widget.dart';
import 'package:bookly/Feature/home/presentation/manger/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly/Feature/home/presentation/views/widgets/best_seller_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewBuilder extends StatelessWidget {
  const BestSellerListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubitCubit, NewestBooksCubitState>(
      builder: (context, state) {
       if (state is NewestBooksCubitSuccess){
    return  ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: state.books.length,
        itemBuilder: (context, index) {
          return  Padding(
            padding:
              const  EdgeInsetsDirectional.symmetric(horizontal: 30, vertical: 10),
            child: BestSellerListViewItem( 
              bookModel: state.books[index],),
          );
        },
      );
       }else if (state is NewestBooksCubitFailure){
        return CustomErrorWidgets(errMessage: state.errMessage);
       }else {
        return const CustomLoadingWidgets();
       }
      },
    );
  }
}
