abstract class IServicesException {
  final String? messageError;
  final String label;
  final StackTrace? stackTrace;
  final String? statusMessage;
  final int? statusCode;
  IServicesException(
      {required this.messageError,
      required this.label,
      this.stackTrace,
      this.statusMessage,
      this.statusCode});
}

class GetSevicesException extends IServicesException {
  GetSevicesException(
      {required super.messageError,
      required super.label,
      super.stackTrace,
      super.statusCode,
      super.statusMessage});
}

class PostSevicesException extends IServicesException {
  PostSevicesException(
      {required super.messageError,
      required super.label,
      super.stackTrace,
      super.statusCode,
      super.statusMessage});
}

class DeleteSevicesException extends IServicesException {
  DeleteSevicesException(
      {required super.messageError,
      required super.label,
      super.stackTrace,
      super.statusCode,
      super.statusMessage});
}

class PutSevicesException extends IServicesException {
  PutSevicesException(
      {required super.messageError,
      required super.label,
      super.stackTrace,
      super.statusCode,
      super.statusMessage});
}

class ServicesUnknowException extends IServicesException {
  ServicesUnknowException(
      {required super.messageError,
      required super.label,
      super.stackTrace,
      super.statusCode,
      super.statusMessage});
}
