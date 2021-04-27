import 'package:flutter/material.dart';

Widget builtGenderCard(
    {@required String text,
    @required String imagePath,
    @required bool isMale,
    @required Function onTap}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: isMale ? Colors.indigoAccent : Color(0xFF1A1B2C)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              text,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            )
          ],
        ),
      ),
    ),
  );
}



Widget builtFloatingActionButton({
  @required Function onPressed,
  @required String heroTag,
  @required IconData iconData,
}) {
  return FloatingActionButton(
    onPressed: onPressed,
    heroTag: heroTag,
    child: Icon(
      iconData,
      size: 30,
      color: Colors.white,
    ),
    backgroundColor: Colors.grey.withOpacity(0.4),
  );
}


