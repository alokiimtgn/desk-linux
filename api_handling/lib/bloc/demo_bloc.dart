import 'dart:async';

import 'dart:ffi';

import 'api_controller_json.dart';

class DemoBloc implements Bloc {
  final StreamController _apiController = StreamController<List>();
  Stream get apiController => _apiController.stream;

  Future<Void> getData() async {
    ApiControllerJson apiControllerJson = ApiControllerJson();
    List data = await apiControllerJson.fetchPost();
    //5.2
    if (data.length > 20) data = data.sublist(0, 25);
    //5.3
    _apiController.sink.add(data);
  }

  @override
  void dispose() {
    _apiController.close();
  }
}

abstract class Bloc {
  void dispose();
}
