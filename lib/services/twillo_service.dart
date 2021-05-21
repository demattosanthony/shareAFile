import 'package:http/http.dart' as http;

abstract class TwilloService {
  void sendEmail(String email, String msg);
}

class TwilloServiceImplementation implements TwilloService {
  void sendEmail(String email, String msg) async {
    var host = 'http://localhost:3000/';
    var url = host + 'sendEmail';

    var response = await http.post(url, body: {'email': email, 'link': msg});

    if (response.statusCode == 200) {
      print('success');
    } else {
      print('Error sending email');
    }
  }
}
