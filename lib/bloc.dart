import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/event.dart';
import 'package:test/state.dart';
import 'package:http/http.dart' as http;

// logic level basically, process stuff based on event and return a state

class APIBloc extends Bloc<APIEvent, APIState> {
  APIBloc() : super(const DataFetched(statusCode: 0)) {
    on<FetchData>((event, emit) async {
      if (latestResponse.isNotEmpty) latestResponse.removeLast();
      latestResponse.add(await fetchData());
      emit(DataFetched(statusCode: response));
    });
  }

  List<int> latestResponse = [];
  int get response => latestResponse.first;

  // @override
  // Stream<APIState> on(APIEvent handler) async* {
  //   if (handler is FetchData) {
  //     if (latestResponse.isNotEmpty) latestResponse.removeLast();
  //     latestResponse.add(await fetchData());
  //     yield DataFetched(statusCode: response);
  //   }
  // }

  Future<int> fetchData() async {
    final raw = await http
        .get(Uri.parse('https://danganhapi.herokuapp.com/api/temperature'));
    return raw.statusCode;
  }
}
