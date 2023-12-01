
import 'package:bookly/Feature/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class SimilarBookState extends Equatable {
  const SimilarBookState();

  @override
  List<Object> get props => [];
}

final class SimilarBookCubitInitial extends SimilarBookState {}

final class SimilarBookCubitLoading extends SimilarBookState {}
final class SimilarBookCubitSuccess extends SimilarBookState {
  final List<BookModel> books;
  const SimilarBookCubitSuccess(this.books);
}
final class SimilarBookCubitFailuer extends SimilarBookState {
  final String errMessage;

  const SimilarBookCubitFailuer(this.errMessage);
}