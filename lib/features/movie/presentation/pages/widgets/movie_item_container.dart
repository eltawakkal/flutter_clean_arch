import 'package:country_flags/country_flags.dart';
import 'package:fadhli_test_flutter/features/movie/presentation/pages/detail_page.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../domain/entities/movie.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/movie_text.dart';
import '../../../../../core/constants/local_constants.dart';

class MovieItemContainer extends StatelessWidget {
  final Movie movie;

  const MovieItemContainer({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(movie: movie,)));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 150,
              width: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                  placeholder: LocalConstants.assetImageGif('loading_gif.gif'),
                  image: ApiConstants.getImageUrl(movie.posterPath ?? 'df'),
                  // image: 'https://i.pinimg.com/236x/de/66/43/de6643f9e492b5d692166031425bcc84.jpg',
                  fit: BoxFit.cover,
                )
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieText(
                    text: movie.title!,
                    size: 16,
                    weight: FontWeight.bold,
                  ),
                  MovieText(
                    text: movie.overview!,
                    size: 16,
                    maxLines: 3,
                    weight: FontWeight.normal,
                  ),
                  Row(
                    children: [
                      CountryFlag.fromLanguageCode(
                        movie.originalLanguage!,
                        width: 22,
                        height: 17,
                      ),
                      const SizedBox(width: 10,),
                      const Icon(Icons.star),
                      const SizedBox(width: 10,),
                      MovieText(text: movie.voteAverage.toString(), color: Colors.black54,)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}