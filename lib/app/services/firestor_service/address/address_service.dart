import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gourmetexpress/app/models/address_model.dart';
import 'package:gourmetexpress/app/services/firestor_service/address/i_address_service.dart';

class AddressService implements IAddressService {
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('Users');

  @override
  Future<void> postAddress(String uid, AddressModel addressModel) async {
    notesCollection.doc(uid).collection('address').add(addressModel.toMap());
  }

  @override
  Stream<AddressModel> getAddressStream(String uid) {
    return notesCollection
        .doc(uid)
        .collection('address')
        .snapshots()
        .map((snapshot) {
      return AddressModel.fromSnapshot(snapshot.docs.first);
    });
  }

  @override
  Future<void> putAddress(String uid, AddressModel updatedAddress) async {
    await notesCollection
        .doc(uid)
        .collection('address')
        .doc(updatedAddress.id)
        .update(
          updatedAddress.toMap(),
        );
  }
}
