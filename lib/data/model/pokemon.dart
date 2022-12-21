// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pokemon {
  int id;
  String name;
  String url;
  Pokemon({
    required this.id,
    required this.name,
    required this.url,
  });

  Pokemon.fromJson(Map<String, dynamic> data)
    : id = data['id'], 
      name = data['name'],
      url = data['img'];

}
