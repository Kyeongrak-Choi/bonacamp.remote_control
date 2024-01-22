# server_manager

서버 상태 관리 어플리케이션

## Getting Started

This project is a starting point for a Flutter application.

## Project Configuration

Target Platform : android / iOS / Web / Desktop(windows)

SDK : Flutter 3.13.1

Library

- GetX (https://pub.dev/packages/get)
- Firebase (https://pub.dev/packages/firebase_core)
- Google Sign In (https://pub.dev/packages/google_sign_in)
- dio (https://pub.dev/packages/dio)
- hive (https://pub.dev/packages/hive)

References 
- https://bonacamp.atlassian.net/wiki/spaces/~623136c573c8ec00699cdd1f/pages/297435150/Remote+Service+Control
- https://console.firebase.google.com/u/0/project/adminmanager-13614/settings/general/android:bonacamp.se.system_manager.server_manager?hl=ko

## Caution
Firebase Google 로그인기능 관련하여,
빌드시 본인 PC SHA 인증서 지문 값이 Firebase 프로젝트에 등록되어야 하고,
SHA 키 등록후 google-services.json 새로 받아서 프로젝트에 포함시켜야 함

![image](https://github.com/bonacamp-dev/bonacamp.se.system-manager/assets/107381786/d3317cdd-0edb-43ed-9afc-58d2f03e2522)


## Directory

```bash
lib
  ├─components
  ├─layouts
  ├─models
  └─utils
```
