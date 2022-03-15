abstract class APIState {
  final int statusCode;
  const APIState({required this.statusCode});

  // @override
  List<Object> get props => [];
}

class DataFetched extends APIState {
  // final int statusCode;
  const DataFetched({required statusCode}) : super(statusCode: statusCode);

  @override
  List<Object> get props => [statusCode];

  @override
  String toString() => 'DataFetched: {response: $statusCode}';
}
