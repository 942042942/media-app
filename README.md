# 星云影视

这是一个手机端优先的纯前端静态页面，并配套 Flutter WebView Android APK 打包流水线。

## 本地预览

直接用浏览器打开 `index.html` 即可预览页面。由于浏览器本地文件安全策略可能拦截 `config.json`，也可以启动一个静态服务：

```bash
python3 -m http.server 8080
```

然后访问 `http://localhost:8080`。

## 配置

修改 `config.json`：

- `advertisement`: 首页顶部广告/流量卡 Banner 的标题、描述和跳转链接
- `remoteConfigUrl`: 远程配置地址，APK 启动和刷新时会优先读取它
- `apiSources`: 苹果 CMS JSON 采集接口列表。项目默认启用两个 GitHub Raw 演示源，使用公开视频/测试流，支持 CORS
- `videoApiUrl`: 兼容旧配置的单采集接口 URL，留空时使用页面内置示例数据
- `announcement`: 最新公告
- `categories`: 首页分类标签

苹果 CMS 接口会自动追加 `ac=detail` 拉取详情列表，搜索时会追加 `wd=关键词`。接口建议返回数组，或包含 `list`、`data`、`videos` 字段的对象。每条数据可使用 `title/name/vod_name`、`category/type/type_name`、`poster/cover/vod_pic`、`vod_play_from`、`vod_play_url` 等字段。

`vod_play_url` 支持苹果 CMS 常见格式：

```text
第1集$https://example.com/video1.m3u8#第2集$https://example.com/video2.m3u8
```

页面内置 ArtPlayer 与 hls.js。播放 HLS/m3u8 时，采集源和播放地址需要允许跨域访问；Android WebView 中也建议优先使用 HTTPS 视频地址。

默认演示源位于 `mock/` 目录，保持苹果 CMS 常见 JSON 字段结构，方便你在没有真实接口时测试列表、搜索和播放。上线前请替换为你有授权的数据源。

## 远程配置

APK 内置 `config.json` 作为兜底配置，同时会优先读取：

```text
https://raw.githubusercontent.com/942042942/media-app/main/remote-config.json
```

以后只需要修改仓库里的 `remote-config.json` 并推送到 GitHub，App 下次启动、点击右上角刷新按钮，或在顶部下拉刷新时就会加载新配置，无需重新打包 APK。

## GitHub Actions 打包

推送到 GitHub 后，可在 Actions 中运行 `Build Android APK` 工作流。构建成功后，APK 会作为 `media-resource-webview-apk` artifact 上传。

也可以手动进入 GitHub 仓库的 Actions 页面，选择 `Build Android APK`，点击 `Run workflow`。
