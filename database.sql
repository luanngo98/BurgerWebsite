use burger;

insert into role(code,name) values('ADMIN','Quản trị');
insert into role(code,name) values('USER','Người dùng');

insert into user(username,password,fullname,status)
values('admin','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','ngô thành luân',1);
insert into user(username,password,fullname,status)
values('nguyenvana','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyễn văn A',1);
insert into user(username,password,fullname,status)
values('nguyenvanb','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyễn văn B',1);
insert into user(username,password,fullname,status)
values('admin2','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyễn văn C',1);


INSERT INTO user_role(userid,roleid) VALUES (1,1);
INSERT INTO user_role(userid,roleid) VALUES (2,2);
INSERT INTO user_role(userid,roleid) VALUES (3,2);
INSERT INTO user_role(userid,roleid) VALUES (4,1);

-- INSERT INTO `burger`.`burger` (`ingredient`, `name`, `price`) VALUES ('aaa', 'aaa', '111');
-- INSERT INTO `burger`.`burger` (`ingredient`, `name`, `price`) VALUES ('bbb', 'bbb', '222');
-- INSERT INTO `burger`.`burger` (`ingredient`, `name`, `price`) VALUES ('ccc', 'ccc', '333');
-- INSERT INTO `burger`.`burger` (`ingredient`, `name`, `price`) VALUES ('ddd', 'ddd', '444');
-- INSERT INTO `burger`.`burger` (`ingredient`, `name`, `price`) VALUES ('eee', 'eee', '555');
-- INSERT INTO `burger`.`burger` (`ingredient`, `name`, `price`) VALUES ('fff', 'fff', '666');
-- INSERT INTO `burger`.`burger` (`ingredient`, `name`, `price`) VALUES ('ggg', 'ggg', '777');
-- INSERT INTO `burger`.`burger` (`ingredient`, `name`, `price`) VALUES ('hhh', 'hhh', '888');

-- '3', NULL, NULL, 'admin', '2020-09-09 09:43:16', 'Burger bò khoai giòn tràn pho mai\r\n', 'Burger bò khoai giòn tràn pho mai', '59000', '/images/3.png', '3.png'
-- '4', 'admin', '2020-09-09 09:45:25', 'admin', '2020-09-09 09:45:25', 'Burger 2 miếng bò khoai giòn tràn pho mai', 'Burger 2 miếng bò khoai giòn tràn pho mai', '79000', '/images/6.png', '6.png'
-- '5', 'admin', '2020-09-09 09:46:21', 'admin', '2020-09-09 09:46:21', 'Burger bò nướng khoai tây lát', 'Burger bò nướng khoai tây lát', '47000', '/images/2.png', '2.png'
-- '6', NULL, NULL, 'admin', '2020-09-09 09:47:27', 'Burger  bò tắm pho mai', 'Burger bò tắm pho mai', '10500', '/images/4.png', '4.png'
-- '7', 'admin', '2020-09-09 10:02:15', 'admin', '2020-09-09 10:02:15', 'Burger bò nướng whopper jr.', 'Burger bò nướng whopper jr.', '47000', '/images/7.png', '7.png'
-- '8', 'admin', '2020-09-09 10:03:42', 'admin', '2020-09-09 10:03:42', 'Burger bò nướng phô mai thịt heo xông khói whopper', 'Burger bò nướng phô mai thịt heo xông khói whopper', '125000', '/images/5.png', '5.png'
-- '9', 'admin', '2020-09-09 10:06:24', 'admin', '2020-09-09 10:06:24', 'Burger phô mai gà', 'Burger phô mai gà', '44000', '/images/1.png', '1.png'
-- '10', 'admin', '2020-09-09 10:08:00', 'admin', '2020-09-09 10:08:00', 'Burger bò nướng ', 'Burger bò nướng ', '47000', '/images/8.png', '8.png'
