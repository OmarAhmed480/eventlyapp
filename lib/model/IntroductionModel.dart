class IntroductionModel{
  final String image;
  final String title;
  final String content;

  IntroductionModel({
    required this.image,
    required this.title,
    required this.content,
  });


  List<IntroductionModel> introductionList  = [
    IntroductionModel(
      image: "assets/images/event1.png",
      title: "Personalize Your Experience",
      content: "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
    ),

    IntroductionModel(
      image: "assets/images/event2.png",
      title: "Find Events That Inspire You",
      content: "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
    ),

    IntroductionModel(
      image: "assets/images/event3.png",
      title: "Effortless Event Planning",
      content: "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
    ),

    IntroductionModel(
      image: "assets/images/event3.png",
      title: "Connect with Friends & Share Moments",
      content: "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
    ),

  ];



}