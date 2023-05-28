import 'package:blade/app/data/networks/network_api_services.dart';
import '../../../resources/appurl/app_url.dart';

class  ListModelsRepository{
  final _apiService = NetworkAPIServices();


  Future<dynamic> modelListRepository()async{
    dynamic response = await _apiService.getAPI("${APPUrl.base_url}/models");
    print("Json Response with Models $response");
    return response;
  }
}