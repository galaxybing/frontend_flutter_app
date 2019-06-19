# frontend_flutter_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


查看真机设备是否成功联接开发者电脑
  * flutter devices

开源软件包,查询 - https://pub.flutter-io.cn/flutter

  1. pubspec.yaml 配置文件添加依赖：
    ```yml
    dependencies:
      english_words: ^3.1.0
    ```

    ```bash
    # 在“调试控制台” flutter 显示以下，则表示自动下载成功：
    > [frontend_flutter_app] flutter packages get
    > Running "flutter packages get" in frontend_flutter_app...           0.4s
    > exit code 0
    ```

  2. .packages 文件显示依赖软件包安装的位置：

    english_words:file:///D:/install/flutter/.pub-cache/hosted/pub.dartlang.org/english_words-3.1.5/lib/

Widget 类

  * StatelessWidget
  * StatefulWidget
  * State

调试语句执行： print('galaxyw....' + wordPairContent.asPascalCase);
> I/flutter (10879): galaxyw....BriefPass
>
>var listArr = const [1, 2, 3];
>
>    print(listArr);
