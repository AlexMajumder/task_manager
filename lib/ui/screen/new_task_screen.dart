import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screen/add_new_task_screen.dart';
import 'package:task_manager/ui/widgets/center_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';
import '../widgets/task_card.dart';
import '../widgets/task_summery_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getNewTaskListInProgress = false;
  List<TaskModel> _newTaskList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getNewTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          _getNewTaskList();
        },
        child: Column(
          children: [
            buildSummerySection(),
            Expanded(
              child: Visibility(
                visible: !_getNewTaskListInProgress,
                replacement: const CenterCircularProgressIndicator(),
                child: ListView.separated(
                  itemCount: _newTaskList.length,
                  itemBuilder: (context, index) {
                    return TaskCard(taskModel: _newTaskList[index],);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 8);
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddFAB,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildSummerySection() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TaskSummeryCard(
              count: 9,
              title: 'New',
            ),
            TaskSummeryCard(
              count: 10,
              title: 'Completed',
            ),
            TaskSummeryCard(
              count: 8,
              title: 'Cancelled',
            ),
            TaskSummeryCard(
              count: 6,
              title: 'Progress',
            ),
          ],
        ),
      ),
    );
  }

  void _onTapAddFAB() async{
    final bool? shouldRefresh = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewTaskScreen(),
      ),
    );
    if(shouldRefresh == true){
      _getNewTaskList();
    }
  }

  Future<void> _getNewTaskList() async {
    _newTaskList.clear();// for avoid Append the list
    _getNewTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.newTaskList,
    );
    if (response.isSuccess) {
      final TaskListModel taskListModel = TaskListModel.fromJson(response.responseData);
      _newTaskList = taskListModel.taskList ?? [];
    } else {
      showSnackBarMessage(context, response.errorMessage,true,);
    }
    _getNewTaskListInProgress = false;
    setState(() {});
  }

}
