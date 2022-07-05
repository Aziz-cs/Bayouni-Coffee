import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_textfield.dart';

class AddNotesTextField extends StatelessWidget {
  const AddNotesTextField({
    Key? key,
    required TextEditingController commentController,
  })  : _commentController = commentController,
        super(key: key);

  final TextEditingController _commentController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            MyTextField(
              controller: _commentController,
              iconData: Icons.comment_outlined,
              hintText: 'addNotes'.tr,
              isPrefixIcon: false,
              validator: (input) {
                if (input!.length > 4000) {
                  return 'Max characters is 4000 ';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
