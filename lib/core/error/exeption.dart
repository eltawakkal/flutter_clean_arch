class GeneralExeption implements Exception {
  final String message;

  const GeneralExeption({required this.message});
}

class ServerExeption implements Exception {
  final String message;
  
  const ServerExeption({required this.message});
}

class StatusCodeExeption implements Exception {
  final String message;
  
  const StatusCodeExeption({required this.message});
}

class EmptyExeption implements Exception {
  final String message;
  
  const EmptyExeption({required this.message});
}