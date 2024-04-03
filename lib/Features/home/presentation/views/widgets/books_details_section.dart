import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.bookModdel});
  final BookModel bookModdel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: CustomBookImage(
            imageUrl: bookModdel.volumeInfo.imageLinks?.thumbnail ??
                "https://images.unsplash.com/photo-1541963463532-d68292c34b19?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Ym9va3xlbnwwfHwwfHx8MA%3D%3D",
          ),
        ),
        const SizedBox(height: 43),
        Text(
          bookModdel.volumeInfo.title!,
          style: Styles.texteStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            textAlign: TextAlign.center,
            bookModdel.volumeInfo.authors?[0] ?? "",
            style: Styles.texteStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    );
  }
}
