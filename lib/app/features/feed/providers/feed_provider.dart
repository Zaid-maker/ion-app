import 'package:ice/app/features/feed/model/post_data.dart';
import 'package:ice/app/features/nostr/constants.dart';
import 'package:ice/app/features/nostr/providers/relays_provider.dart';
import 'package:nostr_dart/nostr_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_provider.g.dart';

@riverpod
class FeedNotifier extends _$FeedNotifier {
  @override
  AsyncValue<List<PostData>> build() {
    return AsyncData<List<PostData>>(List<PostData>.unmodifiable(<PostData>[]));
  }

  Future<void> fetchPosts() async {
    state = const AsyncLoading<List<PostData>>().copyWithPrevious(state);
    final NostrRelay relay =
        await ref.read(relaysProvider.notifier).getOrCreate(mainRelay);
    final RequestMessage requestMessage = RequestMessage()
      ..addFilter(const RequestFilter(kinds: <int>[1], limit: 20));
    final List<EventMessage> events =
        await requestEvents(requestMessage, relay);
    state = AsyncData<List<PostData>>(
      events
          .map(
            (EventMessage event) => PostData(id: event.id, body: event.content),
          )
          .toList(),
    );
  }
}
