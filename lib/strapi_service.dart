import 'dart:convert';
import 'package:http/http.dart' as http;

class StrapiService {
  final String baseUrl = 'http://localhost:1337';

  Future<List<dynamic>> fetchArticles() async {
    final response = await http.get(Uri.parse('$baseUrl/api/Blog'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load Blog');
    }
  }
}

Future<List<Garden>> fetchGardens() async {
  final response = await http.get(Uri.parse('http://localhost:1337/api/Blog'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body)['data'];
    return data.map((item) => Garden.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load gardens');
  }
}

class Garden {
  final String title;
  final String description;
  final List<String> imageUrls;

  Garden({required this.title, required this.description, required this.imageUrls});

  factory Garden.fromJson(Map<String, dynamic> json) {
    return Garden(
      title: json['attributes']['title'],
      description: json['attributes']['description'],
      imageUrls: (json['attributes']['images']['data'] as List<dynamic>)
          .map((image) => image['attributes']['url'] as String)
          .toList(),
    );
  }
}

void main() async {
  final strapiService = StrapiService();

  try {
    final articles = await strapiService.fetchArticles();
    print('Fetched ${articles.length} articles.');

    final gardens = await fetchGardens();
    print('Fetched ${gardens.length} gardens.');
  } catch (e) {
    print('Error: $e');
  }
}