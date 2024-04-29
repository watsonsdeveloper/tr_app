class ErrorHandler {
  static String handleErrorMessage(dynamic error) {
    final errorLowercase = error.toString().toLowerCase();
    if (errorLowercase.contains(('timedout')) ||
        errorLowercase.contains('timed out')) {
      return 'Network disconnected. Please try again later.';
    } else if (errorLowercase.contains('SocketException')) {
      return 'No internet connection';
    } else {
      return error.toString().replaceAll('Exception: ', '');
    }
  }
}
