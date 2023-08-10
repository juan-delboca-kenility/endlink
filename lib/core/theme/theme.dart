import 'package:enterprise_endlink/core/theme/camera.dart';
import 'package:enterprise_endlink/core/theme/index.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'button/app_bar_icon_button.dart';
import 'button/border.dart';
import 'button/fab.dart';
import 'button/gradient.dart';
import 'button/index.dart';
import 'button/list_tile_button.dart';
import 'card.dart';
import 'chat_bubble.dart';
import 'dialog.dart';
import 'list_tile.dart';

class CustomTheme extends Equatable {
  factory CustomTheme.of(BuildContext context) {
    return Theme.of(context).extension<CustomThemeExtension>()!.theme;
  }

  Color contrast(Color color) {
    if (color.opacity == 0.0 || color == Colors.transparent) return contrast(background);
    return color.computeLuminance() < 0.5 ? Colors.white.withOpacity(0.9) : Colors.black.withOpacity(0.9);
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  LinearGradient get gradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF739FDD),
          Color(0xFF4C82D3),
        ],
      );

  LinearGradient get deleteGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.red.shade400,
          Colors.red.shade700,
        ],
      );

  // App Bar
  final CustomAppBarTheme appBar;
  final CustomAppBarTheme appBarReverse;

  // Shimmer
  final Color shimmerBaseColor;
  final Color shimmerBackgroundColor;

  // List
  final CustomListTileTheme listTile;

  // Dialog
  final CustomDialogTheme dialog;

  // Card
  final CustomCardTheme card;

  // Button
  final CustomButtonTheme borderButton;
  final CustomButtonTheme gradientButton;
  final CustomButtonTheme gradientButtonSmall;
  final CustomButtonTheme appBarIconButton;
  final CustomButtonTheme appBarIconButtonReverse;
  final CustomButtonTheme fabButton;
  final CustomButtonTheme fabButtonSmall;
  final CustomButtonTheme listTileButton;
  final CustomButtonTheme listTileButtonSmall;

  // Chat
  final CustomChatBubbleTheme chatBubbleIncoming;
  final CustomChatBubbleTheme chatBubbleOutgoning;

  // Camera
  final CustomCameraTheme camera;

  final Color background;
  final Color accent;
  final Color splashBackground;
  final Color textFieldBorder;
  final Color textFieldFocusedBorder;
  final Color divider;
  final Color statusActive;
  final Color statusNew;
  final Color statusNewText;
  final Color statusSent;
  final Color statusSentText;
  final Color statusPending;
  final Color statusCancel;
  final Color statusCancelText;
  final Color statusComplete;
  final Color statusCompleteText;
  final Color delete;
  final Color messageBubbleMe;
  final Color messageBubbleOther;
  final Color chatBackground;
  final Color callBackground;
  final Color callButton;
  final Color callParticipant;
  final Color checklistRed;
  final Color checklistGreen;
  final Color checklistYellow;
  final Color checklistGrey;
  final Color cameraButtonBorder;
  final Color cameraButtonFill;
  final Color cameraPanelBackground;
  final Color cameraCaptureButtonVideo;
  final Color cameraCaptureButtonPicture;
  final Color cameraCaptureButtonBorder;
  final Color ripple;
  final Color navigationBar;
  final Color tabBar;

  Color get backgroundContrast => contrast(background);

  const CustomTheme({
    required this.chatBubbleIncoming,
    required this.chatBubbleOutgoning,
    required this.appBar,
    required this.appBarReverse,
    required this.shimmerBaseColor,
    required this.shimmerBackgroundColor,
    required this.listTile,
    required this.dialog,
    required this.card,
    required this.background,
    required this.borderButton,
    required this.gradientButton,
    required this.gradientButtonSmall,
    required this.appBarIconButton,
    required this.appBarIconButtonReverse,
    required this.fabButton,
    required this.fabButtonSmall,
    required this.listTileButton,
    required this.listTileButtonSmall,
    required this.accent,
    required this.splashBackground,
    required this.textFieldBorder,
    required this.textFieldFocusedBorder,
    required this.divider,
    required this.statusActive,
    required this.statusNew,
    required this.statusNewText,
    required this.statusSent,
    required this.statusSentText,
    required this.statusPending,
    required this.statusCancel,
    required this.statusCancelText,
    required this.statusComplete,
    required this.statusCompleteText,
    required this.delete,
    required this.messageBubbleMe,
    required this.messageBubbleOther,
    required this.chatBackground,
    required this.callBackground,
    required this.callButton,
    required this.callParticipant,
    required this.checklistRed,
    required this.checklistGreen,
    required this.checklistYellow,
    required this.checklistGrey,
    required this.cameraButtonBorder,
    required this.cameraButtonFill,
    required this.cameraPanelBackground,
    required this.cameraCaptureButtonVideo,
    required this.cameraCaptureButtonPicture,
    required this.cameraCaptureButtonBorder,
    required this.ripple,
    required this.navigationBar,
    required this.tabBar,
    required this.camera,
  });

  CustomTheme lerp(CustomTheme? other, double t) {
    if (other == null) return this;

    return CustomTheme(
      chatBubbleIncoming: CustomChatBubbleTheme.lerpObject(chatBubbleIncoming, other.chatBubbleIncoming, t),
      chatBubbleOutgoning: CustomChatBubbleTheme.lerpObject(chatBubbleOutgoning, other.chatBubbleOutgoning, t),
      appBar: CustomAppBarTheme.lerp(appBar, other.appBar, t),
      appBarReverse: CustomAppBarTheme.lerp(appBarReverse, other.appBarReverse, t),
      shimmerBaseColor: Color.lerp(shimmerBaseColor, other.shimmerBaseColor, t)!,
      shimmerBackgroundColor: Color.lerp(shimmerBackgroundColor, other.shimmerBackgroundColor, t)!,
      listTile: CustomListTileTheme.lerp(listTile, other.listTile, t),
      dialog: CustomDialogTheme.lerp(dialog, other.dialog, t),
      card: CustomCardTheme.lerp(card, other.card, t),
      borderButton: other.borderButton,
      gradientButton: other.gradientButton,
      gradientButtonSmall: other.gradientButtonSmall,
      appBarIconButton: other.appBarIconButton,
      appBarIconButtonReverse: other.appBarIconButtonReverse,
      fabButton: other.fabButton,
      fabButtonSmall: other.fabButtonSmall,
      accent: Color.lerp(accent, other.accent, t)!,
      background: Color.lerp(background, other.background, t)!,
      callBackground: Color.lerp(callBackground, other.callBackground, t)!,
      callButton: Color.lerp(callButton, other.callButton, t)!,
      callParticipant: Color.lerp(callParticipant, other.callParticipant, t)!,
      cameraButtonBorder: Color.lerp(cameraButtonBorder, other.cameraButtonBorder, t)!,
      cameraButtonFill: Color.lerp(cameraButtonFill, other.cameraButtonFill, t)!,
      cameraCaptureButtonBorder: Color.lerp(cameraCaptureButtonBorder, other.cameraCaptureButtonBorder, t)!,
      cameraCaptureButtonPicture: Color.lerp(cameraCaptureButtonPicture, other.cameraCaptureButtonPicture, t)!,
      cameraCaptureButtonVideo: Color.lerp(cameraCaptureButtonVideo, other.cameraCaptureButtonVideo, t)!,
      cameraPanelBackground: Color.lerp(cameraPanelBackground, other.cameraPanelBackground, t)!,
      chatBackground: Color.lerp(chatBackground, other.chatBackground, t)!,
      checklistGreen: Color.lerp(checklistGreen, other.checklistGreen, t)!,
      checklistGrey: Color.lerp(checklistGrey, other.checklistGrey, t)!,
      checklistRed: Color.lerp(checklistRed, other.checklistRed, t)!,
      checklistYellow: Color.lerp(checklistYellow, other.checklistYellow, t)!,
      delete: Color.lerp(delete, other.delete, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      messageBubbleMe: Color.lerp(messageBubbleMe, other.messageBubbleMe, t)!,
      messageBubbleOther: Color.lerp(messageBubbleOther, other.messageBubbleOther, t)!,
      ripple: Color.lerp(ripple, other.ripple, t)!,
      statusActive: Color.lerp(statusActive, other.statusActive, t)!,
      statusCancel: Color.lerp(statusCancel, other.statusCancel, t)!,
      statusCancelText: Color.lerp(statusCancelText, other.statusCancelText, t)!,
      statusComplete: Color.lerp(statusComplete, other.statusComplete, t)!,
      statusCompleteText: Color.lerp(statusCompleteText, other.statusCompleteText, t)!,
      statusNew: Color.lerp(statusNew, other.statusNew, t)!,
      statusNewText: Color.lerp(statusNewText, other.statusNewText, t)!,
      statusPending: Color.lerp(statusPending, other.statusPending, t)!,
      statusSent: Color.lerp(statusSent, other.statusSent, t)!,
      statusSentText: Color.lerp(statusSentText, other.statusSentText, t)!,
      textFieldBorder: Color.lerp(textFieldBorder, other.textFieldBorder, t)!,
      textFieldFocusedBorder: Color.lerp(textFieldFocusedBorder, other.textFieldFocusedBorder, t)!,
      navigationBar: Color.lerp(navigationBar, other.navigationBar, t)!,
      tabBar: Color.lerp(tabBar, other.tabBar, t)!,
      splashBackground: Color.lerp(splashBackground, other.splashBackground, t)!,
      listTileButton: other.listTileButton,
      listTileButtonSmall: other.listTileButtonSmall,
      camera: CustomCameraTheme.lerp(camera, other.camera, t),
    );
  }

  static Color get accentColorLight => const Color(0xFF3684D9);

  static Color get accentColorDark => const Color(0xFF3684D9);

  static Color get dividerDark => Colors.grey.shade800;

  static Color get dividerLight => Colors.grey.shade200;

  static Color get pressedColorLight => Colors.grey.shade100;

  static Color get pressedColorDark => Colors.grey.shade900;

  factory CustomTheme.light() => CustomTheme(
        appBar: CustomAppBarTheme.light(),
        appBarReverse: CustomAppBarTheme.lightReverse(),
        shimmerBaseColor: Colors.grey.shade100,
        shimmerBackgroundColor: Colors.white,
        listTile: CustomListTileTheme.light(),
        background: Colors.white,
        dialog: CustomDialogTheme.light(),
        card: CustomCardTheme.light(),
        borderButton: CustomBorderButtonTheme.light(),
        gradientButton: CustomGradientButtonTheme.light(),
        gradientButtonSmall: CustomGradientButtonTheme.lightSmall(),
        appBarIconButton: CustomAppBarIconButtonTheme.light(),
        appBarIconButtonReverse: CustomAppBarIconButtonTheme.lightReverse(),
        fabButton: CustomFabButtonTheme.light(),
        fabButtonSmall: CustomFabButtonTheme.lightSmall(),
        accent: accentColorLight,
        chatBubbleIncoming: CustomChatBubbleTheme.lightIncoming(),
        chatBubbleOutgoning: CustomChatBubbleTheme.lightOutgoing(),
        splashBackground: accentColorLight,
        textFieldBorder: const Color(0xFFAEB7C3),
        textFieldFocusedBorder: accentColorLight,
        divider: dividerLight,
        statusActive: const Color(0xFF16DE98),
        statusNew: const Color(0xFFDBEDDB),
        statusNewText: const Color(0xFF1C3829),
        statusSent: const Color(0xFFEBF1F7),
        statusSentText: const Color(0xFF2E445E),
        statusPending: const Color(0xFFE9C91D),
        statusCancel: const Color(0xFFFFE2DD),
        statusCancelText: const Color(0xFF5D1715),
        statusComplete: const Color(0xFFFDECC8),
        statusCompleteText: const Color(0xFF402C1B),
        delete: const Color(0xFFF33060),
        messageBubbleMe: const Color(0xFFC6DCF5),
        messageBubbleOther: Colors.white,
        chatBackground: const Color(0xFFEBF1F7),
        navigationBar: Colors.white,
        callBackground: const Color(0xFF2E445E),
        callButton: const Color(0x1118254D),
        callParticipant: const Color(0xFF6D7E91),
        checklistRed: const Color(0xFFDF4463),
        checklistGreen: const Color(0xFF67DB9D),
        checklistYellow: const Color(0xFFE9C91D),
        checklistGrey: const Color(0xFF6D7E91),
        cameraButtonBorder: Colors.white.withOpacity(0.4),
        cameraButtonFill: Colors.black.withOpacity(0.4),
        cameraPanelBackground: Colors.black.withOpacity(0.6),
        cameraCaptureButtonVideo: Colors.red,
        cameraCaptureButtonPicture: Colors.white,
        cameraCaptureButtonBorder: Colors.white,
        ripple: Colors.black.withOpacity(0.1),
        tabBar: Colors.white,
        listTileButton: CustomListTileButtonTheme.light(),
        listTileButtonSmall: CustomListTileButtonTheme.lightSmall(),
        camera: CustomCameraTheme.normal(),
      );

  factory CustomTheme.dark() => CustomTheme(
        appBar: CustomAppBarTheme.dark(),
        appBarReverse: CustomAppBarTheme.darkReverse(),
        shimmerBaseColor: Colors.grey.shade900,
        shimmerBackgroundColor: Colors.black,
        listTile: CustomListTileTheme.dark(),
        dialog: CustomDialogTheme.dark(),
        card: CustomCardTheme.dark(),
        borderButton: CustomBorderButtonTheme.dark(),
        gradientButton: CustomGradientButtonTheme.dark(),
        gradientButtonSmall: CustomGradientButtonTheme.darkSmall(),
        appBarIconButton: CustomAppBarIconButtonTheme.dark(),
        appBarIconButtonReverse: CustomAppBarIconButtonTheme.darkReverse(),
        fabButton: CustomFabButtonTheme.dark(),
        fabButtonSmall: CustomFabButtonTheme.darkSmall(),
        background: Colors.black,
        splashBackground: accentColorLight,
        accent: accentColorDark,
        chatBubbleIncoming: CustomChatBubbleTheme.darkIncoming(),
        chatBubbleOutgoning: CustomChatBubbleTheme.darkOutgoing(),
        textFieldBorder: const Color.fromRGBO(68, 68, 68, 1),
        textFieldFocusedBorder: accentColorDark,
        divider: dividerDark,
        statusActive: const Color(0xFF16DE98),
        statusNew: const Color(0xFFDBEDDB),
        statusNewText: const Color(0xFF1C3829),
        statusSent: const Color(0xFFEBF1F7),
        statusSentText: const Color(0xFF2E445E),
        statusPending: const Color(0xFFE9C91D),
        statusCancel: const Color(0xFFFFE2DD),
        statusCancelText: const Color(0xFF5D1715),
        statusComplete: const Color(0xFFFDECC8),
        statusCompleteText: const Color(0xFF402C1B),
        delete: const Color(0xFFF33060),
        messageBubbleMe: const Color(0xFFC6DCF5),
        messageBubbleOther: Colors.white,
        chatBackground: const Color.fromRGBO(24, 32, 40, 1),
        callBackground: const Color(0xFF2E445E),
        callButton: const Color(0x1118254D),
        callParticipant: const Color(0xFF6D7E91),
        checklistRed: const Color(0xFFDF4463),
        checklistGreen: const Color(0xFF67DB9D),
        checklistYellow: const Color(0xFFE9C91D),
        checklistGrey: const Color(0xFF6D7E91),
        cameraButtonBorder: Colors.white.withOpacity(0.4),
        cameraButtonFill: Colors.black.withOpacity(0.4),
        cameraPanelBackground: Colors.black.withOpacity(0.6),
        cameraCaptureButtonVideo: Colors.red,
        cameraCaptureButtonPicture: Colors.white,
        cameraCaptureButtonBorder: Colors.white,
        ripple: Colors.white.withOpacity(0.1),
        navigationBar: const Color.fromRGBO(18, 18, 18, 1),
        tabBar: const Color.fromRGBO(18, 18, 18, 1),
        listTileButton: CustomListTileButtonTheme.dark(),
        listTileButtonSmall: CustomListTileButtonTheme.darkSmall(),
        camera: CustomCameraTheme.normal(),
      );

  @override
  List<Object?> get props => [
        chatBubbleIncoming,
        chatBubbleOutgoning,
        appBar,
        appBarReverse,
        shimmerBaseColor,
        shimmerBackgroundColor,
        listTile,
        dialog,
        card,
        background,
        borderButton,
        gradientButton,
        appBarIconButton,
        appBarIconButtonReverse,
        fabButton,
        accent,
        splashBackground,
        textFieldBorder,
        textFieldFocusedBorder,
        divider,
        statusActive,
        statusNew,
        statusNewText,
        statusSent,
        statusSentText,
        statusPending,
        statusCancel,
        statusCancelText,
        statusComplete,
        statusCompleteText,
        delete,
        messageBubbleMe,
        messageBubbleOther,
        chatBackground,
        callBackground,
        callButton,
        callParticipant,
        checklistRed,
        checklistGreen,
        checklistYellow,
        checklistGrey,
        cameraButtonBorder,
        cameraButtonFill,
        cameraPanelBackground,
        cameraCaptureButtonVideo,
        cameraCaptureButtonPicture,
        cameraCaptureButtonBorder,
        ripple,
        navigationBar,
        tabBar,
        listTileButton,
        listTileButtonSmall,
        camera,
      ];
}
