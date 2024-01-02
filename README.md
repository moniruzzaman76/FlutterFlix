
# Flutterflix ( Video Player App)
Video Player App using Flutter,Api and State Management.

## APk file for App



## Description
This project involves creating a visually appealing Flutter video player app with seamless API integration, video playback functionality, and efficient state management.

## Responsibilities

- As the creator of Flutterflix, my responsibilities included:

- Design Implementation: Recreate the UI design provided in the Figma link, ensuring pixel-perfect accuracy.Design the Home and Video Play pages with a focus on aesthetics and usability.

- API Integration: Utilize the provided API endpoint (https://test-ximit.mahfil.net/api/trending-video/1?page=1) to fetch trending video data.

- Video Playback: Use a video player library to integrate video playback functionality.Retrieve video details from the Video List page; no additional API call is required for video details.Display the video thumbnail on the Video Play page initially, and start playing the video when the thumbnail is hidden.

- Getx State Management Implementation: Utilize the get package for state management in Flutter, employing GetX controllers to handle the app's business logic, dependency injection, and navigation, providing a clean and concise implementation of state-related tasks.

## Challenges Faced
During the development of FlutterFlix, several challenges were encountered, including:

- Video Playback Integration: Integrating a video player library and synchronizing it with the app's state.
- Pagination: implementing pagination accurately.

## How Challenges Were Overcome

- Those challenges were overcome with online resources such as documentation and videos.

## FlutterFlix UI Design



### Installation

Follow these steps to run the CraftyBay Application:

1. Clone this repository to your local machine:

```bash
git clone https://github.com/moniruzzaman76/FlutterFlix
```

2. Navigate to the project folder:

```bash
cd flutterflix
```

3. Install dependencies:

```bash
flutter pub get
```

### How to Run

Connect your device or emulator and run the app using the following command:

```bash
flutter run
```
## Used Packages

Video Player app integrates the following packages to enhance functionality:
- `cupertino_icons: ^1.0.2:` The cupertino_icons package provides a set of Cupertino-style icons for Flutter apps.
- `google_fonts: ^6.1.0:` The google_fonts package simplifies the integration of Google Fonts into Flutter apps. It allows developers to easily use a variety of Google Fonts for text elements in their application, enhancing the overall typography and visual appeal.
- `video_player: ^2.8.1:` The video_player package is used to integrate video playback functionality into a Flutter app. It simplifies the implementation of video-related features, such as playing, pausing, and customizing video playback.
- `intl: ^0.19.0:` The intl package provides internationalization and localization support for Flutter apps.
- `get: ^4.6.5:` Get is a state management library for Flutter that simplifies the process of managing application state. It provides a clean and efficient way to handle state and dependencies in your app.
- `http: ^1.1.0:` The HTTP package provides a straightforward way to make HTTP requests in your Flutter app. It's essential for fetching data from APIs and working with web services.

# Project Structure
```
.
└── FlutterFlix/
    ├── assets/
    │   └── images/
    │       ├── arrow.png
    │       ├── Like.png
    │       ├── Share.png
    │       ├── SubmitButton.png
    │       └── thumbnail.jpg
    └── lib/
        ├── data/
        │   ├── model/
        │   │   └── video_player_model.dart
        │   ├── network_service/
        │   │   ├── network_caller.dart
        │   │   └── network_response.dart
        │   └── utils/
        │       └── urls.dart
        ├── State_holders/
        │   └── video_playList_controller.dart
        ├── view/
        │   ├── screen/
        │   │   └── home_screen.dart
        │   ├── video_player_screen.dart
        │   ├── utils/
        │   │   ├── icon_url.dart
        │   │   └── image_url.dart
        │   └── widget/
        │       ├── below_video_buttons.dart
        │       ├── channel_detail_and_subscribe.dart
        │       ├── container_box.dart
        │       ├── user_comment_tile.dart
        │       └── video_list_widget.dart
        └── main.dart
```

## Contributors

- [Moniruzzaman](https://github.com/moniruzzaman76)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
