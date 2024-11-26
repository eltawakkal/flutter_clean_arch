import 'package:fadhli_test_flutter/features/movie/domain/entities/movie.dart';
import 'package:fadhli_test_flutter/features/movie/presentation/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/movie_item_container.dart';

import '../../bloc/movie_bloc.dart';
import '../../bloc/movie_event.dart';
import '../../bloc/movie_state.dart';
import '../../../../../widgets/movie_text.dart';


class NowPlayingPage extends StatelessWidget {
  const NowPlayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    int page = 1;
    List<Movie> movieList = [];

    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        context.read<MovieBloc>().add(MovieEventGetNowPlaying(page++));
      }
    });

    return BlocBuilder<MovieBloc, BaseMovieState>(
      bloc: context.read<MovieBloc>()..add(MovieEventGetNowPlaying(page)),
      builder: (context, state) {
        if (state is MovieStateError) {
          return Center(
            child: MovieText(text: state.message,),
          );
        } else if (state is MovieStateLoadedMovieList) {
          movieList.addAll(state.movies);
        }

        return ListView(
          controller: scrollController,
          padding: const EdgeInsets.all(20),
          children: [
            Column(
              children: movieList.map((movie) => MovieItemContainer(
                movie: movie,
                action: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DetailPage(movie: movie,))
                ),
              )).toList(),
            ),
            const Center(
              child: CircularProgressIndicator(),
            )
          ],
        );
      }
    );
  }
}