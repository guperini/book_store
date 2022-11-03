import '../../data/book/book_dto.dart';

class BookEntity {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookEntity({kind, id, etag, selfLink, volumeInfo, saleInfo, accessInfo, searchInfo});
}
