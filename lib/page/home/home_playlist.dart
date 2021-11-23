import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/data_cubit.dart';
import 'package:test_app/model/data_model.dart';
import 'package:test_app/page/widget/card_playlist_widget.dart';
import 'package:test_app/page/widget/card_video_widget.dart';

class HomePlaylist extends StatelessWidget {
  const HomePlaylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 30,
          bottom: 10,
        ),
        child: Text(
          'Play List Materi',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      );
    }

    Widget content(List<DataModel> data) {
      return Container(
        margin: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data
              .map(
                (e) => CardVideoWidget(data: e),
              )
              .toList(),
        ),
      );
    }

    return Scaffold(
      body: BlocConsumer<DataCubit, DataState>(listener: (context, state) {
        if (state is DataFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Center(
                child: Text('terjadi error dalam fetch data'),
              ),
            ),
          );
        }
      }, builder: (context, state) {
        if (state is DataSuccess) {
          return ListView(
            children: [
              title(),
              content(state.data),
              SizedBox(height: 100),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
