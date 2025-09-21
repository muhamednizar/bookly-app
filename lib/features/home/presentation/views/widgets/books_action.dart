import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../domain/entities/book_entity.dart';

class BooksAction extends StatelessWidget {
   BooksAction({super.key, required this.book});

  final BookEntity book;
  
  String? getBestReadingLink() {
    // الأولوية للـ webReaderLink لأنه الأفضل للقراءة المباشرة
    if (book.webReaderLink != null && book.webReaderLink!.isNotEmpty) {
      return book.webReaderLink;
    }
    // ثم previewLink للعرض المسبق
    if (book.previewLink != null && book.previewLink!.isNotEmpty) {
      return book.previewLink;
    }
    // أخيراً infoLink للمعلومات العامة
    if (book.infoLink != null && book.infoLink!.isNotEmpty) {
      return book.infoLink;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            buttonText: '0.00 €',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          )),
          Expanded(
              child: CustomButton(
            onPressed: () {
              String? link = getBestReadingLink();
              if (link != null) {
                final Uri url = Uri.parse(link);
                launchUrl(url);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                    content: const Text('No Link available',style: TextStyle(color: Colors.white),),
                    backgroundColor: Colors.red.shade400,
                  
                  ),
                );
              }
            },
            buttonText: getBestReadingLink() != null ? 'Read Now' : 'No Link',
            fontSize: 16,
            backgroundColor: getBestReadingLink() != null 
                ? const Color(0xffEF8262) 
                : Colors.grey,
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          )),
        ],
      ),
    );
  }
  


}
