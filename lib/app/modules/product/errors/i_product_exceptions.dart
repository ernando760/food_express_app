// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class IProductException {
  String messageError;
  String label;
  StackTrace? stackTrace;
  IProductException({
    required this.messageError,
    required this.label,
    this.stackTrace,
  });
}

class GetAllProductsException extends IProductException {
  GetAllProductsException(
      {required super.messageError, required super.label, super.stackTrace});
}

class ProductUnknowException extends IProductException {
  ProductUnknowException(
      {required super.messageError, required super.label, super.stackTrace});
}
