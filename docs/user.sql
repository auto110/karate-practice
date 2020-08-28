create database if not exists karateAuto;
use karateAuto;
create table if not exists user
(
    id    int auto_increment primary key,
    name  varchar(255) null,
    age   int          null,
    hobby varchar(500) null,
    accountID int not null,
    operation_time timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT charset = utf8;


insert into user values (1, "张三", 22, "羽毛球",100001, NOW());
insert into user values (2, "李四", 23, "篮球",100002,NOW());
insert into user values (3, "小丽", 21, "画画",100003,NOW());

select name from user where accountID = '100001'

# drop table user;