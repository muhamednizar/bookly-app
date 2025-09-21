import 'package:hive_flutter/adapters.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;
  @HiveField(6)
  final num? ratingsCount;
  @HiveField(7)
  final String? infoLink;
  @HiveField(8)
  final String? previewLink;
  @HiveField(9)
  final String? webReaderLink;

  BookEntity( 
      {required this.bookId,
      required this.image,
      required this.title,
      required this.authorName,
      required this.price,
    required this.rating,
    required this.ratingsCount,
    required this.infoLink,
    required this.previewLink,
    required this.webReaderLink,
  });
}
