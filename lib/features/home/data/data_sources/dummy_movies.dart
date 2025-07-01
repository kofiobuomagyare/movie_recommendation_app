import 'package:movie_recommendation_app/features/home/domain/entities/movie.dart';

final dummyMovies = [
  Movie(
    id: '1',
    title: 'Doctor Strange in the Multiverse of Madness',
    imagePath: 'assets/images/Movie.png',
     coverImage: 'assets/images/cover_image.png',
    year: 2021,
    durationMinutes: 148,
    genre: 'Action',
    description:
        'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
    rating: 9.5,
    reviews: [
      Review(
        reviewerName: 'Iqbal Shafiq Razaan',
        content:
            'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains...',
        rating: 6.3,
      ),
      Review(
        reviewerName: 'Iqbal Shafiq Razaan',
        content:
            'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains...',
        rating: 6.3,
      ),
    ],
    cast: [
      CastMember(name: 'Tom Holland', imagePath: 'assets/images/tom_holland.png'),
      CastMember(name: 'Zendaya', imagePath: 'assets/images/zendaya.png'),
      CastMember(name: 'Benedict Cumberbatch', imagePath: 'assets/images/benedict.png'),
      CastMember(name: 'Brad Pitt', imagePath: 'assets/images/brad_pitt.png'),
    ],
  ),
    Movie(
      id:'2',
    title: 'Spiderman No Way Home',
    imagePath: 'assets/images/movie-2.png',
     coverImage: 'assets/images/cover_image.png',
    year: 2021,
    durationMinutes: 148,
    genre: 'Action',
    description:
        'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
    rating: 9.5,
    reviews: [
      Review(
        reviewerName: 'Iqbal Shafiq Razaan',
        content:
            'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains...',
        rating: 6.3,
      ),
      Review(
        reviewerName: 'Iqbal Shafiq Razaan',
        content:
            'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains...',
        rating: 6.3,
      ),
    ],
    cast: [
      CastMember(name: 'Tom Holland', imagePath: 'assets/images/tom_holland.png'),
      CastMember(name: 'Zendaya', imagePath: 'assets/images/zendaya.png'),
      CastMember(name: 'Benedict Cumberbatch', imagePath: 'assets/images/benedict.png'),
      CastMember(name: 'Brad Pitt', imagePath: 'assets/images/brad_pitt.png'),
    ],
  ),
];