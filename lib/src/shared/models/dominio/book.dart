class Book {
  String id;
  String title;
  String subtitle;
  String publisher;
  List<String> authors;
  String description;

  Book({
    required this.id,
    required this.title,
    this.subtitle = '',
    this.publisher = '',
    this.description = '',
    this.authors = const [],
  });
}
