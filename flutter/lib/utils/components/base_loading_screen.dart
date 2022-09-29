import 'package:event_tracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(110, 255, 255, 255), //Loading
      child: Center(
        child: Lottie.asset(BaseImages.animLoading),
      ),
    );
  }
}
