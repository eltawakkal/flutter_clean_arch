import 'package:country_flags/country_flags.dart';
import 'package:fadhli_test_flutter/core/constants/api_constants.dart';
import 'package:fadhli_test_flutter/features/movie/domain/entities/movie.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/local_constants.dart';
import '../../../../widgets/movie_text.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;

  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: const MovieText(
              text: 'Detail Movie',
            ),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Stack(
                children: [
                  Positioned(
                    top: 0, left: 0, right: 0,
                    bottom: 90,
                    child: FadeInImage.assetNetwork(
                      placeholder: LocalConstants.assetImageGif('loading_gif.gif'),
                      image: ApiConstants.getImageUrl(movie.backdropPath!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0, left: 20,
                    child: SizedBox(
                      height: 150,
                      width: 110,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage.assetNetwork(
                          placeholder: LocalConstants.assetImageGif('loading_gif.gif'),
                          image: ApiConstants.getImageUrl(movie.posterPath!),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0, left: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MovieText(
                          text: movie.title!,
                          size: 16,
                          maxLines: 2,
                          weight: FontWeight.bold,
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
                    )
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverList.list(
              children: [
                MovieText(
                  maxLines: 100,
                  text: movie.overview!,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}