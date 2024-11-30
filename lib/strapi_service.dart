import 'dart:convert';
import 'package:http/http.dart' as http;

class StrapiService {
  final String baseUrl = 'https://graden-data-1.onrender.com';

  Future<List<dynamic>> fetchArticles() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/blogs'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['data'] ?? [];
      } else {
        throw Exception(
            'Failed to load articles: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load articles');
    }
  }

  Future<List<Garden>> fetchGardens() async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/api/blogs?populate=*'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Fetched data: ${data['data']}');

        if (data['data'] == null || data['data'] is! List) {
          throw Exception('Invalid or missing data field');
        }

        return (data['data'] as List).map((item) {
          final attributes = item['attributes'] ?? {};
          final imageUrls = extractImageUrls(attributes, baseUrl);
          return Garden.fromJson(attributes, imageUrls);
        }).toList();
      } else {
        throw Exception(
            'Failed to load gardens: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load gardens');
    }
  }
}

List<String> extractImageUrls(Map<String, dynamic> json, String baseUrl) {
  final galleryData = json['Gallery']?['data'] as List<dynamic>?;

  if (galleryData == null || galleryData.isEmpty) {
    return []; // Return empty list if no images
  }

  return galleryData.map<String>((item) {
    final attributes = item['attributes'] ?? {};
    final formats = attributes['formats'] ?? {};
    final url = formats['medium']?['url'] ?? attributes['url'];
    return url != null ? '$baseUrl$url' : ''; // เติม baseUrl และตรวจสอบ null
  }).where((url) => url.isNotEmpty).toList(); // กรอง URL ที่ว่างออก
}

class Garden {
  final String title;
  final String description;
  final List<String> imageUrls;

  Garden({
    required this.title,
    required this.description,
    required this.imageUrls,
  });

  factory Garden.fromJson(Map<String, dynamic> json, List<String> imageUrls) {
    if (json.isEmpty) {
      throw Exception('Invalid or missing JSON');
    }

    final details = json['Detail'] ?? [];
    String parsedDescription = '';

    if (details is List) {
      for (var paragraph in details) {
        if (paragraph is Map<String, dynamic>) {
          final children = paragraph['children'];
          if (children is List) {
            for (var child in children) {
              if (child is Map<String, dynamic>) {
                final text = child['text'];
                if (text != null && text is String) {
                  parsedDescription += '$text\n';
                }
              }
            }
          }
        }
      }
    } else {
      print('Detail is not a valid list: $details');
    }

    return Garden(
      title: json['title'] ?? 'No Title',
      description: parsedDescription.trim(),
      imageUrls: imageUrls,
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
