import 'package:flutter/material.dart';

import '../model/blog_response_model.dart';

class FavouriteScreen extends StatelessWidget {
  // const FavouriteScreen({super.key});

  BlogResponseModel? blogs ;

  FavouriteScreen({@required this.blogs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        title: const Text("Favourite"),

        
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: blogs?.blogs.length,
                itemBuilder: (context, index) {

                  if(blogs?.blogs[index].fav == true){
return InkWell(
                    // onTap: () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: ((context) => DetailedBlockedScreen(
                    //               id: blogs?.blogs[index].id,
                    //               image: blogs?.blogs[index].imageUrl,
                    //               title: blogs?.blogs[index].title))));
                    // },
                    // onDoubleTap: () {
                    //   setState(() {
                    //     if (blogs?.blogs[index].fav == true) {
                    //       blogs?.blogs[index].fav = false;
                    //     } else {
                    //       blogs?.blogs[index].fav = true;
                    //     }
                    //   });
                    // },
                    child: Column(
                      children: [
                        Stack(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 14, right: 14, top: 7, bottom: 7),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 2,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: blogs?.blogs[index]?.imageUrl != null
                                        ? Image.network(
                                            blogs!.blogs[index]!.imageUrl,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.4,
                                            fit: BoxFit.fill,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          )
                                        : const CircularProgressIndicator(), // or provide an appropriate fallback UI
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    blogs?.blogs[index]?.title ?? 'No Title',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Positioned(
                          //     top: 20,
                          //     left: MediaQuery.of(context).size.width / 1.2,
                          //     child: Icon(
                          //       Icons.favorite,
                          //       size: 30,
                          //       color: blogs!.blogs[index]!.fav == true
                          //           ? Colors.red
                          //           : Colors.white,
                          //     )),
                        ]),
                        const Divider(
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  );
                  }
                  return Container();
                }),
          ),
        ],
      ),
    );
  }
}