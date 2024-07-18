
import 'package:dating/models/messgae_model/message_model.dart';
import 'package:dating/utils/alignment/widget_alignment.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../utils/colors/app_colors.dart';

class ClientMessageBubble extends StatelessWidget {
  final MessagesModel messagesModel;

  const ClientMessageBubble({
    super.key,
    required this.messagesModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.heavyImpact();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: context.width * 0.7,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: CColors.primaryColor.withOpacity(0.20),
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(0),topLeft: Radius.circular(15),topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                  ),
                  child: messagesModel.messageType == "isVoice"
                      ? const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // SvgPicture.asset(
                            //   Assets.iconsSpeakerIcon,
                            //   height: 10,
                            // ),
                            // 5.pw,
                            // Text(
                            //   messagesModel.messages,
                            //   style: CustomTextStyles.darkGreyColor410,
                            // ),
                          ],
                        )
                      : messagesModel.messageType == "isImage"
                          ? Image.asset(
                              messagesModel.messages,
                              height: 100,
                            )
                          : Text(
                              messagesModel.messages,
                              style: CustomTextStyles.black414,
                            ),
                ),
              ),
            ],
          ),
          5.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("3:12 PM",style: CustomTextStyles.black412,),
            ],)
        ],
      ),
    );
  }
}

class UserMessageBubble extends StatelessWidget {
  final MessagesModel messagesModel;

  const UserMessageBubble({
    super.key,
    required this.messagesModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            HapticFeedback.heavyImpact();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: context.width * 0.7,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF3B65B).withOpacity(0.20),
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),topLeft: Radius.circular(15),topRight: Radius.circular(15),bottomRight: Radius.circular(0)),
                  ),
                  child: messagesModel.messageType == "isVoice"
                      ? const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // SvgPicture.asset(
                            //   Assets.iconsSpeakerIcon,
                            //   height: 10,
                            // ),
                            // 5.pw,
                            // Text(
                            //   messagesModel.messages,
                            //   style: CustomTextStyles.white414,
                            // ),
                          ],
                        )
                      : messagesModel.messageType == "isImage"
                          ? Image.asset(
                              messagesModel.messages,
                              height: 100,
                            )
                          : Text(
                              messagesModel.messages,
                              style: CustomTextStyles.black414,
                            ),
                ),
              ),
              10.pw,
            ],
          ).alignWidget(
            alignment: Alignment.centerRight,
          ),
        ),
        5.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Text("3:12 PM",style: CustomTextStyles.black412,),
          5.pw,
          SvgPicture.asset(Assets.iconsSeenAll,height: 16,),  10.pw,

        ],)
      ],
    );
  }
}
