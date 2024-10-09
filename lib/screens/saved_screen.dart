import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/card.dart';
import 'package:project/screens/post_screen.dart';
import 'package:project/services/fav_list.dart';
import 'package:provider/provider.dart';

class SavedPosts extends StatefulWidget {
  const SavedPosts({super.key});

  @override
  State<SavedPosts> createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Saved Pages',
          textAlign: TextAlign.start,
          style: GoogleFonts.lato(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Expanded(
          child: Consumer<FavListProvider>(
            builder: (context, value, child) {
              // value.favList;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.favList.length,
                  itemBuilder: (context, index) {
                    // value.favList[index];
                    return Dismissible(
                        key: ValueKey(value.favList[index]),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                        ),
                        onDismissed: (direction) {
                          context
                              .read<FavListProvider>()
                              .favRemove(value.favList[index]);
                        },
                        child: CardNew(
                          onClick: () {},
                          title: value.favList[index].title,
                          category: value.favList[index].category,
                          image: value.favList[index].imageUrl,
                        ));
                  });
            },
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ElevatedButton(
              onPressed: () {
                context.read<FavListProvider>().removeAll();
              },
              child: const Text('remove all'),
            ),
          ),
        ),

        // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       CardNew(
        //         onClick: postPage,
        //       ),
        //       // CardNew(),
        //       // CardNew(),
        //     ],
        //   ),
        // )
      ]),
    );
  }
}
