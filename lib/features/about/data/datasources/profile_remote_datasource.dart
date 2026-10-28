import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmpportfolioapp/features/about/data/models/profile_models.dart';

abstract class ProfileRemoteDataSource {
  Future<List<ProfileModel>> getProfileQualifications();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseFirestore firestore;

  ProfileRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<ProfileModel>> getProfileQualifications() async {
    try {
      final snapshot = await firestore.collection('profile').get();

      return snapshot.docs
          .map((doc) => ProfileModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch education data from Firestore: $e");
    }
  }
}
