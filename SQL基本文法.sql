-- SQL基本文法
-- table名 players,jobs

-- データ件数を表示する
SELECT COUNT(*) FROM players;

-- 条件にあったデータの件数を表示する
SELECT COUNT(*) FROM players WHERE job_id = 6;

-- データを並び替えて取得する（この場合だと昇順になる）
SELECT * FROM players ORDER BY level;

-- データを並び替えて取得する　逆順
SELECT * FROM players ORDER BY level DESC;

-- 上位3件だけ表示する
SELECT * FROM players ORDER BY level DESC LIMIT 3;

--　職業ごとに人数を集計する
SELECT job_id, COUNT(*) FROM players GROUP BY job_id;

-- データを追加する
INSERT INTO players(id,name,level,job_id) VALUES(11, "テスト1号", 1, 1);

--　データを追加して表示する
-- 2つのSQL文を同時に実行もできる
INSERT INTO players(id,name,level,job_id) VALUES(11, "テスト1号", 1, 1);
SELECT * FROM players;

-- 一度に複数のデータを追加する
INSERT INTO players(id,name,level,job_id)
VALUES (13, "テスト2号", 1,1),(14,"テスト3号",1,1);
-- データを表示する
SELECT * FROM players;

-- データを更新する
UPDATE players SET level = 10 WHERE id = 11;
SELECT * FROM players;

-- データを更新する。1増加
UPDATE players SET level = level + 1 WHERE id = 12;
SELECT * FROM players;

-- データを削除する
DELETE FROM players WHERE id = 123;
SELECT * FROM players;

-- データを削除する
DELETE FROM players WHERE id >= 11;
SELECT * FROM players;

-- テーブルの関連付けとは、重複したデータのテーブルを分割しておいて、必要に応じて、仮想的な1つの表として結合して扱う方法です。
--　テーブル結合には大きく２種類ある
-- 内部結合＆外部結合
-- 外部結合には以下の２つがある。（左結合、右結合）

-- 左players 右jobs
-- 内部結合（お互いの共通する項目だけの結合）
SELECT * FROM players INNER JOIN jobs ON jobs.id = players.job_id;
-- 左結合
SELECT * FROM players LEFT JOIN jobs ON jobs.id = players.job_id;
-- 右結合
SELECT * FROM players RIGHT JOIN jobs ON job_id = players.job_id;


--内部結合したテーブルの操作
SELECT name, level, vitality FROM players INNER JOIN jobs ON jobs.id = players.job_id;

-- 結合したテーブルで、条件に合った行だけ表示
SELECT name, level, strength FROM players INNER JOIN jobs ON jobs.id = players.job_id WHERE strength >= 5;

-- 職業ごとに人数を集計する
SELECT job_id, job_name, COUNT(*) FROM players INNER JOIN jobs ON jobs.id = players.job_id GROUP BY job_id;








