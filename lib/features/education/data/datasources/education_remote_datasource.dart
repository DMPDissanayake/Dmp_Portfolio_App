import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmpportfolioapp/features/education/data/models/education_model.dart.dart';

abstract class EducationRemoteDataSource {
  Future<List<EducationModel>> getEducationQualifications();
}

class EducationRemoteDataSourceImpl implements EducationRemoteDataSource {
  final FirebaseFirestore firestore;

  EducationRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<EducationModel>> getEducationQualifications() async {
    try {
      final snapshot = await firestore.collection('education').get();

      return snapshot.docs
          .map((doc) => EducationModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch education data from Firestore: $e");
    }
  }
}
