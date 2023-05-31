String getIp() => "192.168.137.3:5000";
String image(String? imagePath) => "http://${getIp()}/register/$imagePath";
