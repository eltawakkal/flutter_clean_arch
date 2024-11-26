import '../../screens/detail_page.dart';
import '../widgets/movie_item_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/movie_bloc.dart';
import '../../bloc/movie_event.dart';
import '../../bloc/movie_state.dart';
import '../../../../../widgets/movie_text.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {

    refreshData() {
      context.read<MovieBloc>().add(MovieEventGetFavoritedMovies());
    }

    return BlocBuilder<MovieBloc, BaseMovieState>(
      bloc: context.read<MovieBloc>()..add(MovieEventGetFavoritedMovies()),
      builder: (context, state) {
        if (state is MovieStateLoadedMovieFromFavorite) {
          if (state.movies.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                  child: MovieText(text: 'No Favorited Yet, Please Add One From Movie List',
                  size: 16,
                  textAlign: TextAlign.center,
                  weight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const MovieText(text: 'Favorited Movies', size: 18, weight: FontWeight.bold,),
              ),
              body: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: state.movies.length,
                itemBuilder: (context, index) => MovieItemContainer(
                  action: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(movie: state.movies[index],),
                      ),
                    );
                    refreshData();
                  },
                  movie: state.movies[index]
                ),
              ),
            );
          }
        } else {
          return const Padding(
            padding: EdgeInsets.all(30),
            child: Center(
                child: MovieText(text: 'No Favorited Yet, Please Add One From Movie List',
                size: 16,
                textAlign: TextAlign.center,
                weight: FontWeight.bold,
              ),
            ),
          );
        }
      }
    );
  }
}