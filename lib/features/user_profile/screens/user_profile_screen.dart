import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/features/auth/controller/auth_controller.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';

class UserProfileScreen extends ConsumerWidget {
  final String uid;
  const UserProfileScreen({super.key, required this.uid});

  void navigateToEditUser(BuildContext context) {
    Routemaster.of(context).push('/edit-profile/$uid');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(getUserDataProvider(uid)).when(
            data: (user) => NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 200,
                    floating: true,
                    snap: true,
                    flexibleSpace: Stack(
                      children: [
                        Positioned.fill(
                            child: Image.network(
                          user.banner,
                          fit: BoxFit.cover,
                        )),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding:
                                const EdgeInsets.all(20).copyWith(bottom: 55),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(user.profilePic),
                                radius: 45,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: OutlinedButton(
                            onPressed: () => navigateToEditUser(context),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10)),
                            child: const Text('Edit Profile'),
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(15),
                    sliver: SliverList(
                        delegate: SliverChildListDelegate([
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'u/${user.name}',
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('${user.karma} karma'),
                      ),
                      const SizedBox(height: 10),
                      const Divider(thickness: 2),
                    ])),
                  )
                ];
              },
              body: Container(),
            ),
            error: (error, stackTrace) =>
                ErrorText(errorText: error.toString()),
            loading: () => const Loader(),
          ),
    );
  }
}
