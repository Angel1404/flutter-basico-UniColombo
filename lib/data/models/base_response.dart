class BaseResponse {
  final String? errorMessage;
  final bool isError;
  final dynamic data;

  BaseResponse({this.errorMessage, this.isError = false, this.data});

  static BaseResponse errorString(String error) => BaseResponse(errorMessage: error, isError: true);
}
