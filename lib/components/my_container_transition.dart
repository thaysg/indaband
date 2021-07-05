import 'package:flutter/material.dart';

class MyTransitionListTile extends StatelessWidget {
  const MyTransitionListTile({/* this.onTap, */ required this.mychild});

  //final GestureTapCallback? onTap;
  final Widget mychild;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      leading: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.black54,
          ),
        ),
        child: mychild,
      ),
      //onTap: onTap,
    );
  }
}
