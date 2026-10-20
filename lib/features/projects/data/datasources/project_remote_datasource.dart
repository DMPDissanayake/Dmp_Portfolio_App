import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmpportfolioapp/features/projects/data/models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getProjectData();
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  final FirebaseFirestore firestore;

  ProjectRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<ProjectModel>> getProjectData() async {
    try {
      final snapshot = await firestore.collection('projects').get();

      return snapshot.docs
          .map((doc) => ProjectModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch education data from Firestore: $e");
    }
  }
}
