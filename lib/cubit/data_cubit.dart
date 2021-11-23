import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/model/data_model.dart';
import 'package:test_app/service/data_service.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());

  void fetchData() async {
    try {
      emit(DataLoading());
      List<DataModel> data = await DataService().getData();
      emit(DataSuccess(data));
    } catch (e) {
      emit(DataFailed(e.toString()));
    }
  }

  void addData(DataModel data) async {
    try {
      emit(DataLoading());
      await DataService().createData(data);
    } catch (e) {
      emit(DataFailed(e.toString()));
    }
  }

  void deleteData(String doc) async {
    try {
      emit(DataLoading());
      await DataService().deleteData(doc);
    } catch (e) {
      emit(DataFailed(e.toString()));
    }
  }

  void updateData(DataModel data, String doc) async {
    try {
      emit(DataLoading());
      await DataService().updateData(data, doc);
    } catch (e) {
      emit(DataFailed(e.toString()));
    }
  }
}
