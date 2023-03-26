import '../common/constant.dart';

abstract class NetworkResult<T> {
  int? get statusCode;

  T get data;
}

class ResultSuccess<T> extends NetworkResult {
  ResultSuccess({
    this.statusCode = zeroInt,
    required this.data,
  });

  @override
  final int statusCode;

  @override
  final T data;
}

class ResultError<T> extends NetworkResult {
  ResultError({
    this.statusCode = zeroInt,
    required this.data,
  });

  @override
  final int statusCode;

  @override
  final T data;
}

class ResultException<T> extends NetworkResult {
  ResultException({
    this.statusCode,
    required this.data,
  });

  @override
  final int? statusCode;

  @override
  final T data;
}
