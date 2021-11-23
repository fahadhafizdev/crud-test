import 'package:flutter/material.dart';
import 'package:test_app/cubit/data_cubit.dart';
import 'package:test_app/model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/page/edit_page.dart';
import 'package:test_app/page/home/main_page.dart';

class CardDataWidget extends StatelessWidget {
  final DataModel data;

  const CardDataWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 25,
      ),
      margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 12),
              Container(
                width: 150,
                child: Text(
                  data.url,
                  overflow: TextOverflow.clip,
                ),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
              onTap: () {
                context.read<DataCubit>().deleteData(data.id);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                    (route) => false);
              },
              child: Icon(Icons.delete)),
          SizedBox(width: 12),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditPage(
                      data: data,
                    ),
                  ),
                );
              },
              child: Icon(Icons.edit)),
        ],
      ),
    );
  }
}
