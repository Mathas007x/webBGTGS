import 'dart:convert';
import 'package:http/http.dart' as http;

class StrapiService {
  final String baseUrl = 'http://localhost:1337';

  Future<List<dynamic>> fetchArticles() async {
    final response = await http.get(Uri.parse('$baseUrl/api/articles'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load articles');
    }
  }

  /*Future<List<Garden>> fetchGardens() async {
    final response = await http.get(Uri.parse('$baseUrl/api/blogs'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((item) => Garden.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load gardens');
    }
  }*/
  
  Future<List<Garden>> fetchGardens() async {
  final response = await http.get(Uri.parse('$baseUrl/api/blogs?populate=*'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    if (data['data'] == null || data['data'] is! List) {
      throw Exception('Invalid or missing data field');
    }

    // Log โครงสร้าง JSON ที่สมบูรณ์
    print('Fetched data: ${data['data']}');

    return (data['data'] as List)
        .map((item) => Garden.fromJson(item))
        .toList();
  } else {
    throw Exception('Failed to load gardens');
  }
}

}

/*class Garden {
  final String title;
  final String description;
  final List<String> imageUrls;

  Garden({required this.title, required this.description, required this.imageUrls});

  factory Garden.fromJson(Map<String, dynamic> json) {
    return Garden(
      title: json['attributes']['title'],
      description: json['attributes']['Detail'],
      imageUrls: (json['attributes']['images']['Gallery'] as List<dynamic>)
          .map((image) => image['attributes']['url'] as String)
          .toList(),
    );
  }
}*/

class Garden {
  final String title;
  final String description;
  final List<String> imageUrls;

  Garden({required this.title, required this.description, required this.imageUrls});

  factory Garden.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'];
    if (attributes == null || attributes is! Map<String, dynamic>) {
      throw Exception('Invalid or missing attributes');
    }

    // ตรวจสอบ Gallery
    final gallery = attributes['images']?['Gallery'];
    List<String> parsedImageUrls = [];

    // ตรวจสอบโครงสร้างของ Gallery
    if (gallery != null && gallery is List) {
      for (var item in gallery) {
        if (item is Map<String, dynamic>) {
          final url = item['attributes']?['url'];
          if (url != null && url is String) {
            parsedImageUrls.add(url); // เพิ่ม URL ที่ถูกต้องลงในรายการ
          } else {
            print('Skipping invalid item in Gallery: $item');
          }
        } else {
          print('Invalid item in Gallery: $item');
        }
      }
    } else {
      print('Gallery is null or not a List: $gallery');
    }

    return Garden(
      title: attributes['title'] ?? 'No Title',
      description: attributes['Detail'] ?? 'No Description',
      imageUrls: parsedImageUrls,
    );
  }
}

void main() async {
  final strapiService = StrapiService();

  try {
    final articles = await strapiService.fetchArticles();
    print('Fetched ${articles.length} articles.');

    final gardens = await strapiService.fetchGardens();
    print('Fetched ${gardens.length} gardens.');
  } catch (e) {
    print('Error: $e');
  }
}