import 'package:flutter/material.dart';

class AppbarBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(Icons.home_rounded),
          onPressed: () {},
          color: Theme.of(context).primaryColor,
        ),
        IconButton(
            icon: Icon(Icons.apps_rounded),
            onPressed: () {},
            color: Theme.of(context).primaryColor),
        IconButton(
            icon: Icon(Icons.attachment_rounded),
            onPressed: () {},
            color: Theme.of(context).primaryColor),
        IconButton(
            icon: Icon(Icons.contacts_rounded),
            onPressed: () {},
            color: Theme.of(context).primaryColor),
        IconButton(
            icon: Icon(Icons.expand_more_rounded),
            onPressed: () {},
            color: Theme.of(context).primaryColor),
      ],
    );
  }
}
