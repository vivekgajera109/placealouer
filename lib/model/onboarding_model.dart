class SliderModel {
  String? image;
  String? title;
  String? subTitle;

// images given
  SliderModel({this.image});

// setter for image
  void setImage(String getImage) {
    image = getImage;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setSubTitle(String getSubTitle) {
    subTitle = getSubTitle;
  }

// getter for image
  String? getImage() {
    return image;
  }

// getter for title
  String? getTitle() {
    return title;
  }

// getter for image
  String? getSubTitle() {
    return subTitle;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = SliderModel();

// 1
  sliderModel.setImage("assets/png/onboarding1.png");
  sliderModel.setTitle("Comment ça fonctionne?");
  sliderModel.setSubTitle(
      "Place À Louer est une application facile d’utilisation qui simplifie la recherche de place et/ou de garage pour votre voiture.");
  slides.add(sliderModel);

  sliderModel = SliderModel();

// 2
  sliderModel.setImage("assets/png/onboarding2.png");
  sliderModel.setTitle("Vous cherchez une place ?");
  sliderModel.setSubTitle(
      "Place À Louer vous propose une large sélection de place et de garage à proximité de votre position, réservable à tout moment");
  slides.add(sliderModel);

  sliderModel = SliderModel();

// 3
  sliderModel.setImage("assets/png/onboarding3.png");
  sliderModel.setTitle("Vous possédez une place ?");
  sliderModel.setSubTitle(
      "Vous pouvez mettre une annonce en ligne en quelques min utes et commencer à rentabiliser votre garage");
  slides.add(sliderModel);

  sliderModel = SliderModel();
  return slides;
}
