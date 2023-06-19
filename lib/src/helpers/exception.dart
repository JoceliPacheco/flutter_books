String getMessage(error, {String? message}) {
  try {
    /// Verifica se é erro com requisição

    /// Sem conexão com a internet
    if (error.message.toString().contains('Network is unreachable') ||
        error.message.toString().contains('Failed host lookup') ||
        error.message.toString().contains('Failed host lookup') ||
        error.message.toString().contains('internet')) {
      return 'Sem conexão com a internet';
    }

    /// Url informada não pôde ser encontrada
    if (error.message.toString().contains('OS Error: Connection refused')) {
      return 'URL informada é inválida';
    }

    /// Erro 400 com mensagem no corpo da requisição ['message']
    if (error.response != null && error.response!.data["message"] != null) {
      return error.response!.data["message"].toString();
    }

    /// Erro 400 com mensagem no corpo da requisição ['error']
    if (error.response != null && error.response!.data["error"] != null) {
      return error.response!.data["error"].toString();
    }

    return error?.message ?? 'Erro';
  } catch (e) {}

  return message ?? 'Erro';
}
