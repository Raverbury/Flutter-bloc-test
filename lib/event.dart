import 'package:equatable/equatable.dart';

abstract class APIEvent extends Equatable {
  const APIEvent();

  @override
  List<Object> get props => [];
}

class FetchData extends APIEvent {
  const FetchData();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'FetchData event dispatched';
}
