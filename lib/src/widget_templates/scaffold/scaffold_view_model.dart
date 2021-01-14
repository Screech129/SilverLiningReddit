import 'package:hooks_riverpod/all.dart';
import 'package:silverliningsreddit/src/models/models.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';

var subredditProvider = FutureProvider<List<Subreddit>>((ref) async {
  var repository = ref.read(repositoryProvider);
  return repository.getSubscribedSubreddits();
});
