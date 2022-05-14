class CropDetails {
  final List<String> _crops = [
    'pepper',
    'potato',
    'citrus',
    'tomato',
  ];
  String getCrop(int index) {
    return _crops[index];
  }

  String getDeatils(String crop, String disease, String description) {
    return 'The app says my $crop crop is infected by $disease. The description is as follows:\n$description';
  }

  String getTitle(String crop) {
    return 'Advise needed for crop $crop';
  }

  int getCropCount() {
    return _crops.length;
  }
}
