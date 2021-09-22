import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:post_repository/constants/constant.dart';
import 'package:post_repository/post_repository.dart';

class FirestorePostRepository implements PostRepository {
  CollectionReference postCollection =
      FirebaseFirestore.instance.collection(COL_POST);

  @override
  Future<void> addNewPost(Post post) {
    return postCollection.add(post.toDocument());
  }

  @override
  Future<void> deletePost(Post post) {
    return postCollection.doc(post.id).delete();
  }

  @override
  Stream<List<Post>> posts() {
    return postCollection
        .orderBy(FIELD_DATE, descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Post.fromSnapshot(doc)).toList();
    });
  }

  @override
  Future<void> updatePost(Post post) {
    return postCollection.doc(post.id).update(post.toDocument());
  }
}
