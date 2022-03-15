import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/event.dart';
import 'package:test/state.dart';
import 'package:http/http.dart' as http;

class APIBloc extends Bloc<APIEvent, APIState> {
  APIBloc() : super(const DataFetched(statusCode: 0));

  List<int> latestResponse = [];
  int get response => latestResponse.first;

  @override
  Stream<APIState> mapEventToState(APIEvent event) async* {
    if (event is FetchData) {
      if (latestResponse.isNotEmpty) latestResponse.removeLast();
      latestResponse.add(await fetchData());
      yield DataFetched(statusCode: response);
    }
  }

  Future<int> fetchData() async {
    final raw = await http
        .get(Uri.parse('https://danganhapi.herokuapp.com/api/temperature'));
    return raw.statusCode;
  }
}
