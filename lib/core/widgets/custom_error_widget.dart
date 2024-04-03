import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/widgets.dart';

class CustomErroeWidget extends StatelessWidget {
  const CustomErroeWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: Styles.texteStyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
