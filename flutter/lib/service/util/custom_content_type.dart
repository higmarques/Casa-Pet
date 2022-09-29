enum CustomContentType {
  applicationJson,
  multipartFormData,
}

extension ContentTypeExtension on CustomContentType {
  static const Map<CustomContentType, String> _map =
      <CustomContentType, String>{
    CustomContentType.applicationJson: 'application/json',
    CustomContentType.multipartFormData: 'multipart/form-data',
  };

  String get headerParameter => _map[this]!;
}
