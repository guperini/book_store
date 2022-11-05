import '../../../../core/constants/constants.dart';
import '../../../../domain/book/book_entity.dart';
import '../../../widgets/loading_indicator.dart';
import '../../../widgets/round_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final BookEntity book;
  final Function onTap;

  const BookItem({
    Key? key,
    required this.book,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      onTap: () => onTap(),
      radius: 10,
      shadow: false,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: CachedNetworkImage(
              imageUrl: book.volumeInfo!.imageLinks?.smallThumbnail ?? Constants.bookNoImagePlaceHolder,
              placeholder: (context, url) => const LoadingIndicator(
                size: 20,
                color: Colors.grey,
              ),
              errorWidget: (context, url, error) {
                return const Icon(Icons.image_not_supported);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              book.volumeInfo!.title!,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: const TextStyle(fontSize: 10),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                book.volumeInfo!.publishedDate ?? '',
                style: const TextStyle(color: Colors.grey, fontSize: 10, height: 1.5),
              ),
              const SizedBox(width: 15),
              Icon(
                Icons.star,
                color: book.isFavorite ? Colors.yellow : Colors.grey,
                size: 12,
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
