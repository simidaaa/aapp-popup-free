# AAPP Popup Free 图片资产

本目录保存 AAPP Popup Free README 和未来个人网站可以复用的原始分辨率产品截图。
图片未经压缩、裁切或重绘，保留原始字体、颜色和界面比例。

## 图片清单

| 文件 | 用途 | 尺寸 | SHA-256 |
| --- | --- | ---: | --- |
| `01-preflop-test-overview.png` | 翻前总体测试布局 | 2095×744 | `6f0595c2a1e24290b56fc2f82cec898b747cd69c364232ca5d2c0b38a6af48fc` |
| `02-postflop-test-line-colors.png` | 翻后 Line 颜色测试布局 | 2104×1239 | `ea6f01f478ffdffa2b1bbdf1f9d90e6ab18fc67df357895a7712864502d8458d` |
| `03-popup-navigation.png` | 1 个翻前页和 26 个翻后页的导航 | 395×1851 | `bb81ed2134295fba0c6b294d8c6e948cf2ad9355f2d4abbdab5dfb8b1f8bcdfc` |
| `04-preflop-live-view.png` | 实际运行中的翻前总体页面 | 2740×1628 | `b7b3dcbff7d0ea2fbd407456d6a30240e162ecd25ac5668ef9ee5a6637118a19` |
| `05-postflop-live-line-colors.png` | 实际运行中的翻后行动线和颜色系统 | 2025×1662 | `f6a2cfae6f7a50937de7492ae8fa25cd1372e4070cf58159904f2f3dafbfc80c` |

## 内容边界

- `01`、`02` 使用统一的 `99` 测试占位值，只证明页面布局和颜色呈现；
- `04`、`05` 展示实际运行效果；其中 `Hero`、`GG Network` 和统计数字已经由项目
  维护者明确授权公开；
- 截图不用于承诺统计准确率、盈利能力或特定玩家池表现；
- 图片不包含 Pro、Player Pool、账号凭证、Token、数据库路径或牌谱原文。

## 个人网站复用

建设个人网站时，建议从本目录复制图片到网站自己的静态资源目录，不要长期依赖
GitHub Raw 热链。保持原始宽高比，并优先使用以下文案：

- 主视觉：`05-postflop-live-line-colors.png`；
- 产品结构：`04-preflop-live-view.png` + `03-popup-navigation.png`；
- 工程与验收说明：`01-preflop-test-overview.png` +
  `02-postflop-test-line-colors.png`。

项目介绍应继续区分文件层验证、GUI 展示和真实统计语义，不把截图本身当作运行时
正确性的全部证明。

返回[项目 README](../../README.md)。
