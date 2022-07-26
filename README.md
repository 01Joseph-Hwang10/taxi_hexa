# Taxi Hexa

택시팟 매칭 플랫폼: Taxi Hexa

## Getting Started

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
