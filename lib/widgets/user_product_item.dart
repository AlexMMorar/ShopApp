import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imgUrl;
  const UserProductItem(this.title, this.imgUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imgUrl),
      ),
      title: Text(title),
      trailing: Container(
        width: 100,
        child: Row(children: [
          IconButton(
            onPressed: (() {}),
            icon: Icon(Icons.edit),
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            onPressed: (() {}),
            icon: Icon(Icons.delete),
            color: Colors.red,
          ),
        ]),
      ),
    );
  }
}
