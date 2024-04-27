class EmptyItemModel {
  final String? mainHeader;
  final String image;
  final String mainTextHeader;
  final String h1;
  final String? h2;

  EmptyItemModel({
    this.mainHeader,
    required this.mainTextHeader,
    required this.h1,
    required this.image,
    this.h2,
  });
}

