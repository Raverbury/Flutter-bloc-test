import 'package:equatable/equatable.dart';

abstract class APIEvent extends Equatable {
  const APIEvent();

  @override
  List<Object> get props => [];
}

class FetchEvent extends APIEvent {
  final int statusCode;
  const FetchEvent(this.statusCode);

  @override
  List<Object> get props => [statusCode];

  @override
  String toString() => 'FetchEvent: {$statusCode}';
}
