import 'package:bookly/Core/errors/Failure.dart';
import 'package:bookly/Core/utils/api_service.dart';
import 'package:bookly/Feature/home/data/models/book_model/book_model.dart';
import 'package:bookly/Feature/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiservice;

  HomeRepoImpl(this.apiservice);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async {
    try {
      var data = await apiservice.get(
          endpoint:
             'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');

      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeatureBook() async {
    try {
      var data = await apiservice.get(
          endpoint:  'volumes?Filtering=free-ebooks&q=subject:Programming');

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
     var data = await apiservice.get(
          endpoint:
        'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:Programming');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
