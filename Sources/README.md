#  SqoopDesignPackage

### 스쿱에서 사용하는 디자인을 담았습니다

## 파일 구조
### SQComponents: 피그마 디자인 시스템에 있는 뷰 컴포넌트를 정의합니다.
    #### CustomComponents: 버튼, 툴 바(네비게이션 바), 프로그래스 바 등 기존 SwiftUI 컴포넌트를 커스텀 했습니다.
        - Buttons
        - Toolbars
        - SQProgressBar
    #### SQViews: 스쿱에서 사용하는 뷰 컴포넌트를 만들었습니다. - 피그마 참고
        - ListCells
        - PopUp
        - Writings
        - SQOnboardingWriting: 온보딩 작성 뷰입니다.
        - SQPlaylistInfo: 플레이리스트 정보를 담았습니다.
        - SQThumbnailBox: 썸네일 정보를 담았습니다.
### SqoopDesignSystem: 폰트, 이미지, 색상 등의 기본 시스템을 정의합니다.
    - 사용법:
        1. 폰트 적용하기: 최상위 뷰 내부에 .loadSqoopFontSystem() 모디파이어를 추가합니다.
    #### GradientStops: 그라데이션을 단계별로 저장한 배열입니다.
    
