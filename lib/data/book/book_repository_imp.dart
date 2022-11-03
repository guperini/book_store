import 'package:dartz/dartz.dart';

import '../../domain/book/book_entity.dart';
import '../../domain/book/book_repository.dart';
import 'book_dto.dart';

class BookRepositoryImp implements BookRepository {
  @override
  Future<Either<Exception, List<BookEntity>>> searchBooks(String searchText) async {
    final json = {
      "kind": "books#volume",
      "id": "q9MsAwAAQBAJ",
      "etag": "d18iR5uJiLk",
      "selfLink": "https://www.googleapis.com/books/v1/volumes/q9MsAwAAQBAJ",
      "volumeInfo": {
        "title": "iOS App Development For Dummies",
        "authors": ["Jesse Feiler"],
        "publisher": "John Wiley & Sons",
        "publishedDate": "2014-04-14",
        "description":
            "If you’ve got incredible iOS ideas, get this book and bring them to life! iOS 7 represents the most significant update to Apple’s mobile operating system since the first iPhone was released, and even the most seasoned app developers are looking for information on how to take advantage of the latest iOS 7 features in their app designs. That’s where iOS App Development For Dummies comes in! Whether you’re a programming hobbyist wanting to build an app for fun or a professional developer looking to expand into the iOS market, this book will walk you through the fundamentals of building a universal app that stands out in the iOS crowd. Walks you through joining Apple’s developer program, downloading the latest SDK, and working with Apple’s developer tools Explains the key differences between iPad and iPhone apps and how to use each device’s features to your advantage Shows you how to design your app with the end user in mind and create a fantastic user experience Covers using nib files, views, view controllers, interface objects, gesture recognizers, and much more There’s no time like now to tap into the power of iOS – start building the next big app today with help from iOS App Development For Dummies!",
        "industryIdentifiers": [
          {"type": "ISBN_13", "identifier": "9781118871058"},
          {"type": "ISBN_10", "identifier": "1118871057"}
        ],
        "readingModes": {"text": false, "image": true},
        "pageCount": 576,
        "printType": "BOOK",
        "categories": ["Computers"],
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "1.7.4.0.preview.1",
        "panelizationSummary": {"containsEpubBubbles": false, "containsImageBubbles": false},
        "imageLinks": {
          "smallThumbnail":
              "http://books.google.com/books/content?id=q9MsAwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
          "thumbnail":
              "http://books.google.com/books/content?id=q9MsAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
        },
        "language": "en",
        "previewLink":
            "http://books.google.pt/books?id=q9MsAwAAQBAJ&printsec=frontcover&dq=ios&hl=&cd=1&source=gbs_api",
        "infoLink": "http://books.google.pt/books?id=q9MsAwAAQBAJ&dq=ios&hl=&source=gbs_api",
        "canonicalVolumeLink":
            "https://books.google.com/books/about/iOS_App_Development_For_Dummies.html?hl=&id=q9MsAwAAQBAJ"
      },
      "saleInfo": {"country": "PT", "saleability": "NOT_FOR_SALE", "isEbook": false},
      "accessInfo": {
        "country": "PT",
        "viewability": "PARTIAL",
        "embeddable": true,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {"isAvailable": false},
        "pdf": {
          "isAvailable": true,
          "acsTokenLink":
              "http://books.google.pt/books/download/iOS_App_Development_For_Dummies-sample-pdf.acsm?id=q9MsAwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "webReaderLink": "http://play.google.com/books/reader?id=q9MsAwAAQBAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "SAMPLE",
        "quoteSharingAllowed": false
      },
      "searchInfo": {
        "textSnippet":
            "If you’ve got incredible iOS ideas, get this book and bring them to life! iOS 7 represents the most significant update to Apple’s mobile operating system since the first iPhone was released, and even the most seasoned app developers are ..."
      }
    };

    final book = Book.fromJson(json);

    return Right([book]);
  }
}
