import 'package:gourmetexpress/app/models/address_model.dart';

abstract class IAddressService {
  Future<void> postAddress(String uid, AddressModel addressModel);
  Stream<AddressModel> getAddressStream(String uid);
  Future<void> putAddress(String uid, AddressModel addressModel);
}
