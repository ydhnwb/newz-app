class ServerException implements Exception{
  final int code;
  final String message;

  ServerException({required this.code, required this.message});
}

class CacheException implements Exception{
  final int code;
  final String message;

  CacheException({required this.code, required this.message});
}