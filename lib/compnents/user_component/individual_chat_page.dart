import 'package:day2/model/userModel.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../model/MessageModel.dart';
import 'chat_component/ownMessageCard.dart';
import 'chat_component/replyCard.dart';

class IndividualPage extends StatefulWidget {
  UserModel chatModel;
  UserModel sourceChat;

  IndividualPage(this.chatModel, this.sourceChat);

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  List<MessageModel> messages = [];
  TextEditingController textEditingController = TextEditingController();
  IO.Socket? socket;
  late IO.Socket socket1;
  bool sendButton = false;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newConnect();
  }

  void newConnect() {
     socket = IO.io('http://localhost:3000', <String, dynamic>{
       "transports": ["websocket"],
       "autoConnect": false,
     });
     socket!.connect();
     print(socket?.connected);
    socket!.onConnect((_) {
      print('connect');
      socket!.emit('msg', 'test');
    });
    socket!.on('event', (data) => print(data));
    socket!.onDisconnect((_) => print('disconnect'));
    socket!.on('fromServer', (_) => print(_));
  }

  void connect() async {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    socket1 = IO.io("http://192.168.0.109:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    // socket = IO.io("https://192.168.0.109:5000", <String, dynamic>{
    //   "transports": ["websocket"],
    //   "autoConnect": false,
    // });

    var sss = socket1.connect();
    socket1.emit("signin", widget.sourceChat.id);
    socket1.onConnect((data) {
      print("Connected");
      socket1.on("message", (msg) {
        print("ddd");
        setMessage("destination", msg["message"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket1.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(
        type: type,
        message: message,
        time: DateTime.now().toString().substring(10, 16));

    setState(() {
      messages.add(messageModel);
      print(messages);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 0,
        leadingWidth: 90,
        leading: Row(children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(widget.chatModel.imgUrl),
            backgroundColor: Colors.white12,
          )
        ]),
        backgroundColor: Colors.blue.shade50,
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(6),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatModel.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14),
                  ),
                  Text(
                    widget.chatModel.upiId,
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  )
                ]),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call, color: Colors.black),
          ),
          PopupMenuButton(
              onSelected: (value) {},
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('Start new group'),
                    value: 'View contact',
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Block this person',
                    ),
                    value: 'Media,links and docs',
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Turn off messaging',
                    ),
                    value: 'Search',
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Report user',
                    ),
                    value: 'Mute notifications',
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Refresh',
                    ),
                    value: 'Starred message',
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Gte help',
                    ),
                    value: 'Disappering messages',
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Send feedback',
                    ),
                    value: 'Wallpaper',
                  )
                ];
              },
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.chatModel.imgUrl),
                  backgroundColor: Colors.white12,
                ),
                Text(
                  widget.chatModel.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.verified_user_rounded, color: Colors.green),
                    Text(
                      ' Bank name: ${widget.chatModel.bankName}',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                Text(
                  widget.chatModel.upiId,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  ' Joined ${DateFormat('MMMM yyyy').format(DateTime.parse(widget.chatModel.joinedOn))}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                )
              ],
            )),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, index) {
                  if (index == messages.length) {
                    return Container(
                      height: 70,
                    );
                  }
                  if (messages[index].type == "source") {
                    return OwnMessageCard(
                      msg: messages[index].message,
                      time: messages[index].time,
                    );
                  } else {
                    return ReplyCard(
                      msg: messages[index].message,
                      time: messages[index].time,
                    );
                  }
                },
                itemCount: messages.length + 1,
                shrinkWrap: true,
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                // Add your onPressed logic here
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Pay',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            margin:
                                EdgeInsets.only(left: 2, right: 2, bottom: 8),
                          ),
                          SizedBox(width: 5), // Add spacing between buttons
                          Container(
                            margin:
                                EdgeInsets.only(left: 2, right: 2, bottom: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                // Add your onPressed logic here
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Request',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width - 220,
                                  child: Card(
                                      margin: EdgeInsets.only(
                                          left: 2, right: 2, bottom: 8),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        minLines: 1,
                                        onChanged: (value) {
                                          if (value.length > 0) {
                                            setState(() {
                                              sendButton = true;
                                            });
                                          } else {
                                            setState(() {
                                              sendButton = false;
                                            });
                                          }
                                        },
                                        controller: textEditingController,
                                        decoration: InputDecoration(
                                            hintText: "Message",
                                            border: InputBorder.none,
                                            prefix: IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.emoji_emotions),
                                            ),
                                            suffix: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                    onPressed: () async {
                                                      // textEditingController
                                                      //     .text = await Provider.of<
                                                      //     SearchOperation>(
                                                      //     context,
                                                      //     listen: false)
                                                      //     .getResult(
                                                      //     textEditingController
                                                      //         .text,
                                                      //     "real data only");
                                                    },
                                                    icon: Icon(
                                                      Icons.auto_awesome,
                                                      color: Colors.purple,
                                                    )),
                                                IconButton(
                                                    onPressed: () {
                                                      showModalBottomSheet(
                                                          context: context,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          builder: (builder) =>
                                                              buildAttach());
                                                    },
                                                    icon: Icon(
                                                        Icons.attach_file)),
                                              ],
                                            ),
                                            contentPadding: EdgeInsets.all(5)),
                                      ))),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: CircleAvatar(
                                  child: IconButton(
                                      icon: Icon(
                                        sendButton ? Icons.send : Icons.mic,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        if (sendButton) {
                                          _scrollController.animateTo(
                                              _scrollController
                                                  .position.maxScrollExtent,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.easeOut);
                                          if (sendButton) {
                                            sendMessage(
                                                textEditingController.text,
                                                widget.sourceChat.id,
                                                widget.chatModel.id);
                                            textEditingController.clear();
                                          }
                                        }
                                      }),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildAttach() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconCreation(
                        Icons.insert_drive_file, Colors.indigo, "Document"),
                    SizedBox(
                      width: 40,
                    ),
                    IconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                    SizedBox(
                      width: 40,
                    ),
                    IconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconCreation(Icons.headset, Colors.orange, "Audio"),
                    SizedBox(
                      width: 40,
                    ),
                    IconCreation(Icons.location_pin, Colors.green, "Location"),
                    SizedBox(
                      width: 40,
                    ),
                    IconCreation(
                        Icons.currency_rupee_outlined, Colors.cyan, "Payment"),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconCreation(Icons.person, Colors.blue, "Contacts"),
                    SizedBox(
                      width: 40,
                    ),
                    IconCreation(Icons.poll, Colors.cyan, "Poll"),
                    SizedBox(
                      width: 40,
                    ),
                    IconCreation(Icons.notifications, Colors.red, "Remainder"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget IconCreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(text)
        ],
      ),
    );
  }
}
