String getMessage(error, {String? message}) {
  try {
    /// Sem conexão com a internet
    if (error.message.toString().contains('Network is unreachable') ||
        error.message.toString().contains('Failed host lookup') ||
        error.message.toString().contains('Failed host lookup') ||
        error.message.toString().contains('internet')) {
      return 'no connection';
    }

    /// Erro 400 com mensagem no corpo da requisição ['message']
    if (error.response != null && error.response!.data["message"] != null) {
      return error.response!.data["message"].toString();
    }

    /// Erro 400 com mensagem no corpo da requisição ['error']
    if (error.response != null && error.response!.data["error"] != null) {
      return error.response!.data["error"].toString();
    }

    return error?.message ?? 'bad request';
  } catch (e) {}

  return message ?? 'bad request';
}
