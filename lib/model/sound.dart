class Sound {
  final String name;
  final String description;

  const Sound({this.name, this.description});

  String getLogoPath() {
    return "assets/icons/$name.png";
  }

  String getSoundPath() {
    return "assets/sounds/$name.mp3";
  }
}
