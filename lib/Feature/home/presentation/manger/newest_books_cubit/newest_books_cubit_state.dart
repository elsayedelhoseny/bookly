part of 'newest_books_cubit_cubit.dart';

sealed class NewestBooksCubitState extends Equatable {
  const NewestBooksCubitState();

  @override
  List<Object> get props => [];
}

final class NewestBooksCubitInitial extends NewestBooksCubitState {}
final class NewestBooksCubitLoading extends NewestBooksCubitState{}
final class NewestBooksCubitSuccess extends NewestBooksCubitState {
  final List<BookModel> books;

  const NewestBooksCubitSuccess(this.books);

}
final class NewestBooksCubitFailure extends NewestBooksCubitState {
  final String errMessage;

 const NewestBooksCubitFailure(this.errMessage);

}