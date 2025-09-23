  import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

abstract class SearchBooksState {}
  class SearchBooksInitial extends SearchBooksState {}
  class SearchBooksLoading extends SearchBooksState {}
  class SearchBooksFailure extends SearchBooksState {
    final String errMessage;
    SearchBooksFailure(this.errMessage);
  }
  class SearchBooksSuccess extends SearchBooksState {
    final List<BookEntity> books;
    SearchBooksSuccess(this.books);
  }
