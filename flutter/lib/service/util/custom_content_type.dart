enum CustomContentType {
  applicationJson,
  multipartFormData,
  connection,
}

extension ContentTypeExtension on CustomContentType {
  static const Map<CustomContentType, String> _map =
      <CustomContentType, String>{
    CustomContentType.applicationJson: 'application/json',
    CustomContentType.multipartFormData: 'multipart/form-data',
    CustomContentType.connection: 'keep-alive'
  };

  String get headerParameter => _map[this]!;
}
