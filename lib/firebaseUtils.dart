import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventlyapp/model/my_User.dart';

import 'model/event.dart';

class FirebaseUtils {
  // ============================================================
  //todo USER
  // ============================================================

  // TODO: Get Users Collection
  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.nameCollection)
        .withConverter<MyUser>(
          fromFirestore: (snapshot, options) =>
              MyUser.fromJsonFirestore(snapshot.data()!),
          toFirestore: (user, options) => user.toJsonFirestore(),
        );
  }

  // TODO: Add User ===> Write Data
  static Future<void> addUserToFireStore(MyUser myUser) {
    var set = getUserCollection().doc(myUser.id).set(myUser);
    return set;
  }

  // TODO: Get User ===> Read Data
  static Future<MyUser?> readUserToFireStore(String uId) async {
    var userCollection = await getUserCollection().doc(uId).get();
    return userCollection.data();
  }

  // ============================================================
  //todo EVENT
  // ============================================================

  // TODO: Get Events Collection
  static CollectionReference<Event> getEventCollection({required String uId}) {
    return getUserCollection()
        .doc(uId)
        .collection(Event.collectionName)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              Event.formJsonFireStore(snapshot.data()!),
          toFirestore: (event, options) => event.toJsonFireStore(),
        );
  }

  // TODO: Add Event ==> Write Data
  static Future<void> addEventToFireStore(Event event, String uId) {
    var eventCollection = getEventCollection(uId: uId);
    var documentReference = eventCollection.doc();
    var id = documentReference.id;

    event.id = id;

    return documentReference.set(event);
  }

  // TODO: Get Events by Category ==> Read Data
  static Stream<List<Event>> getFilterEvent({
    required int selectedIndex,
    required String uId,
  }) {
    var snapshots = getEventCollection(uId: uId)
        .where("event-Category-Index", isEqualTo: selectedIndex)
        .orderBy("event_date")
        .snapshots();

    return snapshots.map((snapshots) {
      return snapshots.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  // TODO: Get All Events ==> Read Data
  static Stream<List<Event>> getAllEvent({required String uId}) {
    var snapshots = getEventCollection(
      uId: uId,
    ).orderBy("event_date").snapshots();

    return snapshots.map((snapshots) {
      return snapshots.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  // TODO: Update Favorite ==> Update Data
  static Future<void> updateIsFavorite(Event event, String uId) {
    return getEventCollection(
      uId: uId,
    ).doc(event.id).update({"is-favorite": !event.isFavorite});
  }

  // TODO: Get Favorite Events ==> Read Data
  static Stream<List<Event>> getAllFavoriteEvent({required String uId}) {
    return getEventCollection(uId: uId)
        .where("is-favorite", isEqualTo: true)
        .orderBy("event_date")
        .snapshots()
        .map((snapshots) {
          return snapshots.docs.map((doc) {
            return doc.data();
          }).toList();
        });
  }

  // TODO: Delete the event document from Firestore using the user ID and event ID.
  static Future<void> deleteEvent({
    required String uId,
    required String eventId,
  }) {
    // TODO: Get the event document and delete it from Firestore.
    return getEventCollection(uId: uId).doc(eventId).delete();
  }

  // TODO: Update the selected event data in Firestore.
  static Future<void> updateEvent({
    required Event event,
    required String uId,
    required int selectedIndex,

  }) {
    // TODO: Get the event document using the event ID and update the required fields.
    return getEventCollection(uId: uId)
        .doc(event.id)
        .update(
          event.toJsonFireStore(),

        )
        .then((value) {
          selectedIndex == 0
              ? getAllEvent(uId: uId)
              : getFilterEvent(selectedIndex: selectedIndex, uId: uId);
        });
  }
}
