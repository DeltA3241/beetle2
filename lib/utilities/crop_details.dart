class CropDetails {
  final List<String> _crops = [
    'pepper',
    'banana',
    'wheat',
    'capsicum',
  ];
  String getCrop(int index) {
    return _crops[index % 3];
  }

  String getDeatils(String crop, String disease, String description) {
    return 'The app says my $crop crop is infected by $disease. The description is as follows:\n$description';
  }

  String getTitle(String crop) {
    return 'Advise needed for crop $crop';
  }
}
