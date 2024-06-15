import 'package:flutter/material.dart';
import 'package:tick_off/data/firestore.dart';
import 'package:tick_off/model/task_module.dart';
import 'package:tick_off/pages/edit_task_page.dart';

class TaskCard extends StatefulWidget {
  Note _note;
  TaskCard(this._note, {super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isDon = false;
  @override
  void initState() {
    super.initState();
    isDon = widget._note.isDone; // Initialize isDone here
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              //image
              Image(),

              SizedBox(width: 20),

              //title and subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget._note.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Checkbox(
                          value: isDone,
                          onChanged: (value) {
                            setState(() {
                              isDone = !isDone;
                            });
                            Firestore_Datasource()
                                .isdone(widget._note.id, isDone);
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget._note.description,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue.shade400),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Container(
                            width: 90,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    widget._note.time,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Edit_Screen(),
                              ));
                            },
                            child: Container(
                              width: 90,
                              height: 28,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'edit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container Image() {
    return Container(
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        image: DecorationImage(
            image: AssetImage('images/${widget._note.image}.png'),
            fit: BoxFit.cover),
      ),
    );
  }
}
