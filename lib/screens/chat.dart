import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsdc/utils/keys.dart';

class ChatWithUs extends StatefulWidget {
  const ChatWithUs({super.key});

  @override
  State<ChatWithUs> createState() => _ChatWithUsState();
}

class _ChatWithUsState extends State<ChatWithUs> {
  final List<Message> _messages = [];

  final TextEditingController _textEditingController = TextEditingController();

  void onSendMessage() async {
    Message message = Message(text: _textEditingController.text, isMe: true);

    _textEditingController.clear();

    setState(() {
      _messages.insert(0, message);
    });

    String response = await sendMessageToChatGpt(message.text);

    Message chatGpt = Message(text: response, isMe: false);

    setState(() {
      _messages.insert(0, chatGpt);
    });
  }

  Future<String> sendMessageToChatGpt(String message) async {
    Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");

    Map<String, dynamic> body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": message}
      ],
      "max_tokens": 500,
    };

    final response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${APIKey.apiKey}",
      },
      body: json.encode(body),
    );

    print(response.body);

    Map<String, dynamic> parsedReponse = json.decode(response.body);

    String reply = parsedReponse['choices'][0]['message']['content'];

    return reply;
    // return "hii";
  }

  Widget _buildMessage(Message message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment:
              message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message.isMe ? 'You' : 'GPT',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(message.text),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    try {
                      onSendMessage();
                    } catch (e) {
                      print('Error sending the message');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}
