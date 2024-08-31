// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
//
// class InfiniteScrollingPage extends StatefulWidget {
//   const InfiniteScrollingPage({super.key});
//
//   @override
//   _InfiniteScrollingPageState createState() => _InfiniteScrollingPageState();
// }
//
// class _InfiniteScrollingPageState extends State<InfiniteScrollingPage> {
//   final List<String> _items = List.generate(20, (index) => 'Item $index');
//   final ScrollController _scrollController = ScrollController();
//   bool _isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
//         _loadMore();
//       }
//     });
//   }
//
//   Future<void> _loadMore() async {
//     if (_isLoading) return;
//     setState(() => _isLoading = true);
//     await Future.delayed(const Duration(seconds: 2));
//     final newItems = List.generate(20, (index) => 'Item ${_items.length + index}');
//     setState(() {
//       _items.addAll(newItems);
//       _isLoading = false;
//     });
//   }
//
//   Future<void> _refresh() async {
//     await Future.delayed(const Duration(seconds: 2));
//     setState(() {
//       _items.clear();
//       _items.addAll(List.generate(20, (index) => 'Item $index'));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         backgroundColor: Colors.indigo.shade300,
//         title: const Text('Infinite Scroll Image',style: TextStyle(color: Colors.white),),
//       ),
//       body: RefreshIndicator(
//         onRefresh: _refresh,
//         child: ListView.builder(
//           controller: _scrollController,
//           itemCount: _items.length + (_isLoading ? 1 : 0),
//           itemBuilder: (context, index) {
//             if (index == _items.length) {
//               return const Center(child: CircularProgressIndicator());
//             }
//
//             final item = _items[index];
//             return AnimationConfiguration.staggeredList(
//               position: index,
//               duration: const Duration(milliseconds: 375),
//               child: FadeInAnimation(
//                     child: Column(
//                       children: [
//                         _buildImageShowing('https://yourdost-blog-images.s3-ap-southeast-1.amazonaws.com/wp-content/uploads/2016/02/23205421/creative-compressor-1.jpg'),
//                         _buildImageShowing('https://content.presspage.com/uploads/2170/1920_creativity.jpg?10000'),
//                         _buildImageShowing('https://www.cio.com/wp-content/uploads/2023/05/certification_school_pencils_diversity_creative_team_by-evgeny555-getty-100787956-orig-3.jpg?quality=50&strip=all'),
//                         _buildImageShowing('https://www.edynamiclearning.com/wp-content/uploads/2019/04/Creative-Writing-I-HIGH-RES.jpg'),
//                         _buildImageShowing('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjWHMOp_RsTi7Spc0Q3Iw69VS3MbSntV2nCA&s'),
//                         _buildImageShowing('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEKy0b1euGM-rA936s7xVa6u6jB4OenwqK7w&s'),
//                         _buildImageShowing('https://618media.com/wp-content/uploads/2024/02/chatgpt-4-for-creative-writing.webp'),
//                         _buildImageShowing('https://www.winchester.ac.uk/media/Content-Assets/Study/Undergraduate-Courses/Creative-Writing-v7-1.jpg'),
//                         _buildImageShowing('https://assets-homepages-learning.3plearning.net/wp-content/uploads/2020/11/teach-creative-writing.jpg'),
//                         _buildImageShowing('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdHwyr7u7UpSdHR3dLvTcpf1r88xX6nB9pzw&s'),
//                         _buildImageShowing('https://www.franticpro.com/resource/newHeader/images/6.jpg'),
//                         _buildImageShowing('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7EtqOpuewOP5rSURN8E4W8rUPhuGoPK2LKw&s'),
//                         _buildImageShowing('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYRFJR1VkfuSyFvepsLxp-_ZDfMPpsIwhBVQ&s'),
//                       ],
//                     ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//   Widget _buildImageShowing(String image){
//     return Padding(padding: const EdgeInsets.all(12.0),
//       child: Container(
//         decoration: ShapeDecoration(
//             shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
//               borderSide: BorderSide.none
//         )
//         ),
//           child: Card(
//             child: ClipRRect(
//               borderRadius: const BorderRadius.all(Radius.circular(27)),
//               child: CachedNetworkImage(
//                 imageUrl: image,
//                 fit: BoxFit.cover, // Ensure the image covers the circle
//                 placeholder: (context, url) => const CupertinoActivityIndicator(),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//               ),
//             ),
//           ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:project5/provider/provider_service_class.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class InfiniteScrollingPage extends StatelessWidget {
  const InfiniteScrollingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade300,
        title: const Text('Infinite Scroll Image',
            style: TextStyle(color: Colors.white)),
      ),
      body: Consumer<InfiniteScrollProvider>(
        builder: (context, provider, child) {
          return RefreshIndicator(
            onRefresh: provider.refresh,
            child: ListView.builder(
              controller: ScrollController()
                ..addListener(() {
                  if (ScrollController().position.pixels ==
                      ScrollController().position.maxScrollExtent) {
                    provider.loadMore();
                  }
                }),
              itemCount: provider.items.length + (provider.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == provider.items.length) {
                  return const Center(child: CircularProgressIndicator());
                }

                final item = provider.items[index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: FadeInAnimation(
                    child: Column(
                      children: [
                        _buildImageShowing(
                            provider.images[index % provider.images.length]),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildImageShowing(String image) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: ShapeDecoration(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
        child: Card(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(27)),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
