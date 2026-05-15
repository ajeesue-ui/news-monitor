# 돌발 이벤트 모니터 (News Monitor)

매일 새벽 주요 기술주의 돌발 이벤트를 자동 수집하여 모바일 세로형으로 표시하는 개인용 대시보드.

## 모니터링 대상
- 엔비디아 (NVDA)
- 테슬라 (TSLA)
- 삼성전자 (005930)
- SK하이닉스 (000660)
- 알파벳/구글 (GOOGL)

## 파일 구조

```
news-monitor/
├── index.html              ← 메인 페이지 (단일 HTML, 모든 CSS·JS 인라인)
├── reports/
│   ├── latest.json         ← 오늘 보고서 (항상 최신으로 덮어씀)
│   └── YYYY-MM-DD.json     ← 날짜별 누적 아카이브
├── instructions_v1.0.md    ← Cowork 시스템 지침서
└── README.md               ← 이 파일
```

## GitHub Pages 설정 방법

1. GitHub에 새 repo 생성 (예: `news-monitor`, public 권장)
2. 이 폴더 전체를 repo 루트에 업로드
3. repo Settings → Pages → Source를 `Deploy from a branch` → `main` 브랜치 → `/ (root)` 선택
4. 몇 분 후 `https://[유저명].github.io/news-monitor/` 로 접속 가능
5. 폰 홈 화면에 추가하면 PWA처럼 사용 가능

## 매일 운영 흐름 (Cowork 자동화)

Cowork가 새벽 06:30 KST에 다음을 수행:

1. `instructions_v1.0.md`의 지침에 따라 웹 검색
2. 발견된 돌발 이벤트를 JSON 스키마에 맞춰 생성
3. `reports/latest.json`에 저장 (덮어씀)
4. `reports/YYYY-MM-DD.json`에도 같은 내용 저장 (아카이브)
5. Git 명령: `git add -A && git commit -m "Daily report YYYY-MM-DD" && git push`
6. GitHub Pages가 자동 빌드 (1~2분 소요)
7. 사용자가 08:00 알람 후 폰으로 URL 접속

## 데이터 스키마

`reports/latest.json` 구조는 `instructions_v1.0.md`의 섹션 9 참조.

## 로컬 테스트 방법

GitHub Pages 없이 로컬에서 테스트하려면:

```bash
cd news-monitor
python -m http.server 8000
# 브라우저에서 http://localhost:8000 접속
```

또는 VS Code의 Live Server 확장 사용.

`file://` 프로토콜로는 fetch가 차단되니 반드시 로컬 서버 사용.

## 면책

본 보고서의 모든 주가 영향 추정은 분석 추정치이며 투자 권유가 아닙니다.
