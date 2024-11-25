import 'package:fadhli_test_flutter/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:fadhli_test_flutter/features/movie/presentation/bloc/movie_event.dart';
import 'package:fadhli_test_flutter/features/movie/presentation/bloc/movie_state.dart';
import 'package:fadhli_test_flutter/features/movie/presentation/pages/widgets/movie_item_container.dart';
import 'package:fadhli_test_flutter/widgets/movie_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                itemBuilder: (context, index) => MovieItemContainer(movie: state.movies[index]),
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