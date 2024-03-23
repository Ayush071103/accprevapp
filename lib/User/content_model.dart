class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Get Started',
      image: 'assets/introicon.png',
      discription: "Introducing our groundbreaking IoT sensor app, revolutionizing connectivity and data insights. "
          "Seamlessly monitor and manage your environment with real-time data streams, empowering informed decisions. "

  ),
  UnbordingContent(
      title: 'Book Device',
      image: 'assets/purchase.png',
      discription: "Experience the future of smart living with our IoT sensor device, designed for effortless integration and unparalleled performance. "
          "designed for effortless integration and unparalleled performance. "
          "Book now and unlock the potential of connected living."



  ),
  UnbordingContent(
      title: 'Enjoy the ride',
      image: 'assets/car.png',
      discription: "After installing our app, embark on worry-free journeys with real-time monitoring of your car's vital metrics."
          "Receive instant alerts and insights, ensuring a smooth and secure ride every time, "
          "empowering you to focus on the road ahead."



  ),
];