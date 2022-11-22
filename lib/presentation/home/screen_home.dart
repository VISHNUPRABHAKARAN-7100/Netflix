import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/home/home_bloc.dart';
import 'package:netflix_app/presentation/home/widgets/background_card.dart';
import 'package:netflix_app/presentation/home/widgets/number_title_card.dart';
import '../../core/constants/constants.dart';
import '../widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  ValueNotifier scrollNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, value, child) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    } else if (state.hasError) {
                      return const Center(
                        child: Text(
                          'Error while getting data',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                    //  Resleased Past year
                    final _releasedPastYear = state.pastYearMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _releasedPastYear.shuffle();

                    // Tending

                    final _trending = state.trendingMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _trending.shuffle();

                    // Tense dramas
                    final _tenseDramas = state.trendingMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _tenseDramas.shuffle();

                    //South Indian cinema

                    final _southIndianCinema = state.trendingMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _southIndianCinema.shuffle();

                    //  Top 10 Tv shows

                    final _top10TvShows = state.trendingTvList.map((s) {
                      return '$imageAppendUrl${s.posterPath}';
                    }).toList();
                    _top10TvShows.shuffle();

                    print(_top10TvShows.length);

                    return ListView(
                      children: [
                        const BackgroundCard(),
                        MainTitleCard(
                          title: 'Release in the past year',
                          posterList: _releasedPastYear.sublist(0, 10),
                        ),
                        kSizedBox(height: 10),
                        MainTitleCard(
                          title: 'Tending Now',
                          posterList: _trending.sublist(0, 10),
                        ),
                        kSizedBox(height: 10),
                        NumberTitleCard(
                          postersList: _top10TvShows,
                        ),
                        kSizedBox(height: 10),
                        MainTitleCard(
                          title: 'Tense Dramas',
                          posterList: _tenseDramas.sublist(0, 10),
                        ),
                        kSizedBox(height: 10),
                        MainTitleCard(
                          title: 'South Indian Cinema',
                          posterList: _southIndianCinema.sublist(0, 10),
                        ),
                      ],
                    );
                  },
                ),
                (scrollNotifier.value == true
                    ? AnimatedContainer(
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.3),
                        duration: const Duration(milliseconds: 1400),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
                                  width: 60,
                                  height: 60,
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.cast,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                kSizedBox(height: 0, width: 10),
                                Container(
                                  height: 20,
                                  width: 30,
                                  color: Colors.blue,
                                ),
                                kSizedBox(width: 10)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  'Tv Shows',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Movies',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Categories',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : kSizedBox(height: 10, width: 10)),
              ],
            ),
          );
        },
      ),
    );
  }
}
