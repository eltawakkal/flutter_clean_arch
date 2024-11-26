import 'package:fadhli_test_flutter/features/movie/presentation/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/movie_item_container.dart';

import '../bloc/movie_bloc.dart';
import '../bloc/movie_event.dart';
import '../bloc/movie_state.dart';
import '../../../../injection.dart';
import '../../../../widgets/movie_text.dart';

class UpcomingPage extends StatelessWidget {
  const UpcomingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, BaseMovieState>(
      bloc: movieInjection<MovieBloc>()..add(MovieEventGetUpcoming(1)),
      builder: (context, state) {
        if (state is MovieStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieStateError) {
          return Center(
            child: MovieText(text: state.message,),
          );
        } else if (state is MovieStateLoadedMovieList) {
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: state.movies.length,
            itemBuilder: (context, index) => MovieItemContainer(
              action: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => DetailPage(movie: state.movies[index],))
              ),
              movie: state.movies[index],
            ),
          );
        } else {
          return const Center(
            child: MovieText(text: "EMPTY DATA",),
          );
        }
      }
    );
  }
}