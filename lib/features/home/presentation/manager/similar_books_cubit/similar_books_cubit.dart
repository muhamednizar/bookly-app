import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_similar_books_use_case.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.similarBooksUseCase) : super(SimilarBooksInitial());

  final FetchSimilarBooksUseCase similarBooksUseCase;

  Future<void> fetchSimilarBooks({required String bookId}) async {
    emit(SimilarBooksLoading());
    var result = await similarBooksUseCase.call(bookId);
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.message));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}

