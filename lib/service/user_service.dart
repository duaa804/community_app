import 'package:community_app/model/data_user_model.dart';
import 'package:dio/dio.dart';

abstract class UserService {
  Dio req = Dio();
  late Response response;
  String baseUrl = 'https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/people';

  Future<List<DataUser>> getData();
}
class UserServiceImp extends UserService{
  @override
  Future<List<DataUser>> getData()async {
      try {
      response = await req.get(baseUrl);

      if (response.statusCode == 200) {
        List<DataUser> users = List.generate(
          response.data.length,
          (index) => DataUser.fromMap(
            response.data[index],
          ),
        );
        return users;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}

  

