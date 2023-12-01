part of 'feature_books_cubit_cubit.dart';

sealed class FutureBooksCubitState extends Equatable {
  const FutureBooksCubitState();

  @override
  List<Object> get props => [];
}

final class FutureBooksCubitInitial extends FutureBooksCubitState {}
final class FutureBooksCubitLoading extends FutureBooksCubitState {}
final class FutureBooksCubitSuccess extends FutureBooksCubitState {
  final List<BookModel> books;

  const FutureBooksCubitSuccess(this.books);

}
final class FutureBooksCubitFailure extends FutureBooksCubitState {
  final String errMessage;

 const FutureBooksCubitFailure(this.errMessage);

}
