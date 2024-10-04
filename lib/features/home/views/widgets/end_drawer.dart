import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/authentication/view_models/auth_view_model.dart';
import 'package:comentito_diary/features/authentication/views/sign_in_screen.dart';
import 'package:comentito_diary/features/user/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EndDrawer extends ConsumerWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userProvider).when(
          data: (data) {
            return Drawer(
              width: MediaQuery.of(context).size.width * 0.5,
              backgroundColor: const Color(
                ThemeColors.mintCream,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20),
                    const Text(
                      "USERNAME",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(
                          ThemeColors.grey_500,
                        ),
                      ),
                    ),
                    Text(
                      data.name,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(
                          ThemeColors.green,
                        ),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: const Color(
                                ThemeColors.white,
                              ),
                              elevation: 0,
                              title: const Text(
                                "COMENTITO DIARY에서 로그아웃하시겠어요?",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              content: const Text(
                                "로그아웃 하더라도 저장된 기록은 삭제되지 않습니다.",
                                style: TextStyle(
                                  color: Color(
                                    ThemeColors.grey_900,
                                  ),
                                ),
                              ),
                              actions: [
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    context.pop();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    child: Text(
                                      "아니오",
                                      style: TextStyle(
                                        color: Color(
                                          ThemeColors.grey_700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    ref.read(authProvider.notifier).signOut();
                                    context.goNamed(SignInScreen.routeName);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    child: Text(
                                      "네",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          "로그아웃",
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                        leading: SizedBox(
                          width: 18,
                          child: SvgPicture.asset(
                            "assets/icons/sign-out.svg",
                            colorFilter: const ColorFilter.mode(
                              Colors.redAccent,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) => Center(
            child: Text("$error"),
          ),
          loading: () => Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: const Color(
                ThemeColors.green,
              ),
              size: 20,
            ),
          ),
        );
    // Drawer(
    //   width: MediaQuery.of(context).size.width * 0.5,
    //   backgroundColor: const Color(
    //     ThemeColors.mintCream,
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(
    //       vertical: 24,
    //       horizontal: 20,
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         const Text(
    //           "사용자이름",
    //           style: TextStyle(
    //             fontSize: 18,
    //             color: Color(
    //               ThemeColors.green,
    //             ),
    //           ),
    //         ),
    //         const Spacer(),
    //         GestureDetector(
    //           onTap: () {
    //             showDialog(
    //               context: context,
    //               builder: (context) {
    //                 return AlertDialog(
    //                   backgroundColor: const Color(
    //                     ThemeColors.white,
    //                   ),
    //                   elevation: 0,
    //                   title: const Text(
    //                     "COMENTITO DIARY에서 로그아웃하시겠어요?",
    //                     style: TextStyle(
    //                       fontSize: 20,
    //                     ),
    //                   ),
    //                   content: const Text(
    //                     "로그아웃 하더라도 저장된 기록은 삭제되지 않습니다.",
    //                     style: TextStyle(
    //                       color: Color(
    //                         ThemeColors.grey_900,
    //                       ),
    //                     ),
    //                   ),
    //                   actions: [
    //                     GestureDetector(
    //                       behavior: HitTestBehavior.translucent,
    //                       onTap: () {
    //                         context.pop();
    //                       },
    //                       child: const Padding(
    //                         padding: EdgeInsets.symmetric(
    //                           horizontal: 8,
    //                           vertical: 4,
    //                         ),
    //                         child: Text(
    //                           "아니오",
    //                           style: TextStyle(
    //                             color: Color(
    //                               ThemeColors.grey_700,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     GestureDetector(
    //                       behavior: HitTestBehavior.translucent,
    //                       onTap: () {
    //                         ref.read(authProvider.notifier).signOut();
    //                         context.goNamed(SignInScreen.routeName);
    //                       },
    //                       child: const Padding(
    //                         padding: EdgeInsets.symmetric(
    //                           horizontal: 8,
    //                           vertical: 4,
    //                         ),
    //                         child: Text(
    //                           "네",
    //                           style: TextStyle(
    //                             color: Colors.redAccent,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 );
    //               },
    //             );
    //           },
    //           child: ListTile(
    //             dense: true,
    //             contentPadding: EdgeInsets.zero,
    //             title: const Text(
    //               "로그아웃",
    //               style: TextStyle(
    //                 color: Colors.redAccent,
    //               ),
    //             ),
    //             leading: SizedBox(
    //               width: 18,
    //               child: SvgPicture.asset(
    //                 "assets/icons/sign-out.svg",
    //                 colorFilter: const ColorFilter.mode(
    //                   Colors.redAccent,
    //                   BlendMode.srcIn,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
