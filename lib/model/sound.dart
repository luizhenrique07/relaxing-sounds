class Sound {
  final String fileName;
  final String name;

  const Sound({this.fileName, this.name});

  String getLogoPath() {
    return "assets/icons/$fileName.png";
  }

  String getSoundPath() {
    return "assets/sounds/$fileName.mp3";
  }
}
