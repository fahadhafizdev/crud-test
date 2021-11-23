import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/data_cubit.dart';
import 'package:test_app/model/data_model.dart';

import 'home/main_page.dart';

class EditPage extends StatelessWidget {
  final DataModel data;

  const EditPage({Key? key, required this.data}) : super(key: key);

  Widget build(BuildContext context) {
    TextEditingController inputName =
        TextEditingController(text: '${data.name}');
    TextEditingController inputUrl = TextEditingController(text: '${data.url}');

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
              'Edit Data',
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
              decoration: InputDecoration(hintText: 'masukan url youtube'),
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
                    context.read<DataCubit>().updateData(
                        DataModel(name: inputName.text, url: inputUrl.text),
                        data.id);
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
