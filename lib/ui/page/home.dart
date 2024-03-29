import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokidoki_mobile/domain/errors/error.dart';
import 'package:tokidoki_mobile/ui/component/snackBar/error_snackbar.dart';
import 'package:tokidoki_mobile/ui/page/task_list.dart';
import 'package:tokidoki_mobile/usecase/state/error.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ErrorType>(errorNotifierProvider, (previous, next) {
      if (next != ErrorType.none) {
        showErrorSnackbar(ref, next.message);
      }
    });

    return const TaskListPage();
  }
}
