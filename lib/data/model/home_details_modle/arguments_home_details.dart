
class ArgumentDetailsProject {
  String _projectDescription;
  String _projectName;
  String _image;
  ArgumentDetailsProject(
    this._projectDescription,
    this._projectName,
    this._image,
  );

  String get projectDescription => _projectDescription;
  String get projectName => _projectName;
  String get image => _image;

  set projectDescription(String value) {
    _projectDescription = value;
  }
  set projectName(String value) {
    _projectName = value;
  }
  set image(String value) {
    _image = value;
  }
}
