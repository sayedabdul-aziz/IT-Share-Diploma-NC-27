class OnBoardingModel {
  final String image;
  final String title;
  final String desc;

  OnBoardingModel(
      {required this.image, required this.title, required this.desc});
}

List<OnBoardingModel> model = [
  OnBoardingModel(
      image: 'assets/on1.png',
      title: 'Read Your Book Now',
      desc: 'Read Your Book NowRead Your Book NowRead Your Book Now'),
  OnBoardingModel(
      image: 'assets/on2.png',
      title: 'Explore Your Fav Book',
      desc: 'Read Your Book NowRead Your Book NowRead Your Book Now'),
  OnBoardingModel(
      image: 'assets/on3.png',
      title: 'Add your Book to Cart',
      desc: 'Read Your Book NowRead Your Book NowRead Your Book Now')
];
