import 'package:f_project/screens/detail_blog_screen.dart';
import 'package:f_project/screens/favourites_screen.dart';
import 'package:f_project/service/blog_req.dart';
import 'package:flutter/material.dart';

import '../model/blog_response_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

BlogRequest _blogRequest = BlogRequest();
BlogResponseModel? blogs;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _blogRequest.fetchBlogs().then((value) => {blogs = value!, print(blogs)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        // actions: const[
        //   Padding(
        //     padding:  EdgeInsets.only(right: 10),
        //     child: CircleAvatar(child: Icon(Icons.menu,)),
        //     ),
        // ]
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            //     const DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            //   child: Text(''),
            // ),

            ListTile(
              leading: const Icon(
                Icons.favorite,
              ),
              title: const Text('Favourites'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FavouriteScreen(
                              blogs: blogs,
                            )));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: blogs?.blogs.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => DetailedBlockedScreen(
                                  id: blogs?.blogs[index].id,
                                  image: blogs?.blogs[index].imageUrl,
                                  title: blogs?.blogs[index].title))));
                    },
                    onDoubleTap: () {
                      setState(() {
                        if (blogs?.blogs[index].fav == true) {
                          blogs?.blogs[index].fav = false;
                        } else {
                          blogs?.blogs[index].fav = true;
                        }
                      });
                    },
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
                          Positioned(
                              top: 20,
                              left: MediaQuery.of(context).size.width / 1.2,
                              child: Icon(
                                Icons.favorite,
                                size: 30,
                                color: blogs!.blogs[index]!.fav == true
                                    ? Colors.red
                                    : Colors.white,
                              )),
                        ]),
                        const Divider(
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
