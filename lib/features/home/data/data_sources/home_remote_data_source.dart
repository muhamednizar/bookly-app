import '../../../../constants.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/functions/save_books.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0 });
  Future<List<BookEntity>> fetchSimilarBooks({required String bookId});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming&startIndex=${pageNumber * 10 }');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String bookId}) async {
    // أولاً نحصل على تفاصيل الكتاب الحالي
    var bookData = await apiService.get(endpoint: 'volumes/$bookId');
    var currentBook = BookModel.fromJson(bookData);
    
    // نستخدم عنوان الكتاب أو المؤلف للبحث عن كتب مشابهة
    String searchQuery = currentBook.volumeInfo?.title ?? 'programming';
    if (currentBook.volumeInfo?.authors?.isNotEmpty == true) {
      searchQuery = '${currentBook.volumeInfo!.authors!.first} ${currentBook.volumeInfo!.title}';
    }
    
    var data = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=${Uri.encodeComponent(searchQuery)}&maxResults=10');
    List<BookEntity> books = getBooksList(data);
    
    // نتأكد من إزالة الكتاب الحالي من النتائج
    books.removeWhere((book) => book.bookId == bookId);
    
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
