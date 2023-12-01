import 'package:bookly/Core/errors/Failure.dart';
import 'package:bookly/Feature/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{

 Future<Either< Failure,List<BookModel> >> fetchNewsetBooks();
 Future<Either< Failure,List<BookModel> >> fetchFeatureBook();
 Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category});
}