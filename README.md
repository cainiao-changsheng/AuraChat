# AuraChat - 虚拟角色聊天 App

跨平台（iOS/Android）虚拟角色聊天应用，支持 Live2D 角色动画、对话气泡、三层记忆系统、AI 人格自定义。

## 技术栈

- **框架**: Flutter 3.x
- **语言**: Dart
- **状态管理**: Provider
- **本地向量数据库**: ChromaDB
- **动画**: Phase 1 静态图 + Flutter 原生动画，Phase 2 Live2D Cubism SDK

## 开发进度

| 里程碑 | 阶段 | 时间 |
|--------|------|------|
| M0 | 预研与架构设计 | 第1周 ✅ |
| M1 | 核心对话UI | 第2-6周 |
| M2 | 角色动画系统 | 第7-13周 |
| M3 | 记忆与AI人格 | 第14-20周 |
| M4 | Live2D集成 | 第21-26周 |
| M5 | 社区分享 | 第27-30周 |
| M6 | 打磨发布 | 第31-34周 |

## 构建

```bash
flutter pub get
flutter run
```

## APK 下载

每次 push 到 main 分支后，GitHub Actions 会自动构建 debug APK，可在 [Actions](https://github.com/2257467528/aurachat/actions) 页面下载。
