import 'dart:async';

import 'package:flutter/material.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (details) {
      debugPrint('HOMEPAGE ERROR: ${details.exception}\n${details.stack}');
      FlutterError.presentError(details);
    };
    runZonedGuarded(() {
      runApp(const MediaResourceApp());
    }, (error, stack) {
      debugPrint('HOMEPAGE ERROR: $error\n$stack');
      runApp(const FallbackApp());
    });
  } catch (error, stack) {
    debugPrint('HOMEPAGE ERROR: $error\n$stack');
    runApp(const FallbackApp());
  }
}

class MediaResourceApp extends StatelessWidget {
  const MediaResourceApp({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '星云影视',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffe11d48)),
          useMaterial3: true,
        ),
        home: const HomePage(),
      );
    } catch (error, stack) {
      debugPrint('HOMEPAGE ERROR: $error\n$stack');
      return const FallbackApp();
    }
  }
}

class FallbackApp extends StatelessWidget {
  const FallbackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeErrorPage(),
    );
  }
}

class SafeErrorPage extends StatelessWidget {
  const SafeErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xfff6f7fb),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            '页面加载失败，请重新打开应用',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class VideoItem {
  const VideoItem({
    required this.title,
    required this.category,
    required this.tag,
    required this.year,
    required this.area,
    required this.poster,
    required this.playUrl,
    required this.description,
  });

  final String title;
  final String category;
  final String tag;
  final String year;
  final String area;
  final String poster;
  final String playUrl;
  final String description;
}

const String _safePlaybackUrl =
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-bubble-11881-large.mp4';

const List<VideoItem> _mockVideos = [
  VideoItem(
    title: '星云影院示范片',
    category: '电影',
    tag: '高清',
    year: '2026',
    area: '内置',
    poster: 'https://peach.blender.org/wp-content/uploads/title_anouncement.jpg?x11217',
    playUrl: _safePlaybackUrl,
    description: '纯 Flutter 安全模式示范片，点击即可进入轻量播放页。',
  ),
  VideoItem(
    title: '蓝海影院',
    category: '剧集',
    tag: '热播',
    year: '2026',
    area: '内置',
    poster: 'https://peach.blender.org/wp-content/uploads/bbb-splash.png',
    playUrl: _safePlaybackUrl,
    description: '零原生插件依赖的备用播放数据。',
  ),
  VideoItem(
    title: '城市夜航',
    category: '综艺',
    tag: '更新',
    year: '2025',
    area: '内置',
    poster: 'https://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny.jpg',
    playUrl: _safePlaybackUrl,
    description: '用于保证首页卡片点击后一定能进入播放页。',
  ),
  VideoItem(
    title: '云端纪录片',
    category: '纪录片',
    tag: '推荐',
    year: '2024',
    area: '内置',
    poster: 'https://download.blender.org/durian/poster/sintel_poster.jpg',
    playUrl: _safePlaybackUrl,
    description: '轻量模式下展示封面和安全播放地址。',
  ),
  VideoItem(
    title: '极光动漫',
    category: '动漫',
    tag: '新番',
    year: '2026',
    area: '内置',
    poster: 'https://orange.blender.org/wp-content/themes/orange/images/common/ed_header.jpg',
    playUrl: _safePlaybackUrl,
    description: '避免所有复杂 Native 初始化。',
  ),
  VideoItem(
    title: '周末片场',
    category: '电影',
    tag: '精选',
    year: '2025',
    area: '内置',
    poster: 'https://mango.blender.org/wp-content/uploads/2013/05/01_thom_celia_bridge.jpg',
    playUrl: _safePlaybackUrl,
    description: '播放器页使用纯 Flutter 组件渲染。',
  ),
  VideoItem(
    title: '午夜放映厅',
    category: '剧集',
    tag: '连载',
    year: '2026',
    area: '内置',
    poster: 'https://download.blender.org/durian/poster/sintel_poster.jpg',
    playUrl: _safePlaybackUrl,
    description: '始终可跳转，绝不依赖 WebView 或原生视频插件。',
  ),
  VideoItem(
    title: '星轨现场',
    category: '综艺',
    tag: '现场',
    year: '2026',
    area: '内置',
    poster: 'https://peach.blender.org/wp-content/uploads/title_anouncement.jpg?x11217',
    playUrl: _safePlaybackUrl,
    description: '安全播放模式下的最终兜底卡片。',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        backgroundColor: const Color(0xfff6f7fb),
        appBar: AppBar(
          backgroundColor: const Color(0xfff6f7fb),
          surfaceTintColor: Colors.transparent,
          title: const Text('星云影视'),
          centerTitle: false,
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Color(0xff111827), Color(0xff0f766e)],
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '安全播放模式',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '已彻底移除原生 WebView/播放器依赖，所有卡片点击都走纯 Flutter 路由。',
                          style: TextStyle(color: Colors.white70, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        '热门推荐',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 0.68,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => VideoCard(video: _mockVideos[index]),
                    childCount: _mockVideos.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } catch (error, stack) {
      debugPrint('HOMEPAGE ERROR: $error\n$stack');
      return const SafeErrorPage();
    }
  }
}

class VideoCard extends StatelessWidget {
  const VideoCard({required this.video, super.key});

  final VideoItem video;

  void _openPlayer(BuildContext context) {
    try {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => SafePlayerPage(video: video),
        ),
      );
    } catch (error, stack) {
      debugPrint('HOMEPAGE ERROR: $error\n$stack');
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => SafePlayerPage(video: _mockVideos.first),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => _openPlayer(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ColoredBox(
                      color: const Color(0xff111827),
                      child: Image.network(
                        video.poster,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffe11d48), Color(0xff0891b2)],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: .65),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          video.tag,
                          style: const TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${video.category} · ${video.year} · ${video.area}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Color(0xff6b7280), fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SafePlayerPage extends StatelessWidget {
  const SafePlayerPage({required this.video, super.key});

  final VideoItem video;

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        backgroundColor: const Color(0xff0b1220),
        appBar: AppBar(
          backgroundColor: const Color(0xff0b1220),
          foregroundColor: Colors.white,
          title: Text(video.title),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(color: Colors.black),
                      Image.network(
                        video.poster,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff111827), Color(0xff1d4ed8)],
                            ),
                          ),
                        ),
                      ),
                      Container(color: Colors.black.withValues(alpha: .28)),
                      const Center(
                        child: Icon(
                          Icons.play_circle_fill_rounded,
                          color: Colors.white,
                          size: 88,
                        ),
                      ),
                      Positioned(
                        left: 16,
                        right: 16,
                        bottom: 16,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: .52),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Text(
                            '纯 Flutter 安全播放页已打开，已切换为零原生插件模式。',
                            style: TextStyle(color: Colors.white, height: 1.4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                video.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${video.category} · ${video.year} · ${video.area}',
                style: const TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .08),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '安全播放地址',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 8),
                    SelectableText(
                      video.playUrl,
                      style: const TextStyle(color: Colors.white70, height: 1.4),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      video.description,
                      style: const TextStyle(color: Colors.white70, height: 1.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('已进入安全播放模式，页面跳转正常。')),
                  );
                },
                icon: const Icon(Icons.play_arrow_rounded),
                label: const Text('确认播放页已打开'),
              ),
            ],
          ),
        ),
      );
    } catch (error, stack) {
      debugPrint('HOMEPAGE ERROR: $error\n$stack');
      return const SafeErrorPage();
    }
  }
}
