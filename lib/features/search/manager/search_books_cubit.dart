import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/use_cases/search_books_use_case.dart';
import 'package:bookly_app/features/search/manager/search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchBooksUseCase) : super( SearchBooksInitial());

  final SearchBooksUseCase searchBooksUseCase;
  Future<void> searchBooks({required String query}) async {
      emit(SearchBooksLoading());
    var result = await searchBooksUseCase.call(query);
    result.fold((failure) {
      emit(SearchBooksFailure(failure.message));
    }, (books) { 
      emit(SearchBooksSuccess(books));
    });
    
  }

}