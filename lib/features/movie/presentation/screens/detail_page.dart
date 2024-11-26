import 'package:country_flags/country_flags.dart';
import 'package:fadhli_test_flutter/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/local_constants.dart';
import '../../../../widgets/movie_text.dart';
import '../../domain/entities/movie.dart';
import '../bloc/movie_bloc.dart';
import '../bloc/movie_event.dart';
import '../bloc/movie_state.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;

  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, BaseMovieState>(
      bloc: context.read<MovieBloc>()..add(MovieEventGetSingleFavoritedMovies(movie.id.toString())),
      builder: (context, state) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leadingWidth: 43,
              leading: CircleAvatar(
                child: BackButton(
                  color: Theme.of(context).primaryColor
                ),
              ),
              pinned: true,
              title: const MovieText(
                text: 'Detail Movie',
                color: Colors.white,
                size: 20,
                weight: FontWeight.bold,
              ),
              actions: [
                CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      if (state is MovieStateFavorited) {
                        context.read<MovieBloc>().add(MovieEventDeletFavoritedMovie(movie.id.toString()));
                      } else {
                        context.read<MovieBloc>().add(MovieEventAddToFavorite(movie));
                      }
                    },
                    icon: Icon(state is MovieStateFavorited ? Icons.favorite : Icons.favorite_border)
                  ),
                ),
              ],
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
              padding: const EdgeInsets.all(20),
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
      ),
    );
  }
}