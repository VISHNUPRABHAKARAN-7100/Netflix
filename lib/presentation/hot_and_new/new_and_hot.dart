import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/hot_and_new/widget/everyones_watching_widget.dart';
import '../../core/constants/constants.dart';
import 'widget/coming_soon_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
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
                width: 40,
                color: Colors.blue,
              ),
              kSizedBox(height: 0, width: 10),
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: kBlackColor,
              unselectedLabelColor: kWhiteColor,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                color: kWhiteColor,
                borderRadius: kBorderRadius(radius: 30),
              ),
              tabs: const [
                Tab(
                  text: '🍿 Coming Soon',
                ),
                Tab(
                  text: '👀 Eweryone\'s watching',
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            ComingSoonList(key: Key('coming sonn')),
            EveryoneIsWachingList(key: Key('Everyone is Watching'))
          ],
        ),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(onRefresh: ()async {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
                child: Text('Error while loading coming soon list'));
          } else if (state.comingSoonList.isEmpty) {
            return const Center(child: Text('Coming soon list is empty'));
          } else {
            return ListView.builder(
               padding: const EdgeInsets.only(top: 15),
              itemCount: state.comingSoonList.length,
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
    
                String month = '';
                String date = '';
    
                try {
                  final _date = DateTime.parse(movie.releaseDate!);
                  final formatedDate = DateFormat.yMMMMd('en_US').format(_date);
                  month =
                      formatedDate.split(' ').first.substring(0, 3).toUpperCase();
                  date = movie.releaseDate!.split('-')[1];
                } catch (_) {}
    
                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: month,
                  day: date,
                  posterPath: '$imageAppendUrl${movie.posterPath}',
                  movieName: movie.originalTitle ?? 'No Title',
                  description: movie.overview ?? 'No Description',
                );
              },
            );
          }
        },
      ),
    );
  }
}

class EveryoneIsWachingList extends StatelessWidget {
  const EveryoneIsWachingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryoneIsWatching());
    });
    return RefreshIndicator(onRefresh: ()async {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryoneIsWatching());
    },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
                child: Text('Error while loading coming soon list'));
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(child: Text('Coming soon list is empty'));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: state.everyOneIsWatchingList.length,
              itemBuilder: (context, index) {
                final movie = state.everyOneIsWatchingList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
    
                final tv = state.everyOneIsWatchingList[index];
    
                return EveryonesWatchingWidget(
                  posterPath: '$imageAppendUrl${tv.posterPath}',
                  movieName: tv.originalName ?? 'No Name Provided',
                  description: tv.overview ?? 'No Description',
                );
              },
            );
          }
        },
      ),
    );
  }
}
