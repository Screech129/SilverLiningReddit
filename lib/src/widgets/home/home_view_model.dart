import 'package:hooks_riverpod/all.dart';
import 'package:silverliningsreddit/src/models/models.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';

final postProvider = FutureProvider<List<Post>>((ref) async {
  final repository = ref.read(repositoryProvider);
  return repository.getFrontPage();
});
