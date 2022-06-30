import 'dart:async';
import 'package:taskproject/data/repositorys/requests.dart';

class Repositories {
  final RequestsRepository requestsRepository;

  Repositories(this.requestsRepository);
    Future<dynamic> getHomeData() async {
    final dynamic = await requestsRepository.homeDataCondition();
    return dynamic;
  }

}
