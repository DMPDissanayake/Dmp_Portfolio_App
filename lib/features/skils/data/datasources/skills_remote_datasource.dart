import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmpportfolioapp/features/education/data/models/education_model.dart.dart';
import 'package:dmpportfolioapp/features/skils/data/models/experience_model.dart';
import '../models/skil_model.dart';

abstract class SkilsRemoteDataSource {
  Future<List<SkilModel>> getSkilsFromFirestore();
  Future<List<ExperienceModel>> getExperienceFromFirestore();
}

class SkilsRemoteDataSourceImpl implements SkilsRemoteDataSource {
  final FirebaseFirestore firestore;

  SkilsRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<SkilModel>> getSkilsFromFirestore() async {
    try {
      final snapshot = await firestore.collection('skills').get();
      return snapshot.docs
          .map((doc) => SkilModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch skills data: $e");
    }
  }

  @override
  Future<List<ExperienceModel>> getExperienceFromFirestore() async {
    try {
      final snapshot = await firestore.collection('experience').get();
      return snapshot.docs
          .map((doc) => ExperienceModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch experience data: $e");
    }
  }
}
