import 'package:flutter/material.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;

  const UserProductItem(this.id, this.title, this.imgUrl, {super.key});

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
            onPressed: (() {
              Navigator.of(context)
                  .pushNamed(EditProductScreen.routeName, arguments: id);
            }),
            icon: Icon(Icons.edit),
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            onPressed: (() {
              Provider.of<Products>(context, listen: false).deleteProduct(id);
            }),
            icon: Icon(Icons.delete),
            color: Colors.red,
          ),
        ]),
      ),
    );
  }
}
