import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'book_details_controller.dart';
import 'componentes/header_book_details.dart';
import 'componentes/body_book_details.dart';

class BookDetailsView extends GetView<BookDetailsController> {
  const BookDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          HeaderBookDetails(),
          BodyBookDetails(),
        ],
      ),
    );
  }
}
    // inserir a rota:
    // static const bookDetails = '/bookDetails';

    // Colocar no arquivo de rotas dentro da lista de rotas:
    // GetPage(
    //   name: Rotas.bookDetails,
    //   page: () => BookDetailsView(),
    //   transition: Transition.native,
    //   binding: BookDetailsBinding(),
    // ),

