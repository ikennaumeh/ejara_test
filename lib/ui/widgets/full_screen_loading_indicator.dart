import 'package:flutter/material.dart';

class FullScreenLoadingIndicator extends StatelessWidget {
  const FullScreenLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator.adaptive(
              backgroundColor: Color(0xff393e7c),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Loading",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 19,
                color: Color(0xff393e7c),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
