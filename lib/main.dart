import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/app.dart';
// import 'package:flutter_application_1/pages/video_detail_page.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: VideoDetailPage(videoUrl: 'assets/images/details_1.jpg'),
    home: RootApp(),
  ));
}
