class BaseResponse<T> {
  final String? errorMessage;
  final bool isError;
  final T? data;

  BaseResponse({this.errorMessage, this.isError = false, this.data});

  static errorString(String error) => BaseResponse(errorMessage: error, isError: true);
}
