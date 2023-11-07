// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminModel _$UserModelFromJson(Map<String, dynamic> json) {
  return AdminModel()
    ..uid = json['doc_id'] as String?
    ..name = json['name'] as String?
    ..email = json['email'] as String?
    ..phoneNumber = json['phone_number'] as String?
    ..profileUrl = json['profile_url'] as String?;
}

Map<String, dynamic> _$UserModelToJson(AdminModel instance) => <String, dynamic>{
  'doc_id': instance.uid,
  'name': instance.name,
  'email': instance.email,
  'phone_number': instance.phoneNumber,
  'profile_url': instance.profileUrl,
};
