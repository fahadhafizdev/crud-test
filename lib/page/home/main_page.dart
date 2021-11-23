import 'package:flutter/material.dart';
import 'package:test_app/cubit/page_cubit.dart';
import 'package:test_app/page/add_data_page.dart';
import 'package:test_app/page/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/page/home/home_playlist.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Widget bottomNavbar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                context.read<PageCubit>().setPage(0);
                print(context.read<PageCubit>().state);
                ;
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 25,
                ),
                margin: EdgeInsets.only(left: 24),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddDataPage()));
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read<PageCubit>().setPage(1);
                print(context.read<PageCubit>().state);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 25,
                ),
                margin: EdgeInsets.only(right: 24),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Text(
                  'Input',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content(int newPage) {
      switch (newPage) {
        case 0:
          return HomePlaylist();
        case 1:
          return HomePage();
        default:
          return HomePlaylist();
      }
    }

    return BlocBuilder<PageCubit, int>(builder: (context, state) {
      return Scaffold(
        body: Stack(
          children: [
            content(state),
            bottomNavbar(),
          ],
        ),
      );
    });
  }
}
