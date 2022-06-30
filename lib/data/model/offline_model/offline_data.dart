class ProjectOffline {
  final String description;
  final String name;
  final String image;

  const ProjectOffline({
    required this.description,
    required this.name,
    required this.image,
  });

  // Convert a ProjectOffline into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'name': name,
      'image': image,
    };
  }

  // Implement toString to make it easier to see information about
  // each ProjectOffline when using the print statement.
  @override
  String toString() {
    return 'ProjectOffline{description: $description, name: $name, image: $image}';
  }
}