import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/common/error_text.dart';
import 'package:reddit_clone/core/common/loader.dart';
import 'package:reddit_clone/core/common/post_card.dart';
import 'package:reddit_clone/features/auth/controller/auth_controller.dart';
import 'package:reddit_clone/features/community/controller/community_controller.dart';
import 'package:reddit_clone/features/post/controller/post_controller.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    final isGuest = !user.isAuthenticated;

    if (!isGuest) {
      return ref.watch(userCommunitiesProvider).when(
            data: (communities) => ref
                .watch(userPostsProvider(communities))
                .when(
                  data: (data) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: kIsWeb ? 20 : 5),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                final post = data[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: PostCard(post: post),
                                );
                              }),
                          const SizedBox(height: kIsWeb ? 50 : 20)
                        ],
                      ),
                    );
                  },
                  error: (error, stackTrace) {
                    if (kDebugMode) {
                      print(error);
                    }
                    return ErrorText(errorText: error.toString());
                  },
                  loading: () => const Loader(),
                ),
            error: (error, stackTrace) =>
                ErrorText(errorText: error.toString()),
            loading: () => const Loader(),
          );
    }

    return ref.watch(userCommunitiesProvider).when(
          data: (communities) => ref.watch(guestPostsProvider).when(
                data: (data) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: kIsWeb ? 20 : 5),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              final post = data[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: PostCard(post: post),
                              );
                            }),
                        const SizedBox(height: kIsWeb ? 50 : 20),
                      ],
                    ),
                  );
                },
                error: (error, stackTrace) {
                  if (kDebugMode) {
                    print(error);
                  }
                  return ErrorText(errorText: error.toString());
                },
                loading: () => const Loader(),
              ),
          error: (error, stackTrace) => ErrorText(errorText: error.toString()),
          loading: () => const Loader(),
        );
  }
}
