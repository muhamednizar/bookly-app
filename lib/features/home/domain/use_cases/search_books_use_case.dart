import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class SearchBooksUseCase extends UseCase<List<BookEntity>, String> {
   final HomeRepo homeRepo;

  SearchBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([String query = '']) {
    return homeRepo.searchBooks(query: query);
  }

}