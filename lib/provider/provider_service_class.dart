import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class InfiniteScrollProvider with ChangeNotifier {
  final List<String> _items = List.generate(20, (index) => 'Item $index');
  final List<String> _images = [
    'https://yourdost-blog-images.s3-ap-southeast-1.amazonaws.com/wp-content/uploads/2016/02/23205421/creative-compressor-1.jpg',
    'https://content.presspage.com/uploads/2170/1920_creativity.jpg?10000',
    'https://www.cio.com/wp-content/uploads/2023/05/certification_school_pencils_diversity_creative_team_by-evgeny555-getty-100787956-orig-3.jpg?quality=50&strip=all',
    'https://www.edynamiclearning.com/wp-content/uploads/2019/04/Creative-Writing-I-HIGH-RES.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjWHMOp_RsTi7Spc0Q3Iw69VS3MbSntV2nCA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEKy0b1euGM-rA936s7xVa6u6jB4OenwqK7w&s',
    'https://618media.com/wp-content/uploads/2024/02/chatgpt-4-for-creative-writing.webp',
    'https://www.winchester.ac.uk/media/Content-Assets/Study/Undergraduate-Courses/Creative-Writing-v7-1.jpg',
    'https://assets-homepages-learning.3plearning.net/wp-content/uploads/2020/11/teach-creative-writing.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdHwyr7u7UpSdHR3dLvTcpf1r88xX6nB9pzw&s',
    'https://www.franticpro.com/resource/newHeader/images/6.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7EtqOpuewOP5rSURN8E4W8rUPhuGoPK2LKw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYRFJR1VkfuSyFvepsLxp-_ZDfMPpsIwhBVQ&s',
  ];
  bool _isLoading = false;

  List<String> get items => _items;
  bool get isLoading => _isLoading;
  List<String> get images => _images;

  Future<void> loadMore() async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    final newItems = List.generate(20, (index) => 'Item ${_items.length + index}');
    _items.addAll(newItems);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    _items.clear();
    _items.addAll(List.generate(20, (index) => 'Item $index'));
    notifyListeners();
  }
}
