import 'package:borading_week2/bloc/task_bloc/task_bloc.dart';
import 'package:borading_week2/bloc/task_bloc/task_event.dart';
import 'package:borading_week2/core/constants/appicons.dart';
import 'package:borading_week2/core/widgets/custom_textfield/rectangle_textfield.dart';
import 'package:borading_week2/models/task.dart';
import 'package:borading_week2/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class TaskBottomSheet extends StatefulWidget {
  final TaskService? taskService;
  final TaskModel? taskModel;

  const TaskBottomSheet({super.key, this.taskModel, this.taskService});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    // Pre-fill fields if editing
    if (widget.taskModel != null) {
      _titleController.text = widget.taskModel!.title;
      _descriptionController.text = widget.taskModel!.description;
      _selectedDate = widget.taskModel!.dueDate.toDate();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.taskModel != null;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isEdit ? "Edit Task" : "Add Task",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // 🔹 Title field
            RectangleTextfield(
              height: 45,
              width: 325,
              hinttext: "Enter Title",
              controller: _titleController,
            ),
            const SizedBox(height: 12),

            // 🔹 Description field
            RectangleTextfield(
              height: 45,
              width: 325,
              hinttext: "Enter Description",
              controller: _descriptionController,
            ),
            const SizedBox(height: 12),

            // 🔹 Due Date picker
            InkWell(
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );
                if (pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate != null
                          ? DateFormat('dd MMM yyyy').format(_selectedDate!)
                          : "Select Due Date",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const Icon(Icons.calendar_today, color: Colors.white70),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 🔹 Send button
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  final title = _titleController.text.trim();
                  final description = _descriptionController.text.trim();

                  if (title.isNotEmpty &&
                      description.isNotEmpty &&
                      _selectedDate != null) {
                    if (isEdit) {
                      context.read<TaskBloc>().add(
                        UpdateTask(
                          widget.taskModel!.id,
                          title,
                          description,
                          _selectedDate!,
                          widget.taskModel!.isCompleted,
                        ),
                      );
                    } else {
                      context.read<TaskBloc>().add(
                        AddTask(title, description, _selectedDate!),
                      );
                    }

                    Navigator.pop(context);
                  }
                },
                child: SvgPicture.asset(Appicons.senticonpng),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
