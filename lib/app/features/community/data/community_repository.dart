import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:impossible_flutter/app/features/community/data/video_model.dart';

class CommunityRepository {
  // TODO api받아오기
  final String apiUrl = '';

  Future<List<VideoModel>> loadingVideos() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => VideoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
