import 'package:chatui/message_model.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //List of conversation
  List<Message> messages = [
    Message(
        text: "السلام عليكم",
        date: DateTime.now().subtract(
          const Duration(days: 1, minutes: 1),
        ),
        isSendByMe: false),
    Message(
        text: "وعليكم السلام ورحمة الله",
        date: DateTime.now().subtract(
          const Duration(days: 1, minutes: 2),
        ),
        isSendByMe: true),
    Message(
        text: "اخبارك ",
        date: DateTime.now().subtract(
          const Duration(days: 1, minutes: 3),
        ),
        isSendByMe: false),
    Message(
        text: "الحمد لله ",
        date: DateTime.now().subtract(
          const Duration(days: 1, minutes: 4),
        ),
        isSendByMe: true),
    Message(
        text: "بخير ",
        date: DateTime.now().subtract(
          const Duration(days: 1, minutes: 5),
        ),
        isSendByMe: true),
    Message(
        text: "انت كيفك",
        date: DateTime.now().subtract(
          const Duration(days: 1, minutes: 6),
        ),
        isSendByMe: true),
    Message(
        text: "الحمد لله تمام بخير",
        date: DateTime.now().subtract(
          const Duration(days: 1, minutes: 7),
        ),
        isSendByMe: false),
    Message(
        text: "فينك ",
        date: DateTime.now().subtract(
          const Duration(days: 1, minutes: 8),
        ),
        isSendByMe: true),
    Message(
        text: "ف الدنيا ",
        date: DateTime.now().subtract(
          const Duration(days: 1, minutes: 9),
        ),
        isSendByMe: false),
    Message(
        text: "شغال ",
        date: DateTime.now().subtract(
          const Duration(days: 1, minutes: 10),
        ),
        isSendByMe: true),
    Message(
        text: " الحمد لله",
        date: DateTime.now().subtract(
          const Duration(days: 1, minutes: 11),
        ),
        isSendByMe: false),
    Message(
        text: " انت اخبارك",
        date: DateTime.now().subtract(
          const Duration(minutes: 12),
        ),
        isSendByMe: true),
    Message(
        text: " عامل اي",
        date: DateTime.now().subtract(
          const Duration(minutes: 13),
        ),
        isSendByMe: false),
    Message(
        text: "تمام ",
        date: DateTime.now().subtract(
          const Duration(minutes: 14),
        ),
        isSendByMe: true),
  ].reversed.toList();
  //end list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          //لتحريك مربع النص لأسفل
          Expanded(
            child: GroupedListView<Message, DateTime>(
              //عكس الاتجاه
              reverse: true,
              //الترتيب التصاعدي
              order: GroupedListOrder.DESC,
              //Stick header
              useStickyGroupSeparators: true,
              floatingHeader: true,
              padding: const EdgeInsets.all(8),
              //عناصر الليست
              elements: messages,
              //التجميع حسب التاريخ
              groupBy: (message) => DateTime(
                  message.date.year, message.date.month, message.date.day),
              //شريط عنوان الرسائل
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              //الرسائل
              itemBuilder: (context, Message message) => Align(
                alignment: message.isSendByMe
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Text(message.text)),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.grey.shade300,
                child: TextField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'اكتب رسالتك هنا'),
                  onSubmitted: (text) {
                    final message = Message(
                        text: text, date: DateTime.now(), isSendByMe: true);
                    setState(() {
                      messages.add(message);
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
