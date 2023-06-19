String getMessage(error, {String? message}) {
  try {
    /// Sem conexão com a internet
    if (error.message.toString().contains('Network is unreachable') ||
        error.message.toString().contains('Failed host lookup') ||
        error.message.toString().contains('Failed host lookup') ||
        error.message.toString().contains('internet')) {
      return 'no connection';
    }

    return error?.message ?? 'bad request';
  } catch (e) {
    return message ?? 'bad request';
  }
}
