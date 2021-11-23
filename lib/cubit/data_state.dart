part of 'data_cubit.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataFailed extends DataState {
  final String error;
  DataFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class DataSuccess extends DataState {
  final List<DataModel> data;
  DataSuccess(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}
