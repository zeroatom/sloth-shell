DROP TABLE IF EXISTS `sql_config`;
CREATE TABLE `sql_config` (
      `name` varchar(255) NOT NULL,
      `value` varchar(255) DEFAULT NULL,
      PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sql_config` VALUES ('update_version', '20190123');

DROP TABLE IF EXISTS `sql_updates`;
CREATE TABLE `sql_updates` (
      `name` varchar(255) DEFAULT NULL,
      `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
      `code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
