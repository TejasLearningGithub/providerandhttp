import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_first/provider/favourite_provider.dart';
import 'package:provider_first/screen/favourite_item_screen.dart';


class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print('=====Build Perform Again=====');
    // final favouriteProvider =
    //    Provider.of<FavouriteProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite screen'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavouriteItemScreen(),
                ),
              );
            },
            child: Icon(Icons.favorite_outlined),
          ),
          SizedBox(
            width: 24,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 21,
        itemBuilder: (context, index) {
          return Consumer<FavouriteProvider>(
            builder: ((context, value, child) {
              return ListTile(
                title: Text('item $index'),
                trailing: Icon(value.selectedItems.contains(index)
                    ? Icons.favorite_outlined
                    : Icons.favorite_border_outlined),
                onTap: () {
                  if (value.selectedItems.contains(index)) {
                    value.removeFavouriteItem(index);
                  } else {
                    value.addFavouriteItem(index);
                  }
                },
              );
            }),
          );
        },
      ),
    );
  }
}
