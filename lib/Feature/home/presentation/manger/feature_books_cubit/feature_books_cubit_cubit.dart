import 'package:bloc/bloc.dart';
import 'package:bookly/Feature/home/data/models/book_model/book_model.dart';
import 'package:bookly/Feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'feature_books_cubit_state.dart';

class FutureBooksCubitCubit extends Cubit<FutureBooksCubitState> {
  FutureBooksCubitCubit(this.homeRepo) : super(FutureBooksCubitInitial());

 final HomeRepo homeRepo;

 Future<void> fetchFeatuersBooks () async{
  emit(FutureBooksCubitLoading());
    var result = await homeRepo.fetchFeatureBook();
    result.fold(
      (Failure)  {
        emit(FutureBooksCubitFailure(Failure.errMessage));
      },
       (books)  {emit(FutureBooksCubitSuccess(books));});
 }


}
