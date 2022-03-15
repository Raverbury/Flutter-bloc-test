import 'package:equatable/equatable.dart';

// events, sent from ui to bloc

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
