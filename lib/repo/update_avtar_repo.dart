import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constant/api_routes.dart';

Future<String?> uploadUserImage({String? fileName, var image}) async {
  print(ApiRoutes.dataToken);
  Map<String, String> header = {
    "Authorization": '${ApiRoutes.dataToken}',
    "Content-Type": "multipart/form-data"
  };
  var mulReq = await http.MultipartFile.fromPath("file", image!.path);

  var multipartRequest =
      http.MultipartRequest("POST", Uri.parse("${ApiRoutes.uploadAvatar}"));
  multipartRequest.headers.addAll(header);
  multipartRequest.files.add(mulReq);
  multipartRequest.send().then((response) {
    print("UploadUserImage Status Code:${response.statusCode}");

    print("Uploaded!");
    try {
      response.stream.transform(utf8.decoder).listen((value) {
        // response.data
        print("value ${value}");
        print("URL:${jsonDecode(value)}");
        return jsonDecode(value)['image_url'];
        print(response.reasonPhrase);
      });
    } catch (e) {
      return null;
    }
  });
  return null;
}
