import 'package:blade/app/data/networks/network_api_services.dart';
import '../../../models/chat_gpt_model_id_list.dart';
import '../../../resources/appurl/app_url.dart';

class  ChatGPTListModelRepo{
  final _apiService = NetworkAPIServices();


  Future<ChatGPTModelList> modelListRepository()async{
    dynamic response = await _apiService.getAPI("${APPUrl.base_url}/models");
    print("Json Response with Models $response");
    return ChatGPTModelList.fromJson(response);
  }
}