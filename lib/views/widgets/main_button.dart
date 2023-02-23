import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTab;
  const MainButton({Key? key, required this.text, required this.onTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTab,
        style:
            ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
        child: Text(
          text,
        ),
      ),
    );
  }
}
