/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50643
Source Host           : localhost:3306
Source Database       : cnblog

Target Server Type    : MYSQL
Target Server Version : 50643
File Encoding         : 65001

Date: 2019-03-28 00:05:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add blog', '6', 'add_blog');
INSERT INTO `auth_permission` VALUES ('22', 'Can change blog', '6', 'change_blog');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete blog', '6', 'delete_blog');
INSERT INTO `auth_permission` VALUES ('24', 'Can view blog', '6', 'view_blog');
INSERT INTO `auth_permission` VALUES ('25', 'Can add article up down', '7', 'add_articleupdown');
INSERT INTO `auth_permission` VALUES ('26', 'Can change article up down', '7', 'change_articleupdown');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete article up down', '7', 'delete_articleupdown');
INSERT INTO `auth_permission` VALUES ('28', 'Can view article up down', '7', 'view_articleupdown');
INSERT INTO `auth_permission` VALUES ('29', 'Can add article', '8', 'add_article');
INSERT INTO `auth_permission` VALUES ('30', 'Can change article', '8', 'change_article');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete article', '8', 'delete_article');
INSERT INTO `auth_permission` VALUES ('32', 'Can view article', '8', 'view_article');
INSERT INTO `auth_permission` VALUES ('33', 'Can add comment', '9', 'add_comment');
INSERT INTO `auth_permission` VALUES ('34', 'Can change comment', '9', 'change_comment');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete comment', '9', 'delete_comment');
INSERT INTO `auth_permission` VALUES ('36', 'Can view comment', '9', 'view_comment');
INSERT INTO `auth_permission` VALUES ('37', 'Can add user', '10', 'add_userinfo');
INSERT INTO `auth_permission` VALUES ('38', 'Can change user', '10', 'change_userinfo');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete user', '10', 'delete_userinfo');
INSERT INTO `auth_permission` VALUES ('40', 'Can view user', '10', 'view_userinfo');
INSERT INTO `auth_permission` VALUES ('41', 'Can add tag', '11', 'add_tag');
INSERT INTO `auth_permission` VALUES ('42', 'Can change tag', '11', 'change_tag');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete tag', '11', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('44', 'Can view tag', '11', 'view_tag');
INSERT INTO `auth_permission` VALUES ('45', 'Can add article2 tag', '12', 'add_article2tag');
INSERT INTO `auth_permission` VALUES ('46', 'Can change article2 tag', '12', 'change_article2tag');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete article2 tag', '12', 'delete_article2tag');
INSERT INTO `auth_permission` VALUES ('48', 'Can view article2 tag', '12', 'view_article2tag');
INSERT INTO `auth_permission` VALUES ('49', 'Can add category', '13', 'add_category');
INSERT INTO `auth_permission` VALUES ('50', 'Can change category', '13', 'change_category');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete category', '13', 'delete_category');
INSERT INTO `auth_permission` VALUES ('52', 'Can view category', '13', 'view_category');

-- ----------------------------
-- Table structure for `blog_article`
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `comment_count` int(11) NOT NULL,
  `up_count` int(11) NOT NULL,
  `down_count` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`),
  KEY `blog_article_category_id_7e38f15e_fk_blog_category_nid` (`category_id`),
  KEY `blog_article_user_id_5beb0cc1_fk_blog_userinfo_nid` (`user_id`),
  CONSTRAINT `blog_article_category_id_7e38f15e_fk_blog_category_nid` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`nid`),
  CONSTRAINT `blog_article_user_id_5beb0cc1_fk_blog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `blog_userinfo` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES ('1', 'JavaIO流中的拷贝', 'JavaIO流中对数据的操作尤为重要，掌握了基本的拷贝操作，才能将各种数据源的操作联系起来。 ...', '2019-03-25 15:01:09.863513', '<div id=\"cnblogs_post_body\" class=\"blogpost-body\"><p>&nbsp;</p>\r\n<hr>\r\n<p style=\"margin-left: 60px;\">&nbsp;</p>\r\n<p><span style=\"font-family: 仿宋;\">　<span style=\"font-size: 16px; font-family: 黑体;\">题目链接：<span style=\"text-decoration: underline;\">http://acm.hdu.edu.cn/showproblem.php?pid=2089</span></span></span></p>\r\n<h1><span style=\"font-family: 黑体; font-size: 16px;\">不要62</span></h1>\r\n<p><span style=\"font-family: 黑体; font-size: 16px;\"><strong>Time Limit: 1000/1000 MS (Java/Others)&nbsp;&nbsp;&nbsp;&nbsp;</strong></span></p>\r\n<p><span style=\"font-family: 黑体; font-size: 16px;\"><strong>Memory Limit: 32768/32768 K (Java/Others)</strong></span></p>\r\n<div class=\"panel_title\" align=\"left\"><span style=\"font-family: 黑体; font-size: 16px;\">Problem Description</span></div>\r\n<div class=\"panel_content\"><span style=\"font-family: 黑体; font-size: 16px;\">杭州人称那些傻乎乎粘嗒嗒的人为62（音：laoer）。</span><br><span style=\"font-family: 黑体; font-size: 16px;\">杭州交通管理局经常会扩充一些的士车牌照，新近出来一个好消息，以后上牌照，不再含有不吉利的数字了，这样一来，就可以消除个别的士司机和乘客的心理障碍，更安全地服务大众。</span><br><span style=\"font-family: 黑体; font-size: 16px;\">不吉利的数字为所有含有4或62的号码。例如：</span><br><span style=\"font-family: 黑体; font-size: 16px;\">62315  73418  88914</span><br><span style=\"font-family: 黑体; font-size: 16px;\">都属于不吉利号码。但是，61152虽然含有6和2，但不是62连号，所以不属于不吉利数字之列。</span><br><span style=\"font-family: 黑体; font-size: 16px;\">你的任务是，对于每次给出的一个牌照区间号，推断出交管局今次又要实际上给多少辆新的士车上牌照了。</span></div>\r\n<div class=\"panel_bottom\"><span style=\"font-family: 黑体; font-size: 16px;\">&nbsp;</span></div>\r\n<div class=\"panel_title\" align=\"left\"><span style=\"font-family: 黑体; font-size: 16px;\">Input</span></div>\r\n<div class=\"panel_content\"><span style=\"font-family: 黑体; font-size: 16px;\">输入的都是整数对n、m（0&lt;n≤m&lt;1000000），如果遇到都是0的整数对，则输入结束。</span></div>\r\n<div class=\"panel_bottom\"><span style=\"font-family: 黑体; font-size: 16px;\">&nbsp;</span></div>\r\n<div class=\"panel_title\" align=\"left\"><span style=\"font-family: 黑体; font-size: 16px;\">Output</span></div>\r\n<div class=\"panel_content\"><span style=\"font-family: 黑体; font-size: 16px;\">对于每个整数对，输出一个不含有不吉利数字的统计个数，该数值占一行位置。</span></div>\r\n<div class=\"panel_bottom\"><span style=\"font-family: 黑体; font-size: 16px;\">&nbsp;</span></div>\r\n<div class=\"panel_title\" align=\"left\"><span style=\"font-family: 黑体; font-size: 16px;\">Sample Input</span></div>\r\n<div class=\"panel_content\">\r\n<div><span style=\"font-family: 黑体; font-size: 16px;\">1 100</span></div>\r\n<div><span style=\"font-family: 黑体; font-size: 16px;\">0 0</span></div>\r\n\r\n\r\n\r\n</div>\r\n<div class=\"panel_bottom\"><span style=\"font-family: 黑体; font-size: 16px;\">&nbsp;</span></div>\r\n<div class=\"panel_title\" align=\"left\"><span style=\"font-family: 黑体; font-size: 16px;\">Sample Output</span></div>\r\n<div class=\"panel_content\">\r\n<div><span style=\"font-family: 黑体; font-size: 16px;\">80</span></div>\r\n<div><span style=\"font-family: 黑体; font-size: 16px;\">&nbsp;</span></div>\r\n<div><span style=\"font-family: 黑体; font-size: 16px;\">题意：给定一段数，比如说 [1 ,100]，就是求1到100之间没有含有62和4的数的个数。</span></div>\r\n<div>\r\n<p><span style=\"font-family: 黑体; font-size: 16px;\">首先说它是DP，倒不如说是深搜套一个记忆化的壳。在深搜之前，需要把数拆成数组，然后我们记录取到第k位，要取之后的n-k个数的方案数（不考虑是否超过范围），以及取到这一位的状态（视题意而定）。深搜的过程中，要传下下面几个参数：k、if6、limit，分别代表取到第几位，目前的状态，数的上界。</span></p>\r\n<p><span style=\"font-family: 黑体; font-size: 16px;\">以下就是我的代码：</span></p>\r\n<p>&nbsp;</p>\r\n<div class=\"cnblogs_code\"><div class=\"cnblogs_code_toolbar\"><span class=\"cnblogs_code_copy\"><a href=\"javascript:void(0);\"  title=\"复制代码\"></span></div>\r\n<pre><span style=\"color: #008080;\"> 1</span> #include&lt;stdio.h&gt;\r\n<span style=\"color: #008080;\"> 2</span> #inclufe&lt;<span style=\"color: #0000ff;\">string</span>.h&gt;<span style=\"color: #000000;\">;\r\n</span><span style=\"color: #008080;\"> 3</span> <span style=\"color: #0000ff;\">int</span> dp[<span style=\"color: #800080;\">20</span>][<span style=\"color: #800080;\">2</span><span style=\"color: #000000;\">];\r\n</span><span style=\"color: #008080;\"> 4</span> <span style=\"color: #0000ff;\">int</span> shu[<span style=\"color: #800080;\">20</span><span style=\"color: #000000;\">];\r\n</span><span style=\"color: #008080;\"> 5</span> <span style=\"color: #0000ff;\">int</span><span style=\"color: #000000;\"> n,m;\r\n</span><span style=\"color: #008080;\"> 6</span> <span style=\"color: #0000ff;\">int</span> dfs(<span style=\"color: #0000ff;\">int</span> len,<span style=\"color: #0000ff;\">bool</span> if6,<span style=\"color: #0000ff;\">bool</span> limit)<span style=\"color: #008000;\">//</span><span style=\"color: #008000;\">if6=&gt;上一位是否为6      limit=&gt;它的上一位是否为上界    len表示num的位数</span>\r\n<span style=\"color: #008080;\"> 7</span> <span style=\"color: #000000;\">{\r\n</span><span style=\"color: #008080;\"> 8</span>     <span style=\"color: #0000ff;\">if</span>(len==<span style=\"color: #800080;\">0</span>)　　　　　　　　　　　　　<span style=\"color: #008000;\">//</span><span style=\"color: #008000;\">当len=1是边界，所以在len=0时，return</span>\r\n<span style=\"color: #008080;\"> 9</span>     <span style=\"color: #0000ff;\">return</span> <span style=\"color: #800080;\">1</span><span style=\"color: #000000;\">;\r\n</span><span style=\"color: #008080;\">10</span>     <span style=\"color: #0000ff;\">if</span>(!limit &amp;&amp;<span style=\"color: #000000;\"> dp[len][if6])            \r\n</span><span style=\"color: #008080;\">11</span>     <span style=\"color: #0000ff;\">return</span><span style=\"color: #000000;\"> dp[len][if6];　　　　\r\n</span><span style=\"color: #008080;\">12</span>     <span style=\"color: #0000ff;\">int</span> sum=<span style=\"color: #800080;\">0</span>;              <span style=\"color: #008000;\">//</span><span style=\"color: #008000;\">没有62和4的数量 </span>\r\n<span style=\"color: #008080;\">13</span>     <span style=\"color: #0000ff;\">int</span> max=(limit?shu[len]:<span style=\"color: #800080;\">9</span><span style=\"color: #000000;\">);\r\n</span><span style=\"color: #008080;\">14</span>     <span style=\"color: #0000ff;\">for</span>(<span style=\"color: #0000ff;\">int</span> i=<span style=\"color: #800080;\">0</span>;i&lt;=max;i++<span style=\"color: #000000;\">)\r\n</span><span style=\"color: #008080;\">15</span> <span style=\"color: #000000;\">    {\r\n</span><span style=\"color: #008080;\">16</span>         <span style=\"color: #0000ff;\">if</span>((if6&amp;&amp;i==<span style=\"color: #800080;\">2</span>)||i==<span style=\"color: #800080;\">4</span>)<span style=\"color: #008000;\">//</span><span style=\"color: #008000;\">剪枝    减去62和4的那一枝 </span>\r\n<span style=\"color: #008080;\">17</span>         <span style=\"color: #0000ff;\">continue</span><span style=\"color: #000000;\">;\r\n</span><span style=\"color: #008080;\">18</span>        sum+=dfs(len-<span style=\"color: #800080;\">1</span>,i==<span style=\"color: #800080;\">6</span>,limit&amp;&amp;i==<span style=\"color: #000000;\">max);\r\n</span><span style=\"color: #008080;\">19</span> <span style=\"color: #000000;\">    }\r\n</span><span style=\"color: #008080;\">20</span>     <span style=\"color: #0000ff;\">if</span>(!<span style=\"color: #000000;\">limit)\r\n</span><span style=\"color: #008080;\">21</span>     dp[len][if6]=sum;　　　　　<span style=\"color: #008000;\">//</span><span style=\"color: #008000;\">这里对应上面的记忆化，在一定条件下下时记录，保证一致性。</span>\r\n<span style=\"color: #008080;\">22</span>     <span style=\"color: #0000ff;\">return</span><span style=\"color: #000000;\"> sum;\r\n</span><span style=\"color: #008080;\">23</span> <span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">24</span> <span style=\"color: #0000ff;\">int</span> solve(<span style=\"color: #0000ff;\">int</span> num)　　　　　　<span style=\"color: #008000;\">//</span><span style=\"color: #008000;\">将num的数位分开来</span>\r\n<span style=\"color: #008080;\">25</span> <span style=\"color: #000000;\">{    \r\n</span><span style=\"color: #008080;\">26</span>     memset(shu,<span style=\"color: #800080;\">0</span>,<span style=\"color: #0000ff;\">sizeof</span><span style=\"color: #000000;\">(shu));\r\n</span><span style=\"color: #008080;\">27</span>     <span style=\"color: #0000ff;\">int</span> k=<span style=\"color: #800080;\">0</span><span style=\"color: #000000;\">;\r\n</span><span style=\"color: #008080;\">28</span>     <span style=\"color: #0000ff;\">while</span><span style=\"color: #000000;\">(num)\r\n</span><span style=\"color: #008080;\">29</span> <span style=\"color: #000000;\">    {\r\n</span><span style=\"color: #008080;\">30</span>         shu[++k]=num%<span style=\"color: #800080;\">10</span><span style=\"color: #000000;\">;\r\n</span><span style=\"color: #008080;\">31</span>         num/=<span style=\"color: #800080;\">10</span><span style=\"color: #000000;\">;\r\n</span><span style=\"color: #008080;\">32</span> <span style=\"color: #000000;\">    }\r\n</span><span style=\"color: #008080;\">33</span>     <span style=\"color: #0000ff;\">return</span> dfs(k,<span style=\"color: #0000ff;\">false</span>,<span style=\"color: #0000ff;\">true</span><span style=\"color: #000000;\">);\r\n</span><span style=\"color: #008080;\">34</span> <span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">35</span> <span style=\"color: #0000ff;\">int</span><span style=\"color: #000000;\"> main()\r\n</span><span style=\"color: #008080;\">36</span> <span style=\"color: #000000;\">{\r\n</span><span style=\"color: #008080;\">37</span>    <span style=\"color: #0000ff;\">while</span>(scanf(<span style=\"color: #800000;\">\"</span><span style=\"color: #800000;\">%d%d</span><span style=\"color: #800000;\">\"</span>,&amp;n,&amp;m)!=<span style=\"color: #000000;\">EOF)\r\n</span><span style=\"color: #008080;\">38</span> <span style=\"color: #000000;\">    {\r\n</span><span style=\"color: #008080;\">39</span>            memset(dp,<span style=\"color: #800080;\">0</span>,<span style=\"color: #0000ff;\">sizeof</span><span style=\"color: #000000;\">(dp));\r\n</span><span style=\"color: #008080;\">40</span>         <span style=\"color: #0000ff;\">if</span>(n==<span style=\"color: #800080;\">0</span>&amp;&amp;m==<span style=\"color: #800080;\">0</span><span style=\"color: #000000;\">)\r\n</span><span style=\"color: #008080;\">41</span>         <span style=\"color: #0000ff;\">return</span> <span style=\"color: #800080;\">0</span><span style=\"color: #000000;\">;\r\n</span><span style=\"color: #008080;\">42</span>         <span style=\"color: #0000ff;\">int</span><span style=\"color: #000000;\"> ans;\r\n</span><span style=\"color: #008080;\">43</span>         ans=solve(m)-solve(n-<span style=\"color: #800080;\">1</span>);<span style=\"color: #008000;\">//</span><span style=\"color: #008000;\">因为是取[n,m]内的数，所以只需要减去[0,n-1]内的数 </span>\r\n<span style=\"color: #008080;\">44</span>         printf(<span style=\"color: #800000;\">\"</span><span style=\"color: #800000;\">%d\\n</span><span style=\"color: #800000;\">\"</span><span style=\"color: #000000;\">,ans);\r\n</span><span style=\"color: #008080;\">45</span> <span style=\"color: #000000;\">    }\r\n</span><span style=\"color: #008080;\">46</span>      <span style=\"color: #0000ff;\">return</span> <span style=\"color: #800080;\">0</span><span style=\"color: #000000;\">;\r\n</span><span style=\"color: #008080;\">47</span> } </pre>\r\n<div class=\"cnblogs_code_toolbar\"><span class=\"cnblogs_code_copy\"><a href=\"javascript:void(0);\"  title=\"复制代码\"></span></div></div>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n<div>&nbsp;</div>\r\n</div></div>', '0', '1', '0', '1', '1');
INSERT INTO `blog_article` VALUES ('2', '自制操作系统Antz(15)——实现启动界面', 'AntzScript', '2019-03-25 15:01:33.728555', '<div class=\"post\">\r\n		<h1 class=\"postTitle\">\r\n			<a id=\"cb_post_title_url\" class=\"postTitle2\" href=\"https://www.cnblogs.com/zzqit/p/10610570.html\">Django实现单用户登录</a>\r\n		</h1>\r\n		<div class=\"clear\"></div>\r\n		<div class=\"postBody\">\r\n			<div id=\"cnblogs_post_body\" class=\"blogpost-body\"><a name=\"_labelTop\"></a><div id=\"navCategory\"><p style=\"font-size:18px\"><b>目录</b></p><ul><li><a href=\"#_label0\">单用户登录实现</a></li></ul></div><p>&nbsp;</p><p style=\"font-size:18px\"><b>正文</b></p><p><span style=\"font-size: 15px;\">最近由于要毕业了写论文做毕设，然后还在实习发现已经好久都没有写博客了。今天由于工作需求，需要用Django实现单用户登录。大概意思就是跟QQ一样的效果，每个账号只能一个地方登录使用，限制账号的登录次数。由于用的是Django自带的认证，然后校验用户是否登录其实就是通过Session实现的。下面就简单分享一下怎么实现的吧。</span></p>\r\n<div style=\"text-align: right\"><a href=\"#_labelTop\">回到顶部</a><a name=\"_label0\"></a></div><h2><span style=\"font-size: 18pt;\"><strong>单用户登录实现</strong></span></h2>\r\n<p><span style=\"font-size: 15px;\">在做用户登录认证的时候Django自带的有is_authenticated()方法。下面就是一个简单的认证过程。</span></p>\r\n<p>&nbsp;</p>\r\n<div class=\"cnblogs_code\">\r\n<pre><span style=\"font-size: 14px;\"><span style=\"color: #0000ff;\">if</span> request.user.is_authenticated():  <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 判断是否登录</span>\r\n    <span style=\"color: #0000ff;\">return</span> redirect(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">/index/</span><span style=\"color: #800000;\">\'</span><span style=\"color: #000000;\">)\r\n</span><span style=\"color: #0000ff;\">else</span><span style=\"color: #000000;\">：\r\n    </span><span style=\"color: #0000ff;\">return</span> redirect(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">/accounts/login/</span><span style=\"color: #800000;\">\'</span>)</span></pre>\r\n</div>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 15px;\">现在步入正题，讲一下具体实现流程吧。我们在做用户登录的时候一般会扩展Django自带的User表，当然方法一般有几种，你可以继承AbstractUser表然后写入自己想要的字段，还可以单独建个表然后跟User表建立一对一的关系，具体的实现这里就不多加描述了。</span></p>\r\n<p><span style=\"font-size: 15px;\">我才用的是单独建立一个用户信息表于User表进行一对一关联，在用户表里面增加一个session_key字段用于存最新用户登录的session_key。每次我们登录就取出这个值进行判断，如果里面没有值，表示用户没有登录就可以走正常的登录流程。如果里面有值，说明代表的是前面用户登录留下的session_key，我们就先在Session表里面删除掉这个记录，让上一个登录用户的Session失效，然后登录的时候再把最新登录生成的session_key更新到用户信息表里面，用作下一个校验。这样就能简单快捷的实现Django的单用户登录了。</span></p>\r\n<p><span style=\"font-size: 15px;\">核心代码截图：</span></p>\r\n<p><span style=\"font-size: 15px;\"><img src=\"https://img2018.cnblogs.com/blog/1408936/201903/1408936-20190327204407721-657244675.png\" alt=\"\"></span></p>\r\n<p><span style=\"font-size: 15px;\">具体实现代码如下：</span></p>\r\n<div class=\"cnblogs_code\"><div class=\"cnblogs_code_toolbar\"><span class=\"cnblogs_code_copy\"><a href=\"javascript:void(0);\" onclick=\"copyCnblogsCode(this)\" title=\"复制代码\"><img src=\"//common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\"></a></span></div>\r\n<pre><span style=\"font-size: 14px;\"><span style=\"color: #0000ff;\">from</span> django.shortcuts <span style=\"color: #0000ff;\">import</span><span style=\"color: #000000;\"> redirect\r\n</span><span style=\"color: #0000ff;\">from</span> django.views.decorators.cache <span style=\"color: #0000ff;\">import</span><span style=\"color: #000000;\"> never_cache\r\n</span><span style=\"color: #0000ff;\">from</span> django.views.decorators.csrf <span style=\"color: #0000ff;\">import</span><span style=\"color: #000000;\"> csrf_exempt\r\n</span><span style=\"color: #0000ff;\">from</span> django.contrib.auth <span style=\"color: #0000ff;\">import</span><span style=\"color: #000000;\"> login as auth_login, authenticate\r\n</span><span style=\"color: #0000ff;\">from</span> app01.models <span style=\"color: #0000ff;\">import</span> UCenter  <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 用户信息表</span>\r\n<span style=\"color: #000000;\">\r\n\r\n@csrf_exempt\r\n@never_cache\r\n</span><span style=\"color: #0000ff;\">def</span><span style=\"color: #000000;\"> login(request):\r\n    </span><span style=\"color: #0000ff;\">if</span><span style=\"color: #000000;\"> request.user.is_authenticated():\r\n        </span><span style=\"color: #0000ff;\">return</span> redirect(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">/index/</span><span style=\"color: #800000;\">\'</span><span style=\"color: #000000;\">)\r\n    </span><span style=\"color: #0000ff;\">else</span><span style=\"color: #000000;\">:\r\n        </span><span style=\"color: #0000ff;\">if</span> request.method == <span style=\"color: #800000;\">\"</span><span style=\"color: #800000;\">POST</span><span style=\"color: #800000;\">\"</span><span style=\"color: #000000;\">:\r\n            username </span>= request.POST.get(<span style=\"color: #800000;\">\"</span><span style=\"color: #800000;\">username</span><span style=\"color: #800000;\">\"</span><span style=\"color: #000000;\">)\r\n            password </span>= request.POST.get(<span style=\"color: #800000;\">\"</span><span style=\"color: #800000;\">password</span><span style=\"color: #800000;\">\"</span><span style=\"color: #000000;\">)\r\n            authenticated_user </span>= authenticate(username=username, password=<span style=\"color: #000000;\">password)\r\n            </span><span style=\"color: #0000ff;\">if</span><span style=\"color: #000000;\"> authenticated_user:\r\n                \r\n                </span><span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 单用户登录</span>\r\n                user_obj = UCenter.objects.filter(userid=authenticated_user)  <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 找到登录的user对象</span>\r\n                is_session_key = user_obj.first().session_key  <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 获取登录对象的session_key</span>\r\n                <span style=\"color: #0000ff;\">if</span> is_session_key:  <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 用户已登录</span>\r\n                    request.session.delete(is_session_key)  <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 删除登录前面登录用户的session_key</span>\r\n                auth_login(request, authenticated_user)  <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 用户信息存入session</span>\r\n                user_obj.update(session_key=request.session.session_key)  <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 更新新登录user的session_key</span>\r\n                <span style=\"color: #0000ff;\">return</span> redirect(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">/index/</span><span style=\"color: #800000;\">\'</span><span style=\"color: #000000;\">)\r\n            </span><span style=\"color: #0000ff;\">else</span><span style=\"color: #000000;\">:\r\n                </span><span style=\"color: #0000ff;\">return</span> redirect(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">/accounts/login/</span><span style=\"color: #800000;\">\'</span>)</span></pre>\r\n<div class=\"cnblogs_code_toolbar\"><span class=\"cnblogs_code_copy\"><a href=\"javascript:void(0);\" onclick=\"copyCnblogsCode(this)\" title=\"复制代码\"><img src=\"//common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\"></a></span></div></div>\r\n<p><span style=\"font-size: 15px;\">当然还有一些其他的实现方法，根据自己需求场景选择吧。其他的解决方法<a href=\"http://stackoverflow.com/questions/8927327/allowing-only-single-active-session-per-user-in%20-django-APP\" target=\"_blank\">http://stackoverflow.com/questions/8927327/allowing-only-single-active-session-per-user-in -django-APP</a>，<a href=\"http://stackoverflow.com/questions/953879/how-to-force-user%20-logout-in-django%20–%20Chewie\" target=\"_blank\">http://stackoverflow.com/questions/953879/how-to-force-user -logout-in-django –</a></span><span class=\"text-secondary\"><small><span style=\"font-size: 15px;\"><a href=\"http://stackoverflow.com/questions/953879/how-to-force-user%20-logout-in-django%20–%20Chewie\" target=\"_blank\">Chewie</a>，<a href=\"http://stackoverflow.com/questions/821870/how-can-i-detect-multiple-logins-into-a-django-web-application-from-different-lo\" target=\"_blank\">http://stackoverflow.com/questions/821870/how-can-i-detect-multiple-logins-into-a-django-web-application-from-different-lo</a>希望这些对你能够有帮助。</span></small></span></p>\r\n<p>&nbsp;</p></div><div id=\"MySignature\"></div>\r\n<div class=\"clear\"></div>\r\n<div id=\"blog_post_info_block\">\r\n<div id=\"BlogPostCategory\">分类: <a href=\"https://www.cnblogs.com/zzqit/category/1233683.html\" target=\"_blank\">django基础</a></div>\r\n<div id=\"EntryTag\"></div>\r\n<div id=\"blog_post_info\"><div id=\"green_channel\">\r\n        <a href=\"javascript:void(0);\" id=\"green_channel_digg\" onclick=\"DiggIt(10610570,cb_blogId,1);green_channel_success(this,\'谢谢推荐！\');\">好文要顶</a>\r\n            <a id=\"green_channel_follow\" onclick=\"follow(\'c72e0c6e-d715-4168-02a0-08d5c25957a7\');\" href=\"javascript:void(0);\">关注我</a>\r\n    <a id=\"green_channel_favorite\" onclick=\"AddToWz(cb_entryId);return false;\" href=\"javascript:void(0);\">收藏该文</a>\r\n    <a id=\"green_channel_weibo\" href=\"javascript:void(0);\" title=\"分享至新浪微博\" onclick=\"ShareToTsina()\"><img src=\"//common.cnblogs.com/images/icon_weibo_24.png\" alt=\"\"></a>\r\n    <a id=\"green_channel_wechat\" href=\"javascript:void(0);\" title=\"分享至微信\" onclick=\"shareOnWechat()\"><img src=\"//common.cnblogs.com/images/wechat.png\" alt=\"\"></a>\r\n</div>\r\n<div id=\"author_profile\">\r\n    <div id=\"author_profile_info\" class=\"author_profile_info\">\r\n            <a href=\"http://home.cnblogs.com/u/zzqit/\" target=\"_blank\"><img src=\"//pic.cnblogs.com/face/1408936/20180526101951.png\" class=\"author_avatar\" alt=\"\"></a>\r\n        <div id=\"author_profile_detail\" class=\"author_profile_info\">\r\n            <a href=\"http://home.cnblogs.com/u/zzqit/\">如何好听</a><br>\r\n            <a href=\"http://home.cnblogs.com/u/zzqit/followees\">关注 - 0</a><br>\r\n            <a href=\"http://home.cnblogs.com/u/zzqit/followers\">粉丝 - 13</a>\r\n        </div>\r\n    </div>\r\n    <div class=\"clear\"></div>\r\n    <div id=\"author_profile_honor\"></div>\r\n    <div id=\"author_profile_follow\">\r\n                <a href=\"javascript:void(0);\" onclick=\"follow(\'c72e0c6e-d715-4168-02a0-08d5c25957a7\');return false;\">+加关注</a>\r\n    </div>\r\n</div>\r\n<div id=\"div_digg\">\r\n    <div class=\"diggit\" onclick=\"votePost(10610570,\'Digg\')\">\r\n        <span class=\"diggnum\" id=\"digg_count\">0</span>\r\n    </div>\r\n    <div class=\"buryit\" onclick=\"votePost(10610570,\'Bury\')\">\r\n        <span class=\"burynum\" id=\"bury_count\">0</span>\r\n    </div>\r\n    <div class=\"clear\"></div>\r\n    <div class=\"diggword\" id=\"digg_tips\">\r\n    </div>\r\n</div>\r\n<script type=\"text/javascript\">\r\n    currentDiggType = 0;\r\n</script></div>\r\n<div class=\"clear\"></div>\r\n<div id=\"post_next_prev\"><a href=\"https://www.cnblogs.com/zzqit/p/10295265.html\" class=\"p_n_p_prefix\">« </a> 上一篇：<a href=\"https://www.cnblogs.com/zzqit/p/10295265.html\" title=\"发布于2019-01-20 16:19\">Jenkins安装部署</a><br></div>\r\n</div>\r\n\r\n\r\n		</div>\r\n		<div class=\"postDesc\">posted @ <span id=\"post-date\">2019-03-27 20:42</span> <a href=\"https://www.cnblogs.com/zzqit/\">如何好听</a> 阅读(<span id=\"post_view_count\">28</span>) 评论(<span id=\"post_comment_count\">0</span>)  <a href=\"https://i.cnblogs.com/EditPosts.aspx?postid=10610570\" rel=\"nofollow\">编辑</a> <a href=\"#\" onclick=\"AddToWz(10610570);return false;\">收藏</a></div>\r\n	</div>', '0', '0', '0', '1', '9');
INSERT INTO `blog_article` VALUES ('3', 'HashMap源码分析', '本文按以下顺序叙述: \"HashMap的感性认识.\" \"官方文档中对HashMap介绍的解读.\" \"到源码中看看HashMap这些特性到底是如何实现的.\" 把源码啃下来有一种很爽的感觉, 相信你读完后也能体会到~ 如发现有误, 欢迎指出.   在开始之前, 先通过图例对HashMap建立感 ...', '2019-03-25 15:02:12.665079', '...', '0', '0', '0', '2', '9');
INSERT INTO `blog_article` VALUES ('4', '给急着找工作的人一些建议，别在被骗了！', '记住，薪资和能力成正比，要想拿高薪，就得提升自我业务水平！唯此一条能帮你的。 关注公众号「**Python专栏**」，后台回复「**腾讯架构资源1**」，获取由腾讯架构师整理的大数据学习全套资源包！ ...', '2019-03-26 12:43:51.591095', '...', '0', '0', '0', '1', '1');
INSERT INTO `blog_article` VALUES ('5', 'Spring Boot 解决方案 - JUnit 测试', '简单的 JUnit 项目 回顾一下创建并运行简单的 JUnit 测试项目，先添加 JUnit 依赖然后编写类似如下模板的测试类，使用 IDE 的话直接用插件运行就行， 使用 Maven 的话运行命令 就能看到测试结果。 执行顺序 为满足一些测试对环境的要求，例如数据库连接及关闭，JUnit 提供了一 ...', '2019-03-26 12:44:17.619862', '...', '0', '0', '0', '2', '1');
INSERT INTO `blog_article` VALUES ('6', 'Thermostat：双层存储结构的透明巨页内存管理机制', '这是一篇由密歇根大学的Neha Agarwal 和 Thomas F. Wenisch，发表在计算机系统顶会ASLOS的论文，Thermostat: Application-transparent Page Management for Two-tiered Main Memory。一种双层存储结构 ...', '2019-03-26 21:25:53.836360', '。。。', '0', '0', '0', '5', '11');
INSERT INTO `blog_article` VALUES ('7', 'WPF InkCanvas 毛笔效果', '首先贴出本文参考学习的文章吧。 https://www.cnblogs.com/LCHL/p/9055642.html 4206298 感谢这位懒羊羊的代码和讲解（下简称羊博主），我在此基础上稍微加了一些东西，希望能使书写效果得到更好的提升吧。建议先从羊博主的博文看起。 前文 本文致力于解决羊博主的 ...', '2019-03-26 21:26:23.095799', '...', '0', '0', '0', '4', '11');
INSERT INTO `blog_article` VALUES ('8', '八大排序算法——快速排序（动图演示 思路分析 实例代码Java 复杂度分析）', '一、动图演示 二、思路分析 快速排序的思想就是，选一个数作为基数（这里我选的是第一个数），大于这个基数的放到右边，小于这个基数的放到左边，等于这个基数的数可以放到左边或右边，看自己习惯，这里我是放到了左边， 一趟结束后，将基数放到中间分隔的位置，第二趟将数组从基数的位置分成两半，分割后的两个的数组继 ...', '2019-03-26 21:26:43.414680', '...', '0', '0', '0', '3', '11');
INSERT INTO `blog_article` VALUES ('9', 'MongoDB+php7搭建', '0x00前言： 今天一位非计算机专业的朋友问我怎么打开.bson文件，我第一反应.bson文件是什么，网上查了下是mongodb的传输文件。也就是类似于mysql的.sql文件一样 之前看过mongodb的注入，但是没有亲自实践，这次一并从环境搭建开始学习了波mongodb 0x01 mongodb ...', '2019-03-26 21:27:09.894664', '...', '0', '0', '0', '5', '11');
INSERT INTO `blog_article` VALUES ('10', 'Cobbler图文详解安装及遇到的问题说明', '一、介绍 Cobbler是一个使用Python开发的开源项目，通过将部署系统所涉及的所有服务集中在一起，来提供一个全自动批量快速建立linux系统的网络环境， Cobbler提供了DHCP管理，YUM管理，电源管理等功能，除此之外还支持命令行管理，WEB界面管理，cobbler相关软件包由EPEL源 ...', '2019-03-26 21:27:29.479027', '...', '0', '0', '0', '5', '11');
INSERT INTO `blog_article` VALUES ('11', 'MongoDB学习（管理数据库和集合）', '管理数据库 显示数据库列表 切换到其他数据库 创建数据库 MongoDB没有提供显式的创建数据库的MongoDB shell命令。数据库是在添加集合或用户时隐式地创建的。 可使用use database_name命令创建数据库。但只有添加了至少一个文档，才可真正创建完一个数据库。 删除数据库 在Mo ...', '2019-03-26 21:27:49.518569', '...', '0', '0', '0', '5', '11');

-- ----------------------------
-- Table structure for `blog_article2tag`
-- ----------------------------
DROP TABLE IF EXISTS `blog_article2tag`;
CREATE TABLE `blog_article2tag` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `blog_article2tag_article_id_tag_id_b0745f42_uniq` (`article_id`,`tag_id`),
  KEY `blog_article2tag_tag_id_389b9a96_fk_blog_tag_nid` (`tag_id`),
  CONSTRAINT `blog_article2tag_article_id_753a2b60_fk_blog_article_nid` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`nid`),
  CONSTRAINT `blog_article2tag_tag_id_389b9a96_fk_blog_tag_nid` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article2tag
-- ----------------------------
INSERT INTO `blog_article2tag` VALUES ('1', '1', '1');
INSERT INTO `blog_article2tag` VALUES ('2', '2', '1');
INSERT INTO `blog_article2tag` VALUES ('3', '3', '2');
INSERT INTO `blog_article2tag` VALUES ('9', '6', '4');
INSERT INTO `blog_article2tag` VALUES ('8', '7', '4');
INSERT INTO `blog_article2tag` VALUES ('7', '8', '4');
INSERT INTO `blog_article2tag` VALUES ('6', '9', '4');
INSERT INTO `blog_article2tag` VALUES ('5', '10', '3');
INSERT INTO `blog_article2tag` VALUES ('4', '11', '3');

-- ----------------------------
-- Table structure for `blog_articleupdown`
-- ----------------------------
DROP TABLE IF EXISTS `blog_articleupdown`;
CREATE TABLE `blog_articleupdown` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `is_up` tinyint(1) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `blog_articleupdown_article_id_user_id_fa3d0c08_uniq` (`article_id`,`user_id`),
  KEY `blog_articleupdown_user_id_2c0ebe49_fk_blog_userinfo_nid` (`user_id`),
  CONSTRAINT `blog_articleupdown_article_id_9be1a8a2_fk_blog_article_nid` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`nid`),
  CONSTRAINT `blog_articleupdown_user_id_2c0ebe49_fk_blog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `blog_userinfo` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_articleupdown
-- ----------------------------
INSERT INTO `blog_articleupdown` VALUES ('11', '1', '1', '1');

-- ----------------------------
-- Table structure for `blog_blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog_blog`;
CREATE TABLE `blog_blog` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `site_name` varchar(64) NOT NULL,
  `theme` varchar(32) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_blog
-- ----------------------------
INSERT INTO `blog_blog` VALUES ('1', '草榴社区', 'alex', 'alex.css');
INSERT INTO `blog_blog` VALUES ('2', 'yuan的博客', 'yuan', 'yuan.css');
INSERT INTO `blog_blog` VALUES ('3', 'irving的个人博客', 'irving', 'irving.css');

-- ----------------------------
-- Table structure for `blog_category`
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `blog_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`),
  KEY `blog_category_blog_id_80f0723a_fk_blog_blog_nid` (`blog_id`),
  CONSTRAINT `blog_category_blog_id_80f0723a_fk_blog_blog_nid` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES ('1', 'java', '1');
INSERT INTO `blog_category` VALUES ('2', 'map', '2');
INSERT INTO `blog_category` VALUES ('3', 'django', '3');
INSERT INTO `blog_category` VALUES ('4', 'web', '3');
INSERT INTO `blog_category` VALUES ('5', 'linux', '3');

-- ----------------------------
-- Table structure for `blog_comment`
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `content` varchar(255) NOT NULL,
  `article_id` int(11) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`),
  KEY `blog_comment_article_id_3d58bca6_fk_blog_article_nid` (`article_id`),
  KEY `blog_comment_parent_comment_id_26791b9a_fk_blog_comment_nid` (`parent_comment_id`),
  KEY `blog_comment_user_id_59a54155_fk_blog_userinfo_nid` (`user_id`),
  CONSTRAINT `blog_comment_article_id_3d58bca6_fk_blog_article_nid` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`nid`),
  CONSTRAINT `blog_comment_parent_comment_id_26791b9a_fk_blog_comment_nid` FOREIGN KEY (`parent_comment_id`) REFERENCES `blog_comment` (`nid`),
  CONSTRAINT `blog_comment_user_id_59a54155_fk_blog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `blog_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `blog_tag`
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `blog_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`),
  KEY `blog_tag_blog_id_a8c60c42_fk_blog_blog_nid` (`blog_id`),
  CONSTRAINT `blog_tag_blog_id_a8c60c42_fk_blog_blog_nid` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES ('1', 'IT', '1');
INSERT INTO `blog_tag` VALUES ('2', 'Av', '2');
INSERT INTO `blog_tag` VALUES ('3', 'study', '3');
INSERT INTO `blog_tag` VALUES ('4', 'luffy', '3');

-- ----------------------------
-- Table structure for `blog_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `blog_userinfo`;
CREATE TABLE `blog_userinfo` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `telephone` varchar(11) DEFAULT NULL,
  `avator` varchar(100) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `telephone` (`telephone`),
  UNIQUE KEY `blog_id` (`blog_id`),
  CONSTRAINT `blog_userinfo_blog_id_aa34488f_fk_blog_blog_nid` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_userinfo
-- ----------------------------
INSERT INTO `blog_userinfo` VALUES ('pbkdf2_sha256$120000$m0o19FPB1hvt$JSeOE84kJQCmnhIFMHnrZCwtkcYxIJ0LJCp6aqNiIcg=', '2019-03-27 21:26:14.256810', '1', 'alex', '', '', '', '1', '1', '2019-03-24 09:40:00.847412', '1', null, '/avatars/default.png', '2019-03-24 09:40:00.935357', '1');
INSERT INTO `blog_userinfo` VALUES ('pbkdf2_sha256$120000$OW3ntozI758v$xrUN1p32BJOpAd4yj1S97UAiZK2IXXSSpCyPwZWCU/M=', null, '0', 'egon', '', '', 'test@example.com', '0', '1', '2019-03-25 13:06:44.660612', '9', null, 'avatars/namei.jpg', '2019-03-25 13:06:44.754545', '2');
INSERT INTO `blog_userinfo` VALUES ('pbkdf2_sha256$120000$5JbB6HLu4LDi$PjKTDO+/MpU1hMea756mjBU7SDNoXKvJzpEd3b14fnA=', null, '0', 'alex1', '', '', 'test@example.com', '0', '1', '2019-03-25 13:09:29.043782', '10', null, '/avatars/default.png', '2019-03-25 13:09:29.129717', null);
INSERT INTO `blog_userinfo` VALUES ('pbkdf2_sha256$120000$wietyOVtYOzK$EVKDkFb/GsazAauybB8FTRIP1sA1ap5CSZtOFiqv7n8=', '2019-03-26 21:40:38.871421', '1', 'irving', '', '', 'test@example.com', '0', '1', '2019-03-26 21:23:23.000000', '11', '15676782500', '/avatars/default.png', '2019-03-26 21:24:37.789850', '3');

-- ----------------------------
-- Table structure for `blog_userinfo_groups`
-- ----------------------------
DROP TABLE IF EXISTS `blog_userinfo_groups`;
CREATE TABLE `blog_userinfo_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_userinfo_groups_userinfo_id_group_id_5f60ecec_uniq` (`userinfo_id`,`group_id`),
  KEY `blog_userinfo_groups_group_id_1fb5e93a_fk_auth_group_id` (`group_id`),
  CONSTRAINT `blog_userinfo_groups_group_id_1fb5e93a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `blog_userinfo_groups_userinfo_id_f6f0498b_fk_blog_userinfo_nid` FOREIGN KEY (`userinfo_id`) REFERENCES `blog_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_userinfo_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `blog_userinfo_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `blog_userinfo_user_permissions`;
CREATE TABLE `blog_userinfo_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_userinfo_user_permi_userinfo_id_permission_i_7d343093_uniq` (`userinfo_id`,`permission_id`),
  KEY `blog_userinfo_user_p_permission_id_ace80f7e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `blog_userinfo_user_p_permission_id_ace80f7e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `blog_userinfo_user_p_userinfo_id_57e76697_fk_blog_user` FOREIGN KEY (`userinfo_id`) REFERENCES `blog_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_userinfo_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_blog_userinfo_nid` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_blog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `blog_userinfo` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2019-03-25 14:56:09.629245', '1', '草榴社区', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2019-03-25 14:56:29.519506', '2', 'yuan的博客', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2019-03-25 15:01:08.048382', '1', 'java', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2019-03-25 15:01:09.863513', '1', 'JavaIO流中的拷贝', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2019-03-25 15:01:33.732553', '2', '自制操作系统Antz(15)——实现启动界面', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2019-03-25 15:02:01.152237', '2', 'map', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2019-03-25 15:02:12.665079', '3', 'HashMap源码分析', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2019-03-25 15:24:59.047098', '2', '自制操作系统Antz(15)——实现启动界面', '2', '[{\"changed\": {\"fields\": [\"desc\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2019-03-25 15:46:01.117351', '2', '自制操作系统Antz(15)——实现启动界面', '2', '[{\"changed\": {\"fields\": [\"desc\", \"user\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2019-03-26 12:43:51.592093', '4', '给急着找工作的人一些建议，别在被骗了！', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2019-03-26 12:44:17.620862', '5', 'Spring Boot 解决方案 - JUnit 测试', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2019-03-26 21:24:34.493148', '3', 'irving的个人博客', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2019-03-26 21:24:37.796844', '11', 'irving', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2019-03-26 21:25:30.522962', '3', 'django', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2019-03-26 21:25:39.190945', '4', 'web', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2019-03-26 21:25:48.308920', '5', 'linux', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2019-03-26 21:25:53.837361', '6', 'Thermostat：双层存储结构的透明巨页内存管理机制', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2019-03-26 21:26:23.097798', '7', 'WPF InkCanvas 毛笔效果', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2019-03-26 21:26:43.416679', '8', '八大排序算法——快速排序（动图演示 思路分析 实例代码Java 复杂度分析）', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2019-03-26 21:27:09.894664', '9', 'MongoDB+php7搭建', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2019-03-26 21:27:29.480027', '10', 'Cobbler图文详解安装及遇到的问题说明', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2019-03-26 21:27:49.520565', '11', 'MongoDB学习（管理数据库和集合）', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2019-03-26 21:28:27.071895', '3', 'study', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2019-03-26 21:28:36.666880', '4', 'luffy', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2019-03-26 21:29:00.041202', '4', 'MongoDB学习（管理数据库和集合）---study', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2019-03-26 21:29:07.601093', '5', 'Cobbler图文详解安装及遇到的问题说明---study', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2019-03-26 21:29:13.185053', '6', 'MongoDB+php7搭建---luffy', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2019-03-26 21:29:18.757519', '7', '八大排序算法——快速排序（动图演示 思路分析 实例代码Java 复杂度分析）---luffy', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2019-03-26 21:29:23.962206', '8', 'WPF InkCanvas 毛笔效果---luffy', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2019-03-26 21:29:31.169976', '9', 'Thermostat：双层存储结构的透明巨页内存管理机制---luffy', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2019-03-27 21:26:50.809873', '1', 'JavaIO流中的拷贝', '2', '[{\"changed\": {\"fields\": [\"content\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2019-03-27 21:27:14.215535', '2', '自制操作系统Antz(15)——实现启动界面', '2', '[{\"changed\": {\"fields\": [\"content\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2019-03-27 21:55:59.762546', '1', 'JavaIO流中的拷贝', '2', '[{\"changed\": {\"fields\": [\"content\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2019-03-27 22:41:07.787848', '1', 'JavaIO流中的拷贝', '2', '[{\"changed\": {\"fields\": [\"content\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2019-03-27 22:53:22.359658', '1', 'JavaIO流中的拷贝', '2', '[{\"changed\": {\"fields\": [\"content\"]}}]', '8', '1');

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('8', 'blog', 'article');
INSERT INTO `django_content_type` VALUES ('12', 'blog', 'article2tag');
INSERT INTO `django_content_type` VALUES ('7', 'blog', 'articleupdown');
INSERT INTO `django_content_type` VALUES ('6', 'blog', 'blog');
INSERT INTO `django_content_type` VALUES ('13', 'blog', 'category');
INSERT INTO `django_content_type` VALUES ('9', 'blog', 'comment');
INSERT INTO `django_content_type` VALUES ('11', 'blog', 'tag');
INSERT INTO `django_content_type` VALUES ('10', 'blog', 'userinfo');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-03-23 16:18:48.696347');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2019-03-23 16:18:48.813280');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2019-03-23 16:18:49.151178');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2019-03-23 16:18:49.209176');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2019-03-23 16:18:49.218169');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2019-03-23 16:18:49.229150');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2019-03-23 16:18:49.255148');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2019-03-23 16:18:49.262130');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2019-03-23 16:18:49.271947');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2019-03-23 16:18:49.281959');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2019-03-23 16:18:49.292938');
INSERT INTO `django_migrations` VALUES ('12', 'blog', '0001_initial', '2019-03-23 16:18:51.000248');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0001_initial', '2019-03-23 16:18:51.190204');
INSERT INTO `django_migrations` VALUES ('14', 'admin', '0002_logentry_remove_auto_add', '2019-03-23 16:18:51.216189');
INSERT INTO `django_migrations` VALUES ('15', 'admin', '0003_logentry_add_action_flag_choices', '2019-03-23 16:18:51.245172');
INSERT INTO `django_migrations` VALUES ('16', 'sessions', '0001_initial', '2019-03-23 16:18:51.304138');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('jeo0vckg5orfbgsoxd39au0jw0nzdyi4', 'MjM1ZDRlYWI3N2Q1ZGQzYmFlODJhZmExNGE4YTExYjJlM2Q5ZDUxMTp7InZhbGlkX2NvZGVfc3RyIjoiMXpZWkoiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfaGFzaCI6IjU0ODhmMDg4NjYyNjU1ZmU3YTIzNzU5OTBmZDZjMjlhNzM3ZmY4MzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2019-04-07 09:54:36.209002');
INSERT INTO `django_session` VALUES ('m1e6m3e84j5pr1t3bzhdvsrjozd49ttz', 'ZjE1NmYzNGE3MDFmMDQ5MmJhMzY4NTRjZmY1NjY4ZGI1MzIzYjEzODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NDg4ZjA4ODY2MjY1NWZlN2EyMzc1OTkwZmQ2YzI5YTczN2ZmODMyIn0=', '2019-04-10 21:26:14.263808');
INSERT INTO `django_session` VALUES ('uuejyhboxb4ay6h43x91ifle2gi5ds6y', 'NDBiNWFlNjc1OWEwZGQ2ODMxYTg4ZjBjOWMxODFmNWRhNGM0ZDhmMTp7InVzZXJfaWQiOiJ0ZXN0IiwiZ3Rfc2VydmVyX3N0YXR1cyI6MX0=', '2019-04-07 12:16:31.762979');
