import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/home/models/comentito_model.dart';
import 'package:comentito_diary/features/home/view_models/fetch_comentito_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DeleteBottomsheet extends ConsumerWidget {
  const DeleteBottomsheet({
    super.key,
    required this.comentito,
  });

  final ComentitoModel comentito;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/icons/trash-xmark.svg",
            width: 36,
          ),
          const Gap(20),
          const Text(
            "이 기록을 삭제할까요?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(8),
          const Text(
            "삭제한 기록은 복구할 수 없습니다.",
            style: TextStyle(
              color: Color(
                ThemeColors.grey_700,
              ),
            ),
          ),
          const Gap(36),
          GestureDetector(
            onTap: () async {
              await ref
                  .read(fetchComentitoProvider.notifier)
                  .deleteComentito(id: comentito.id);
              context.pop();
              context.pop(comentito);
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(
                  ThemeColors.green,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "네 삭제할게요",
                style: TextStyle(
                  color: Color(
                    ThemeColors.white,
                  ),
                ),
              ),
            ),
          ),
          const Gap(6),
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "아니요",
                style: TextStyle(
                  color: Color(
                    ThemeColors.green,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
