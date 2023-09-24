import 'package:get/get.dart';
import 'package:to_do_zen/src/features/authentication/models/user_model.dart';
import 'package:to_do_zen/src/features/core/controllers/profile_controller.dart';
import 'package:to_do_zen/src/features/tasks/controllers/task_list_controller.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final _profileController = Get.put(ProfileController());
  final _taskListController = Get.put(TaskListController());

  final RxString fullName = ''.obs;
  final RxString email = ''.obs;
  final RxBool isLoading = true.obs;
  final RxBool hasTasks = false.obs;

  void initUser() async {
    UserModel? data = await _profileController.currentUserData();
    String? uid = _profileController.currentUid();
    int? taskCount = await _taskListController.getTasksCountByUser(uid!);
    print("task count $taskCount");

    fullName.value = "${data!.firstName} ${data.lastName}";
    email.value = data.email;

    if (taskCount != null && taskCount > 0) {
      hasTasks.value = true;
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    initUser();
  }
}
