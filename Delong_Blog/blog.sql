/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50511
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50511
File Encoding         : 65001

*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `content` text,
  `systime` datetime DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL COMMENT '分类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', 'Spring基础知识汇总及常见面试题目总结', 'Spring框架由Rod Johnson开发，2004年发布了Spring框架的第一版。Spring是一个从实际开发中抽取出来的框架，因此它完成了大量开发中的通用步骤，留给开发者的仅仅是与特定应用相关的部分，从而大大提高了企业应用的开发效率。\r\nSpring总结起来优点如下：\r\n低侵入式设计，代码的污染极低。\r\n独立于各种应用服务器，基于Spring框架的应用，可以真正实现Write Once，Run Anywhere的承诺。\r\nSpring的IoC容器降低了业务对象替换的复杂性，提高了组件之间的解耦。\r\nSpring的AOP支持允许将一些通用任务如安全、事务、日志等进行集中式管理，从而提供了更好的复用。\r\nSpring的ORM和DAO提供了与第三方持久层框架的良好整合，并简化了底层的数据库访问。\r\nSpring的高度开放性，并不强制应用完全依赖于Spring，开发者可自由选用Spring框架的部分或全部。', now(), '4');
INSERT INTO `blog` VALUES ('2', 'Spring单例模式与线程安全', '单例模式的意思就是只有一个实例。单例模式确保某一个类只有一个实例，而且自行实例化并向整个系统提供这个实例。这个类称为单例类。\r\n当多用户同时请求一个服务时，容器会给每一个请求分配一个线程，这是多个线程会并发执行该请求多对应的业务逻辑（成员方法），此时就要注意了，如果该处理逻辑中有对该单列状态的修改（体现为该单列的成员属性），则必须考虑线程同步问题\r\n同步机制的比较　　ThreadLocal和线程同步机制相比有什么优势呢？ThreadLocal和线程同步机制都是为了解决多线程中相同变量的访问冲突问题。 \r\n　　在同步机制中，通过对象的锁机制保证同一时间只有一个线程访问变量。这时该变量是多个线程共享的，使用同步机制要求程序慎密地分析什么时候对变量进行读写，什么时候需要锁定某个对象，什么时候释放对象锁等繁杂的问题，程序设计和编写难度相对较大。 \r\n　　而ThreadLocal则从另一个角度来解决多线程的并发访问。ThreadLocal会为每一个线程提供一个独立的变量副本，从而隔离了多个线程对数据的访问冲突。因为每一个线程都拥有自己的变量副本，从而也就没有必要对该变量进行同步了。ThreadLocal提供了线程安全的共享对象，在编写多线程代码时，可以把不安全的变量封装进ThreadLocal。 \r\n　　由于ThreadLocal中可以持有任何类型的对象，低版本JDK所提供的get()返回的是Object对象，需要强制类型转换。但JDK 5.0通过泛型很好的解决了这个问题，在一定程度地简化ThreadLocal的使用\r\n　概括起来说，对于多线程资源共享的问题，同步机制采用了“以时间换空间”的方式，而ThreadLocal采用了“以空间换时间”的方式。前者仅提供一份变量，让不同的线程排队访问，而后者为每一个线程都提供了一份变量，因此可以同时访问而互不影响。 \r\n　　Spring使用ThreadLocal解决线程安全问题 \r\n　　我们知道在一般情况下，只有无状态的Bean才可以在多线程环境下共享，在Spring中，绝大部分Bean都可以声明为singleton作用域。就是因为Spring对一些Bean（如RequestContextHolder、TransactionSynchronizationManager、LocaleContextHolder等）中非线程安全状态采用ThreadLocal进行处理，让它们也成为线程安全的状态，因为有状态的Bean就可以在多线程中共享了。 \r\n　　一般的Web应用划分为展现层、服务层和持久层三个层次，在不同的层中编写对应的逻辑，下层通过接口向上层开放功能调用。在一般情况下，从接收请求到返回响应所经过的所有程序调用都同属于一个线程\r\n	ThreadLocal是解决线程安全问题一个很好的思路，它通过为每个线程提供一个独立的变量副本解决了变量并发访问的冲突问题。在很多情况下，ThreadLocal比直接使用synchronized同步机制解决线程安全问题更简单，更方便，且结果程序拥有更高的并发性。 \r\n如果你的代码所在的进程中有多个线程在同时运行，而这些线程可能会同时运行这段代码。如果每次运行结果和单线程运行的结果是一样的，而且其他的变量的值也和预期的是一样的，就是线程安全的。 或者说:一个类或者程序所提供的接口对于线程来说是原子操作或者多个线程之间的切换不会导致该接口的执行结果存在二义性,也就是说我们不用考虑同步的问题。 　线程安全问题都是由全局变量及静态变量引起的。  ', now(), '4');
INSERT INTO `blog` VALUES ('3', 'Java设计模式原则', '设计模式6大原则：里氏置换原则\r\n里氏置换原则（Liskov Substitution Principle），简称LSP。所有引用基类的地方必须能够透明的使用其子类对象。也就是说，只要父类出现的地方子类就能够出现，而且替换为子类不会产生任何错误或异常。\r\n里氏置换原则（Liskov Substitution Principle），简称LSP\r\n定义：\r\nFunctions that use pointers or references to base classes must be able to use objects of derived classes without knowing it.\r\n所有引用基类的地方必须能够透明的使用其子类对象。\r\n也就是说，只要父类出现的地方子类就能够出现，而且替换为子类不会产生任何错误或异常。但是反过来，子类出现的地方，替换为父类就可能出现问题了。', now(), '4');
INSERT INTO `blog` VALUES ('4', 'Hibernate对象的三种状态', '在Hibernate中，对象有三种状态：临 时状态(Transient)、持久状态(Persistent)和游离状态(Detached)。\r\n\r\n处于持久态的对象也称为 PO(PersistenceObject),临时对象和游离对象也称为VO(ValueObject). \r\n1. 临时状态 \r\n由 new命令开辟内存空间的java对象,例如：\r\n\r\nUser user=new User();\r\n\r\n临 时对象在内存孤立存在,它是携带信息的载体,不和数据库的数据有任何关联关系.\r\n\r\n(a) 如 果没有变量对该对象进行引用,它将被gc回收；\r\n\r\n(b) 在Hibernate中,可通过 session的save()或saveOrUpdate()方法将瞬时对象与数据库相关联,并将数据对应的插入数据库中,此时该临时对象转变成持久化对 象.\r\n\r\n2. 持久状态 \r\n处于该状态的对象在数据库中具有对应的记录,并拥有一个持久化标识.通过session的get()、load() 等方法获得的对象都是持久对象。\r\n\r\n持久化对象被修改变更后，不会马上同步到数据库，直到数据库事务提交。在同步之前，持久化 对象是脏的（Dirty）。\r\n\r\n(a) 如果是用hibernate的delete()方法,对应的持久对象就变成临时对象,因数据库中 的对应数据已被删除,该对象不再与数据库的记录关联.\r\n\r\n(b) 当一个session执行close()或 clear()、evict()之后,持久对象变成游离对象,此时该对象虽然具有数据库识别值,但它已不在HIbernate持久层的管理之下.\r\n\r\n持久对象具有如下特点:\r\n\r\n(1)和session实例关联;\r\n\r\n(2)在数据库中有与之关联的记录,并 拥有持久化标识.\r\n\r\n3. 游离状态\r\n当与某持久对象关联的session被关闭后,该持久对象转变为游离对象.当游离对象被重新关联到session上 时,又再次转变成持久对象（在Detached其间的改动将被持久化到数据库中）。 游离对象拥有数据库的识别值,但已不在持久化管理范围之内。\r\n\r\n(a) 通 过update()、saveOrUpdate()等方法,游离对象可转变成持久对象.\r\n\r\n(b) 如果是用hibernate的delete()方法,对应的游离对象就变成临时对象,因数据库中的 对应数据已被删除,该对象不再与数据库的记录关联.\r\n\r\n(c) 在没有任何变量引用它时,它将被gc在适当的 时候回收；\r\n\r\n游离对象具有如下特点:\r\n\r\n(1)本质上与瞬时对象相同,在没有任何变量引用它时,JVM会在适当的时候将它回收;\r\n\r\n(2)比瞬时对象多了一个数据库记录标识值.', now(), '4');
INSERT INTO `blog` VALUES ('5', 'Java程序运行时数据存储位置', 'java中有五个不同的地方用来存储数据：\r\n1）寄存器：\r\n\r\n这是存取数据最快的地方，寄存器的数量极其有限，不能对其直接控制。\r\n\r\n2）堆栈：\r\n\r\n位于通用RAM（随机访问存储器）中（也可以理解为内存），通过堆栈指针的上下移动来实现存取数据。堆栈指针向下移动，则分配新的内存；堆栈指针向上移动，则释放内存。堆栈的优势是，存取速度比堆要快，仅次于直接位于CPU中的寄存器。但是Java系统必须知道存储在堆栈内所有项目的确切生命周期，以便上下移动指针。\r\n存储的数据大致分为两类：\r\n<1>Java的基本数据类型共有8种，即int, short, long, byte, float, double, boolean, char(注意，string类型不是基本类型)。基本类型的定义是通过诸如int a = 3； long b = 255L；的形式来定义的，称为自动变量。出于追求速度的原因，它们存在于堆栈中。\r\n<2>Java中对象的引用\r\n\r\n堆栈有一个很重要的特殊性，就是存在于堆栈中的数据可以共享。', now(), '4');
INSERT INTO `blog` VALUES ('6', 'Java中的聚集和组合的区别和联系', '定义：一个对象可以包含另一个对象。这两个对象之间的关系称为组合（composition）。\r\n\r\n组合实际上是聚集关系的一种特殊形式。聚集模拟了具有（has-a）关系，表示两个对象之间的归属关系。归属关系中的所有者对象称为聚集对象（aggregation object），而它的类称为聚集类（aggregating class）。归属关系中的从属对象称为被聚集类（aggregated object），而它的类被称为被聚集类（aggregated class）。\r\n\r\n一个对象可以被几个其他聚集对象所拥有。如果一个对象只归属于一个聚集对象，那么它和聚集对象之间的关系就称为组合（composition）。例如：“一个学生有一个名字”就是组合关系，“一个学生有一个地址”就是聚集关系，因为一个地址可以被几个学生所共享。', now(), '4');
INSERT INTO `blog` VALUES ('7', 'Java编译器如何生成重载和覆盖方法代码', '那么对于编译器来说，如何生成方法代码以便能被正确调用呢？\r\n\r\n静态重载的实现并不难，当处理重载方法声明的时候，将他们绑定到不同的实现，在类型检查的时候，编译器分析参数类型来决定哪个方法被调用；\r\n\r\n动态重载允许在运行期间根据实际参数类型来选择不同的方法实现，这是动态分发(dynamic dispatch)的一种形式；\r\n\r\n动态分发(dynamic dispatch)同样可以用于实现方法覆盖，被覆盖的方法的调用由运行期间实际对象的类型来决定；\r\n\r\n如果需要进一步理解动态分发(dynamic dispatch),可参考如下链接,关于对象在内存中的分布：', now(), '4');
INSERT INTO `blog` VALUES ('8', 'Java内存模型与垃圾回收', '程序计数器：一块较小内存区域，指向当前所执行的字节码。如果线程正在执行一个Java方法，这个计数器记录正在执行的虚拟机字节码指令的地址，如果执行的是Native方法，这个计算器值为空。\r\nJava虚拟机栈：线程私有的，其生命周期和线程一致，每个方法执行时都会创建一个栈帧用于存储局部变量表、操作数栈、动态链接、方法出口等信息。\r\n本地方法栈：与虚拟机栈功能类似，只不过虚拟机栈为虚拟机执行Java方法服务，而本地方法栈则为使用到的Native方法服务。\r\nJava堆：是虚拟机管理内存中最大的一块，被所有线程共享，该区域用于存放对象实例，几乎所有的对象都在该区域分配。Java堆是内存回收的主要区域，从内存回收角度看，由于现在的收集器大都采用分代收集算法，所以Java堆还可以细分为：新生代和老年代，再细分一点的话可以分为Eden空间、From Survivor空间、To Survivor空间等。根据Java虚拟机规范规定，Java堆可以处于物理上不连续的空间，只要逻辑上是连续的就行。\r\n方法区：与Java一样，是各个线程所共享的，用于存储已被虚拟机加载类信息、常亮、静态变量、即时编译器编译后的代码等数据。\r\n运行时常量池，运行时常量池是方法区的一部分，Class文件中除了有类的版本、字段、方法、接口等描述信息外，还有一项信息是常量池，用于存放编译期生成的各种字面量和符号引用。运行期间可以将新的常量放入常量池中，用得比较多的就是String类的intern()方法，当一个String实例调用intern时，Java查找常量池中是否有相同的Unicode的字符串常量，若有，则返回其引用；若没有，则在常量池中增加一个Unicode等于该实例字符串并返回它的引用。', now(), '3');

-- ----------------------------
-- Table structure for `gbook`
-- ----------------------------
DROP TABLE IF EXISTS `gbook`;
CREATE TABLE `gbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1024) DEFAULT NULL,
  `systime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gbook
-- ----------------------------
INSERT INTO `gbook` VALUES ('1', '我是留言! 我是留言!', now());
INSERT INTO `gbook` VALUES ('2', '我是留言2号!', now());

-- ----------------------------
-- Table structure for `links`
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of links
-- ----------------------------
INSERT INTO `links` VALUES ('1', 'JAVA部落', 'http://ghyg525.taobao.com');

-- ----------------------------
-- Table structure for `photo`
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `systime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo
-- ----------------------------
INSERT INTO `photo` VALUES ('1', '示例图片', 'picture/1.jpg', now());
INSERT INTO `photo` VALUES ('2', '示例图片', 'picture/2.jpg', now());
INSERT INTO `photo` VALUES ('3', '示例图片', 'picture/3.jpg', now());
INSERT INTO `photo` VALUES ('4', '示例图片', 'picture/4.jpg', now());
INSERT INTO `photo` VALUES ('5', '示例图片', 'picture/5.jpg', now());
INSERT INTO `photo` VALUES ('6', '示例图片', 'picture/6.jpg', now());
INSERT INTO `photo` VALUES ('7', '示例图片', 'picture/7.jpg', now());
INSERT INTO `photo` VALUES ('8', '示例图片', 'picture/8.jpg', now());
INSERT INTO `photo` VALUES ('9', '示例图片', 'picture/9.jpg', now());
INSERT INTO `photo` VALUES ('10', '示例图片', 'picture/10.jpg', now());
INSERT INTO `photo` VALUES ('11', '示例图片', 'picture/11.jpg', now());
INSERT INTO `photo` VALUES ('12', '示例图片', 'picture/12.jpg', now());
INSERT INTO `photo` VALUES ('13', '示例图片', 'picture/13.jpg', now());
INSERT INTO `photo` VALUES ('14', '示例图片', 'picture/14.jpg', now());
INSERT INTO `photo` VALUES ('15', '示例图片', 'picture/15.jpg', now());
INSERT INTO `photo` VALUES ('16', '示例图片', 'picture/16.jpg', now());

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `systime` datetime DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL COMMENT '博文id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '多谢分享', now(), '8');
INSERT INTO `reply` VALUES ('2', '哈哈', now(), '8');
INSERT INTO `reply` VALUES ('3', '又是你', now(), '7');
INSERT INTO `reply` VALUES ('4', '好像没懂', now(), '6');

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '似水流年');
INSERT INTO `topic` VALUES ('2', '如花美眷');
INSERT INTO `topic` VALUES ('3', '我的生活');
INSERT INTO `topic` VALUES ('4', '技术人生');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'iUOoOdMAl7FsB1Kig37hmg==');
