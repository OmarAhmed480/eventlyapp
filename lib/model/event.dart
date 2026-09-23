import 'package:cloud_firestore/cloud_firestore.dart';

class Event {

  // TODO: Collection Name
  static const String collectionName = "Events";


  // TODO: Variables
  String id;
  int eventCategoryIndex;
  String eventImage;
  String eventTitle;
  String eventDescription;
  DateTime eventDate;
  String eventName;
  bool isFavorite;


  // TODO: Constructor
  Event({
    required this.eventDate,
    required this.eventImage,
    required this.eventName,
    required this.eventDescription,
    required this.eventTitle,
     this.eventCategoryIndex=0,
    this.id = "",
    this.isFavorite = false,
  });


  static List<Event>eventList=[];

  // TODO: JSON to Object
  Event.formJsonFireStore(Map<String, dynamic> data)
      : this(
    id: data["id"],
    eventCategoryIndex: data["event-Category-Index"],
    eventName: data["event-name"],
    eventImage: data["event_image"],
    eventTitle: data["event_title"],
    eventDescription: data["event_description"],
    eventDate: (data["event_date"] as Timestamp).toDate(),
    isFavorite: data["is-favorite"] ?? false,
  );


  // TODO: Object to JSON
  Map<String, dynamic> toJsonFireStore() {
    return {
      "id": id,
      "event-Category-Index": eventCategoryIndex,
      "event-name": eventName,
      "event_image": eventImage,
      "event_title": eventTitle,
      "event_description": eventDescription,
      "event_date": eventDate,
      "is-favorite": isFavorite,
    };
  }
}