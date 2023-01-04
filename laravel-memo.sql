-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:8889
-- 生成日時: 2023 年 1 月 03 日 10:49
-- サーバのバージョン： 5.7.34
-- PHP のバージョン: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `laravel-memo`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `memos`
--

CREATE TABLE `memos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `memos`
--

INSERT INTO `memos` (`id`, `content`, `user_id`, `deleted_at`, `updated_at`, `created_at`) VALUES
(1, 'インサートメモ１\r\n230102  24:40  UPDATE', 1, NULL, '2023-01-02 06:39:40', '2023-01-02 11:55:14'),
(2, 'インサートメモ２', 1, NULL, '2023-01-02 22:53:36', '2023-01-02 11:57:49'),
(3, 'インサートメモ3', 1, NULL, '2023-01-02 12:04:14', '2023-01-02 12:04:14'),
(4, 'インサートメモ１', 1, '2023-01-02 07:11:27', '2023-01-02 07:11:27', '2023-01-02 12:16:44'),
(5, 'memo5　230102 2150', 1, NULL, '2023-01-02 12:50:32', '2023-01-02 12:50:32'),
(6, '230102  23:09のエラー多発状態からの復活？\r\nでもまだ「保存」が「更新」に変わらない。。。', 1, NULL, '2023-01-02 14:10:19', '2023-01-02 14:10:19'),
(7, '230102  23:10　メモ一覧をaタグにしたのにリンクに飛べない。。', 1, NULL, '2023-01-02 14:10:58', '2023-01-02 14:10:58'),
(8, '230102  23:30  絶望的なクライにエラーが出まくる。\r\nどうやって対処したら良いのか？？？', 1, NULL, '2023-01-02 14:31:05', '2023-01-02 14:31:05'),
(9, 'インサートメモ１', 1, '2023-01-02 07:20:12', '2023-01-02 07:20:12', '2023-01-02 15:01:10'),
(10, '230102. 24:02.  href=\"/edit/{{$memo[\'id\']}}\" の入力をしたら、何故か動き始めた。app.blade.phpですが。何か。\r\n                    @foreach($memos as $memo)\r\n                            <a href=\"/edit/{{$memo[\'id\']}}\" class=\"card-text d-block\">{{$memo[\'content\']}}</a>\r\n                    @endforeach', 1, NULL, '2023-01-02 15:03:48', '2023-01-02 15:03:48'),
(11, '230102  25:26　sec36でMySQLのDBで、deleted_atの日時を削除しても\r\n元に戻すことができない。。。が、今日はここまでとしよう。\r\nあと、deleted_atの時間が作成時間と同じになっているが、\r\n見本も同じなので、おそらくこの後何かあるんでしょう。', 1, NULL, '2023-01-02 16:28:48', '2023-01-02 16:28:48'),
(12, '230103 06:57  最後の３時間、sec37-44を終えたい！がんばろー', 1, NULL, '2023-01-02 21:58:30', '2023-01-02 21:58:30'),
(14, '230103 0736 sec39 新規タグ\r\n新しいタグを入力せずにやってみる', 1, NULL, '2023-01-02 16:48:49', '2023-01-02 22:36:37'),
(15, '230103 0801 タグインサート完了', 1, NULL, '2023-01-02 20:03:32', '2023-01-02 23:13:46'),
(16, '新規タグ２', 1, '2023-01-02 22:52:34', '2023-01-02 22:52:34', '2023-01-02 23:17:19'),
(17, '新規タグ３　230103 0818 sec 41', 1, NULL, '2023-01-02 23:17:43', '2023-01-02 23:17:43'),
(18, 'tag 4', 1, NULL, '2023-01-02 14:52:27', '2023-01-02 23:23:35'),
(19, 'tag5 230103 08:52 sec41 08:37辺り', 1, NULL, '2023-01-02 14:52:06', '2023-01-02 23:51:55'),
(20, '230103 0900 sec41 ３つのタグを紐つけろ', 1, NULL, '2023-01-02 15:01:22', '2023-01-02 23:59:58'),
(21, 'きぞんタグ＋新規タグ', 1, NULL, '2023-01-02 19:26:47', '2023-01-03 00:02:29'),
(22, '何が治ったのか？230103 09:13 sec42だよ', 1, NULL, '2023-01-02 16:43:56', '2023-01-03 00:12:52'),
(23, '230103_1342 back to home sec44終了後のリカバリー\r\nおかしいままだが、セクション６ sec45に取り掛かろう。今日中に終了させる。\r\n・tagの記録が残らない。MySQLで制限がかかっている可能性あり。\r\n　課題残ったままだが、なんとかかんとか取り組もう。', 1, NULL, '2023-01-02 19:44:28', '2023-01-03 04:26:12'),
(24, '230103_1403 sec45の最後の辺り。\r\nview composerはなんとかなった感じ。', 1, NULL, '2023-01-03 05:04:14', '2023-01-03 05:04:14'),
(25, '230103_1501 sec47終わり。\r\ntagとmemoのリンケージがうまくいってないのが根本げんいん。\r\nいったんぜんぶ終えてから修正したい。いけるかな？', 1, NULL, '2023-01-03 06:02:17', '2023-01-03 06:02:17'),
(26, '230103_1501 sec47終わり。\r\nlocalhost:8888/? の後が先生のと違う。。。', 1, NULL, '2023-01-03 06:03:20', '2023-01-03 06:03:20'),
(27, '230103_1626 sec49の最後。こうしんのvalidationのかくにん用', 1, NULL, '2023-01-02 22:27:04', '2023-01-03 07:26:42'),
(28, 'validationチェック用', 1, NULL, '2023-01-02 22:30:06', '2023-01-03 07:27:25'),
(29, '削除チェック用', 1, '2023-01-02 22:53:52', '2023-01-02 22:53:52', '2023-01-03 07:53:45'),
(30, '削除アラートチェック用', 1, '2023-01-02 22:54:45', '2023-01-02 22:54:45', '2023-01-03 07:54:35'),
(31, '削除チェック用', 1, '2023-01-02 22:55:22', '2023-01-02 22:55:22', '2023-01-03 07:55:17'),
(32, '230103_1657_01_削除チェック用', 1, NULL, '2023-01-03 07:57:22', '2023-01-03 07:57:22'),
(33, '230103_1657_02_削除チェック用', 1, '2023-01-02 22:57:55', '2023-01-02 22:57:55', '2023-01-03 07:57:29'),
(34, '230103_1657_03_削除チェック用', 1, NULL, '2023-01-03 07:57:35', '2023-01-03 07:57:35'),
(35, '230103_1657_04_削除チェック用', 1, '2023-01-02 23:04:40', '2023-01-02 23:04:40', '2023-01-03 07:57:43'),
(36, '230103_1657_05_削除チェック用', 1, NULL, '2023-01-03 07:57:50', '2023-01-03 07:57:50'),
(37, '230103_1704 \r\n・更新・削除の画面のレイアウトが壊れている。\r\n・削除のボタンを押す前にアラート表示が出ない。。。', 1, NULL, '2023-01-03 08:06:09', '2023-01-03 08:06:09');

-- --------------------------------------------------------

--
-- テーブルの構造 `memo_tags`
--

CREATE TABLE `memo_tags` (
  `memo_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `memo_tags`
--

INSERT INTO `memo_tags` (`memo_id`, `tag_id`) VALUES
(17, 3),
(18, 4),
(19, 5),
(20, 6),
(20, 3),
(20, 2),
(20, 1),
(22, 7),
(22, 5),
(22, 1),
(23, 18),
(23, 17),
(24, 18),
(24, 17),
(24, 7),
(25, 19),
(37, 19);

-- --------------------------------------------------------

--
-- テーブルの構造 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2023_01_01_151051_create_memos_table', 1),
(13, '2023_01_01_151624_create_tags_table', 1),
(14, '2023_01_01_151717_create_memo_tags_table', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `tags`
--

INSERT INTO `tags` (`id`, `name`, `user_id`, `deleted_at`, `updated_at`, `created_at`) VALUES
(1, 'タグインサート完了', 1, NULL, '2023-01-02 23:13:46', '2023-01-02 23:13:46'),
(2, '新規タグ２', 1, NULL, '2023-01-02 23:17:19', '2023-01-02 23:17:19'),
(3, '新規タグ３', 1, NULL, '2023-01-02 23:17:43', '2023-01-02 23:17:43'),
(4, 'tag 4', 1, NULL, '2023-01-02 23:23:35', '2023-01-02 23:23:35'),
(5, 'tag5', 1, NULL, '2023-01-02 23:51:55', '2023-01-02 23:51:55'),
(6, '３つのタグを紐つけろ', 1, NULL, '2023-01-02 23:59:58', '2023-01-02 23:59:58'),
(7, '何が治ったのか？', 1, NULL, '2023-01-03 00:12:52', '2023-01-03 00:12:52'),
(17, '230103_1145 sec44終了時のtagのバグ', 1, NULL, '2023-01-03 04:24:02', '2023-01-03 04:24:02'),
(18, '230103_1324', 1, NULL, '2023-01-03 04:26:12', '2023-01-03 04:26:12'),
(19, '積み残しの課題', 1, NULL, '2023-01-03 06:02:17', '2023-01-03 06:02:17'),
(20, '230103_1626', 1, NULL, '2023-01-03 07:26:42', '2023-01-03 07:26:42');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '山内明', 'info@demo.jp', NULL, '$2y$10$sbMS3wa8kN0syIld.6YUou8IyVONFX8P74NwYByEdgzdEGFR6P5fG', 'jFVlJxXLz7UEm10DOg0T1jkhiAGenM3xHclnRtP54AjDjBuuilt52GTb5kWt', '2023-01-02 00:21:26', '2023-01-02 00:21:26');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- テーブルのインデックス `memos`
--
ALTER TABLE `memos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memos_user_id_foreign` (`user_id`);

--
-- テーブルのインデックス `memo_tags`
--
ALTER TABLE `memo_tags`
  ADD KEY `memo_tags_memo_id_foreign` (`memo_id`),
  ADD KEY `memo_tags_tag_id_foreign` (`tag_id`);

--
-- テーブルのインデックス `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- テーブルのインデックス `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_user_id_foreign` (`user_id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `memos`
--
ALTER TABLE `memos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- テーブルの AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- テーブルの AUTO_INCREMENT `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `memos`
--
ALTER TABLE `memos`
  ADD CONSTRAINT `memos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- テーブルの制約 `memo_tags`
--
ALTER TABLE `memo_tags`
  ADD CONSTRAINT `memo_tags_memo_id_foreign` FOREIGN KEY (`memo_id`) REFERENCES `memos` (`id`),
  ADD CONSTRAINT `memo_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- テーブルの制約 `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
