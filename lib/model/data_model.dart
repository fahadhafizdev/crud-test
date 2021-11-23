import 'package:equatable/equatable.dart';

class DataModel extends Equatable {
  String id;
  String name;
  String url;

  DataModel({this.id = '', required this.name, required this.url});

  factory DataModel.fromJson(String id, Map<String, dynamic> json) => DataModel(
        id: id,
        name: json['name'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'url': url,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, url];
}
