# 로딩바 템플릿 입니다.

### 추가 방법

- main.dart 에 붙여넣기 !

builder: Loading.init(
    builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child!,
    ),
),


flutter pub add gap
flutter pub add get
flutter pub add logger
flutter pub add loading_animation_widget