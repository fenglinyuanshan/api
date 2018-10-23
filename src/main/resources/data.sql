-- H2内存数据库的测试数据
INSERT INTO odmp.org (id, name, update_dt, updater_id, create_dt, creator_id)
VALUES (0, 'odc', TIMESTAMP '2018-09-21 17:28:13', 1, TIMESTAMP '2018-09-21 17:28:13', 1),
       (1, 'vcredit', TIMESTAMP '2018-09-21 17:28:13', 1, TIMESTAMP '2018-09-21 17:28:13', 1),
       (2, 'qin', TIMESTAMP '2018-09-21 17:28:13', 1, TIMESTAMP '2018-09-21 17:28:13', 1);

INSERT INTO odmp.user (id, name, passwd, email,org_id)
VALUES (1, 'user1', '$2a$04$Vaf0GlCv5WcV9G1LcAVGN.Kj35jK99h8lIfbVl4RTdOkXNyF.YgFO','1510718902@qq.com', 0),
       (100, 'user', '$2a$04$Vaf0GlCv5WcV9G1LcAVGN.Kj35jK99h8lIfbVl4RTdOkXNyF.YgFO','1510718902@qq.com', 0),
       (2, 'admin', '$2a$04$Vaf0GlCv5WcV9G1LcAVGN.Kj35jK99h8lIfbVl4RTdOkXNyF.YgFO','1510718902@qq.com', 0),
       (3, 'qin', '$2a$04$Vaf0GlCv5WcV9G1LcAVGN.Kj35jK99h8lIfbVl4RTdOkXNyF.YgFO','yang.qin@omnidata.io', 2);


INSERT INTO odmp.batch (id, batch_id, file_id, file_path, status, sender_id, receiver_id, create_dt, update_dt)
VALUES (0, 1023, 21, '/path1/file', '2', 100, 1, TIMESTAMP '2018-09-10 12:53:13', TIMESTAMP '2018-09-10 13:03:01'),
       (1, 1024, 22, '/path2/file', '2', 100, 1, TIMESTAMP '2018-09-10 13:01:23', TIMESTAMP '2018-09-10 13:59:54'),
       (2, 1025, 25, '/path3/file', '2', 100, 1, TIMESTAMP '2018-09-10 18:35:45', TIMESTAMP '2018-09-10 18:34:23'),
       (3, 1027, 26, '/path4/file', '2', 1, 100, TIMESTAMP '2018-09-11 08:21:23', TIMESTAMP '2018-09-11 08:45:32'),
       (4, 1030, 29, '/path5/file', '1', 2, 100, TIMESTAMP '2018-09-11 09:51:59', TIMESTAMP '2018-09-11 09:55:32'),
       (5, 1031, 30, '/path7/file', '2', 100, 3, TIMESTAMP '2018-09-11 10:02:01', TIMESTAMP '2018-09-11 11:05:23'),
       (6, 1033, 31, '/path8/file', '2', 100, 1, TIMESTAMP '2018-09-11 10:03:24', TIMESTAMP '2018-09-11 10:08:58'),
       (7, 1034, 32, '/path9/file', '2', 100, 3, TIMESTAMP '2018-09-11 10:10:29', TIMESTAMP '2018-09-11 10:12:32'),
       (8, 1035, 33, '/path10/file', '0', 100, 3, TIMESTAMP '2018-09-11 10:11:21', TIMESTAMP '2018-09-11 10:15:29'),
       (9, 1036, 34, '/path11/file', '1', 100, 2, TIMESTAMP '2018-09-11 10:13:29', TIMESTAMP '2018-09-11 10:13:42'),
       (10, 1037, 35, '/path12/file', '3', 3, 100, TIMESTAMP '2018-09-11 10:13:45', TIMESTAMP '2018-09-11 10:13:45'),
       (11, 1038, 36, '/path13/file', '4', 100, 2, TIMESTAMP '2018-09-11 10:20:29', TIMESTAMP '2018-09-11 10:20:29'),
       (12, 1039, 37, '/path14/file', '2', 100, 2, TIMESTAMP '2018-09-11 10:20:31', TIMESTAMP '2018-09-11 10:20:31'),
       (13, 1040, 38, '/path15/file', '1', 100, 1, TIMESTAMP '2018-09-11 10:30:57', TIMESTAMP '2018-09-11 10:30:57'),
       (14, 1041, 39, '/path16/file', '1', 100, 3, TIMESTAMP '2018-09-11 10:53:22', TIMESTAMP '2018-09-11 10:53:22'),
       (15, 1042, 40, '/path17/file', '1', 100, 2, TIMESTAMP '2018-09-11 11:04:14', TIMESTAMP '2018-09-11 11:04:14'),
       (16, 1043, 41, '/path18/file', '0', 100, 1, TIMESTAMP '2018-09-11 12:03:44', TIMESTAMP '2018-09-11 12:03:44');

INSERT INTO odmp.client (id,access_key,secret,ip_range,user_id)
VALUES (0,'asd','qw','127.0.0.1',3);
