abstract class Fauilers {
  String ErrorMasege;
  Fauilers({required this.ErrorMasege});
}

class ServerError extends Fauilers {
  ServerError({required super.ErrorMasege});
}

class NetworkError extends Fauilers {
  NetworkError({required super.ErrorMasege});
}
