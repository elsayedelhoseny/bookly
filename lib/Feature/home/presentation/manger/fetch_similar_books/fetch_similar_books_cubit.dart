import 'package:bloc/bloc.dart';
import 'package:bookly/Feature/home/data/repos/home_repo.dart';
import 'package:bookly/Feature/home/presentation/manger/fetch_similar_books/fetch_similar_books_state.dart';


class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit(this.homeRepo) : super(SimilarBookCubitInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBookCubitLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((Failure) {
      emit(
        SimilarBookCubitFailuer(Failure.errMessage),
      );
    }, (books) {
      emit(
        SimilarBookCubitSuccess(books),
      );
    });
  }
}