import 'package:flutter/material.dart';
import 'package:test_app/cubit/data_cubit.dart';
import 'package:test_app/model/data_model.dart';
import 'package:test_app/page/home/home_playlist.dart';
import 'package:test_app/page/widget/card_data_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DataCubit>().fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget content(List<DataModel> data) {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
          right: 24,
          left: 24,
        ),
        width: double.infinity,
        child: Column(
          children: data
              .map((e) => CardDataWidget(
                    data: e,
                  ))
              .toList(),
        ),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          left: 30,
          right: 24,
          top: 30,
          bottom: 10,
        ),
        child: Text(
          'Halaman Data',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
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
