import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project5/provider/provider_service_class.dart';
import 'package:provider/provider.dart';
import 'inifinite_scrolling_page.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_) =>  InfiniteScrollProvider(),
      child: const MyApp()
      ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InfiniteScrollingPage(),
    );
  }
}

