# Taxi Hexa

택시팟 매칭 플랫폼: Taxi Hexa

UNIST의 입지적 특성상 택시를 타고 시내나 울산역으로 이동하는데 많은 비용이 들어 갑니다. 이를 해결하기 위해 택시를 타는 사람들을 모아 택시비를 절약할 수 있도록 도와주는 택시팟 매칭 플랫폼 Taxi Hexa를 개발하였습니다.

전체 프로젝트 소개는 [여기](https://docs.google.com/presentation/d/1diw18e7jkFyxoNhdG-CTJ_SvW0I1bmjpWzMkUdhEdk8/edit?usp=sharing)를 참조해주세요

## Showcase

### 택시팟 생성

<img width="592" alt="create-taxi-party" src="https://github.com/01Joseph-Hwang10/taxi_hexa/assets/72839543/fe290fd2-48d5-4a86-902d-b50565e38980">

### 택시팟 참여

<img width="722" alt="join-taxi-party" src="https://github.com/01Joseph-Hwang10/taxi_hexa/assets/72839543/30f9147a-baf3-4106-b0ef-d24d58afcbe5">

## Getting Started

### Firebase settings

본 앱에서는 flutterfire 패키지를 사용하고, firebase 사용을 위해 안드로이드와 iOS에 각각 설정을 해줘야합니다.

#### Android

아래 도큐멘테이션을 참조해주세요.

<https://firebase.flutter.dev/docs/manual-installation/android>

#### iOS

아래 도큐멘테이션을 참조해주세요.

<https://firebase.flutter.dev/docs/manual-installation/ios>

### Google maps API key setting

본 앱에서는 google_maps_flutter 패키지를 사용하는데, public으로의 API Key 유출을 막기 위해 environment variable을 통해 google maps에 api key를 provide 해줍니다.

google-maps-api-key는 프로젝트 채팅방(카톡방)을 확인하거나 채팅방에 요청해주세요.

#### Android

`android/local.properties`에 다음과 같이 추가합니다 (파일이 없다면 새로 생성합니다).

```sh
# android/local.properties

# ...
googleMapsApiKey=<google-maps-api-key>

```

### iOS

`ios/Flutter/Debug.xcconfig`와 `ios/Flutter/Release.xcconfig`에 다음과 같이 추가합니다 (파일이 없다면 새로 생성합니다).

```obj-c
// ios/Flutter/Debug.xcconfig
#include? "Pods/Target Support Files/Pods-Runner/Pods-Runner.debug.xcconfig"
#include "Generated.xcconfig"

GOOGLE_MAPS_API_KEY=<google-maps-api-key>

```
```obj-c
// ios/Flutter/Release.xcconfig
#include? "Pods/Target Support Files/Pods-Runner/Pods-Runner.release.xcconfig"
#include "Generated.xcconfig"

GOOGLE_MAPS_API_KEY=$(GOOGLE_MAPS_API_KEY_ENVIRONMENT_VARIABLE)

```

### Run the app

다음 커맨드를 통해 디버그 모드로 앱을 실행합니다.
```sh
flutter emulators # 에뮬레이터의 리스트를 반환합니다
flutter emulators --launch <emulator-id> # 에뮬레이터를 실행합니다
flutter run # 에뮬레이터에 앱을 설치하고 실행합니다
```

### json_serializable

외부 API와 통신하여 받아오는 json들은 json_serializable 패키지를 사용하여 객체화합니다.

위 패키지의 사용은 [공식 문서](https://pub.dev/packages/json_serializable)를 참조해주세요.

위 패키지로 직렬화 모듈들을 만들었다면, 아래 코드를 사용해 나머지 [code generation task](https://pub.dev/packages/json_serializable#running-the-code-generator)를 완료하십시오.

```bash
dart run build_runner build
flutter pub run build_runner build
```
