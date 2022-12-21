import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/page_provider.dart';
import 'package:shamo/services/message_service.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final pageProvider = Provider.of<PageProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_headset.png',
                width: 80,
              ),
              const SizedBox(height: 20),
              Text(
                'Opss no message yet?',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'You have never done a transaction',
                style: subtitleTextStyle,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 44,
                child: TextButton(
                  onPressed: () => pageProvider.currentIndex = 0,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
        stream: MessageService().getMessagesByUserId(authProvider.user.id),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return emptyChat();
            }

            return Expanded(
              child: Container(
                width: double.infinity,
                color: backgroundColor3,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  children: [
                    ChatTile(snapshot.data![snapshot.data!.length - 1]),
                  ],
                ),
              ),
            );
          } else {
            return emptyChat();
          }
        },
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
