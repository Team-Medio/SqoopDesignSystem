#  폰트 사용법

### 주요 사용법
1. UIFont와 Font의 정적 계산 프로퍼티, 정적 메서드로 피그마 폰트 시스템에 맞는 이름을 입력해서 사용
    ex) someView.font(.highlight01)
2. View의 .fontWithLineHeight(_ fontSystem : FontSystem) 커스텀 모디파이어를 통해 자동으로 lineHeight를 적용해서 사용
    ex) someView.fontWithLineHeight(.highlihgt01)

## 주요 엔티티
- FontSystem: 피그마 폰트시스템에서 설정한 폰트 정보들의 Enum 값, 일부 case에 FontWeight 연관 값을 사용해 폰트 정보 대응
- FontName: 사용할 폰트의 이름 ex) Pretendard
- FontWeight: 폰트의 굵기
