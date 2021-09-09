import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'follows_record.g.dart';

abstract class FollowsRecord
    implements Built<FollowsRecord, FollowsRecordBuilder> {
  static Serializer<FollowsRecord> get serializer => _$followsRecordSerializer;

  @nullable
  DocumentReference get follower;

  @nullable
  DocumentReference get following;

  @nullable
  @BuiltValueField(wireName: 'follower_profile_pic')
  String get followerProfilePic;

  @nullable
  @BuiltValueField(wireName: 'following_profile_pic')
  String get followingProfilePic;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(FollowsRecordBuilder builder) => builder
    ..followerProfilePic = ''
    ..followingProfilePic = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('follows');

  static Stream<FollowsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  FollowsRecord._();
  factory FollowsRecord([void Function(FollowsRecordBuilder) updates]) =
      _$FollowsRecord;

  static FollowsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createFollowsRecordData({
  DocumentReference follower,
  DocumentReference following,
  String followerProfilePic,
  String followingProfilePic,
}) =>
    serializers.toFirestore(
        FollowsRecord.serializer,
        FollowsRecord((f) => f
          ..follower = follower
          ..following = following
          ..followerProfilePic = followerProfilePic
          ..followingProfilePic = followingProfilePic));
