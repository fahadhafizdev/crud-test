import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/data_cubit.dart';
import 'package:test_app/cubit/page_cubit.dart';
import 'package:test_app/model/data_model.dart';
import 'package:test_app/page/home/main_page.dart';

class AddDataPage extends StatelessWidget {
  const AddDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController inputName = TextEditingController(text: '');
    TextEditingController inputUrl = TextEditingController(text: '');

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Data',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 40),
            Text('Name Materi'),
            TextFormField(
              controller: inputName,
              decoration: InputDecoration(hintText: 'masukan nama materi'),
            ),
            SizedBox(height: 12),
            Text('Url Yutub'),
            TextFormField(
              controller: inputUrl,
              decoration: InputDecoration(hintText: 'masukan url yutub'),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (inputName.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('field nama materi wajib di isi'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 2),
                    ));
                  } else if (inputUrl.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('field url materi wajib di isi'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 2),
                    ));
                  } else if (inputUrl.text == '' && inputName.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('field wajib di isi'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 2),
                    ));
                  } else if (!inputUrl.text.contains('youtu')) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Url harus lah dari youtube'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 2),
                    ));
                  } else {
                    context.read<DataCubit>().addData(
                          DataModel(name: inputName.text, url: inputUrl.text),
                        );
                    context.read<PageCubit>().setPage(1);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                        (route) => false);
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
