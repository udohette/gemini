abstract class BaseAPIServices{

  Future<dynamic> getAPI(String url);

  Future<dynamic> postAPI(Map<dynamic, dynamic> data, String url);
}