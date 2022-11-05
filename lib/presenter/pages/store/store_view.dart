import 'componentes/no_books_to_show.dart';
import '../../widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'store_controller.dart';
import 'componentes/header_store.dart';
import 'componentes/books_gridview.dart';

class StoreView extends GetView<StoreController> {
  const StoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeaderStore(),
            if (controller.booksToShow.isNotEmpty)
              const Expanded(child: BooksGridView())
            else if (!controller.isloading.value)
              const NoBooksToShow(),
            if (controller.isloading.value)
              const SizedBox(
                height: 60,
                width: 60,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: LoadingIndicator(key: Key('loading'), size: 20),
                ),
              )
          ],
        ),
      ),
    );
  }
}
