class ErrorHandler {
  static String handleErrorMessage(dynamic error) {
    final errorLowercase = error.toString().toLowerCase();
    if (errorLowercase.contains(('timedout')) ||
        errorLowercase.contains('timed out') ||
        errorLowercase.contains(('timeout'))) {
      return 'Network disconnected. Please try again later.';
    } else if (errorLowercase.contains('SocketException')) {
      return 'No internet connection';
    } else if (errorLowercase.contains('500')) {
      return 'Server down. Please try again later. If the problem persists, please contact the administrator.';
    } else {
      return error.toString().replaceAll('Exception: ', '');
    }
  }
}
