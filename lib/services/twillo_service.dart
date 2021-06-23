import 'dart:io';

import 'package:http/http.dart' as http;

abstract class TwilloService {
  Future<int> sendEmail(String email, String msg);
}

class TwilloServiceImplementation implements TwilloService {
  Future<int> sendEmail(String email, String msg) async {
    // var host = 'http://localhost:3000/';
    var host = 'https://limitless-inlet-76490.herokuapp.com/';
    var url = host + 'sendEmail';

    var response = await http.post(url, body: {'email': email, 'link': msg});

    if (response.statusCode == 200) {
      print('success');
    } else {
      print('Error sending email');
    }
    return response.statusCode;
  }
}
