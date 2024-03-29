import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  final String? id;
  final String road;
  final String residenceNumber;
  final String district;

  AddressModel({
    this.id,
    required this.road,
    required this.residenceNumber,
    required this.district,
  });

  factory AddressModel.fromSnapshot(DocumentSnapshot snapshot) {
    return AddressModel(
      id: snapshot.id,
      road: snapshot['road'],
      residenceNumber: snapshot['residenceNumber'],
      district: snapshot['district'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'road': road,
      'residenceNumber': residenceNumber,
      'district': district,
    };
  }
}
