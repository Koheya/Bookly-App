import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/utils/functions/launch_url.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: "Free",
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRaduis: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
              },
              text: getText(bookModel),
              fontSize: 16,
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRaduis: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String getText(BookModel bookModel) {
  if (bookModel.volumeInfo.previewLink == null) {
    return "Not Available";
  } else {
    return "Preview";
  }
}
