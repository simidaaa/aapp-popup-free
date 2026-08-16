# AAPP Popup Free

AAPP Popup Free 是面向 Hand2Note 4.1 的免费德州扑克数据阅读 Popup。它以“底池类型、
玩家角色、位置关系、街道和行动顺序”为主线，保留总体行动倾向，去掉具体位置组合与
下注尺寸拆分，适合作为系统阅读对手数据的入门版本。

> English summary: A free, compact Hand2Note 4.1 popup for reading overall poker
> action tendencies by pot type, role, position, street, and action line.

## 当前状态

这是 `v0.1.0-beta.1` 候选版本。

- Popup 结构已由原作者在 Hand2Note GUI 中确认；
- 当前公开包已通过文件结构、引用闭包、字节级 round-trip 和 SHA-256 检查；
- Stat 可读命名、清理后的完整导入以及代表性无尺寸 Stat 的真实数据语义仍需在独立
  Hand2Note 环境中完成最终运行时复核；
- 因此本版本是 Beta，不应被描述为所有环境均已验证的稳定版。

## 包含内容

```text
Config/
├─ Popups/
│  └─ AAPP pop up Free [-1233478334].statprofile
└─ Stats/
   └─ AAPP pop up Free/
      └─ 1,825 个 .h2nstat
```

文件层基线：

| 项目 | 数量或值 |
| --- | ---: |
| Popup | 1 |
| Popup ID | `-1233478334` |
| 叶子页 | 27 |
| Popup 单元格 | 6,891 |
| Stat 展示位 | 1,830 |
| 本地 Stats | 1,825 |
| 已知 Hand2Note 内置 Stat ID | 2 |
| 非内置悬空引用 | 0 |

完整文件哈希见 [`manifests/files.sha256`](manifests/files.sha256)，发布元数据见
[`manifests/release-manifest.json`](manifests/release-manifest.json)。

## Popup 结构

- 1 个翻前总体页；
- 26 个翻后总体页；
- 覆盖 SRP、3Bet Pot、4Bet Pot 和 Cold 4Bet Pot；
- 按 PFR / Caller、IP / OOP、BvB / 非 BvB 等关系组织；
- 行动线保留 Flop、Turn、River 的行动顺序，不按下注尺寸拆分。

Free 版本不包含具体位置组合页面、下注尺寸变体、`Overall + Extra`、翻前面对加注细节，
也不包含 Pro 顶层的独立 IP / OOP 综合页。

## Line 颜色会不会丢失

不会。Line 的文字、字体、颜色、坐标和跨度都保存在 `.statprofile` 内部。本仓库按字节
发布完整 Popup 文件，没有重新生成或简化它。

本仓库没有附带 `StatAppearanceConfig.h2nconfig`。该文件属于用户全局显示配置，可能
影响 Stat 数值的条件着色，但不负责这里用于区分不同 line 的标题字体颜色。这样可以
保留 Popup 自身设计，同时避免覆盖用户的全局外观设置。

## 安装

要求：Hand2Note 4.1。其他版本尚未验证。

1. 完全关闭 Hand2Note。
2. 备份目标安装目录中的 `Config\Popups` 和 `Config\Stats`。
3. 将本仓库 `Config\Popups` 内的 Popup 文件复制到：

   ```text
   <Hand2Note 安装目录>\Config\Popups
   ```

4. 将整个 `Config\Stats\AAPP pop up Free` 文件夹复制到：

   ```text
   <Hand2Note 安装目录>\Config\Stats
   ```

5. 重新启动 Hand2Note，打开 `AAPP pop up Free`，检查页面、Line 颜色和代表性 Stat。

不要用本仓库的 `Config` 整体覆盖 Hand2Note 的 `Config`。只合并上述 Popup 文件和
Stats 子目录。如果目标环境已经存在相同 Popup ID 或同名 Stats，必须先备份再替换。

## 校验下载内容

在仓库根目录运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\Verify-Release.ps1
```

成功时输出 Popup、Stats 数量以及 `Verification passed`。该检查证明文件与发布清单
一致，但不能代替 Hand2Note GUI 和真实牌谱运行时验收。

## 卸载或回滚

最安全的方式是：完全关闭 Hand2Note，然后恢复安装前备份。不要在 Hand2Note 运行时
删除或替换配置，也不要删除被其他自定义 Popup 复用的 Stat。

## 数据解释

Popup 展示的是历史牌谱样本中的行动倾向，不会自动给出最优策略。样本量、对手类型、
牌面和游戏环境仍需要由使用者判断。

## 公开边界

本仓库不包含：

- Hand2Note 程序、DLL、反编译源码或官方商业配置；
- 账号、Token、数据库、日志、牌谱、用户名或其他个人运行数据；
- Pro、Player Pool、其他 Popup、HUD、Templates 或全局 `.h2nconfig`。

## 许可证与声明

本项目采用 [Apache License 2.0](LICENSE)，详见 [NOTICE](NOTICE)。

本项目是独立社区项目，与 Hand2Note 官方没有关联，也未获得其赞助或背书。
Hand2Note 名称及相关商标归其各自权利人所有。只能处理和安装自己有权使用的文件。
