// SPDX-License-Identifier: ice License 1.0

import 'package:flutter_test/flutter_test.dart';
import 'package:ion/app/features/user/model/interests.dart';
import 'package:nostr_dart/nostr_dart.dart';

void main() {
  NostrDart.configure(logLevel: NostrLogLevel.ALL);

  group('Interests Tests', () {
    test('Interests.fromEventMessage should work when all data is there', () {
      final keyStore = KeyStore.generate();

      final testEvent = EventMessage.fromData(
        signer: keyStore,
        kind: 10015,
        tags: const [
          ['t', 'tag'],
          ['a', '111'],
          ['a', '222'],
        ],
        content: '',
      );

      final interest = Interests.fromEventMessage(testEvent);

      expect(interest, isA<Interests>());
      expect(interest.hashtags.length, 1);
      expect(interest.interestSetRefs.length, 2);
      expect(interest.hashtags[0], 'tag');
      expect(interest.interestSetRefs[0], '111');
    });
  });
}
