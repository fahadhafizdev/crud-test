import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/model/data_model.dart';

class CardPlaylist extends StatefulWidget {
  final DataModel data;

  const CardPlaylist({Key? key, required this.data}) : super(key: key);

  @override
  State<CardPlaylist> createState() => _CardPlaylistState();
}

class _CardPlaylistState extends State<CardPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            widget.data.name,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 12),
          Image.asset(
            'assets/city4.png',
            width: double.infinity,
            height: 90,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
