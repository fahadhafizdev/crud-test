import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class PageCubit extends Cubit<int> {
  PageCubit() : super(1);

  void setPage(int page) {
    emit(page);
  }
}
