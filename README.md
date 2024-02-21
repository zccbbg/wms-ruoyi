## 若依wms简介
若依wms是一套基于若依的wms仓库管理系统，支持lodop和网页打印入库单、出库单。毫无保留给个人及企业免费使用。
* 前端采用Vue、Element UI（ant design 正在开发中）。
* 后端采用Spring Boot、Spring Security、Redis & Jwt。
* 权限认证使用Jwt，支持多终端认证系统。
* 支持加载动态权限菜单，多方式轻松权限控制。
* 高效率开发，使用代码生成器可以一键生成前后端代码。

## SaaS版已上线，欢迎试用。
轻量级库存管理工具，不用安装，自动升级，让仓库效率提高5倍，让出错概率降低5倍。
集中入库、出库、扫描、一物一码、商品、库存、供应商、结算等优质功能于一体，为商家提供更全面库存处理解决方案。
https://kct.ichengle.top/register?code=7ixq7h

## 代码自动生成
修改application.yml文件中的backPath和frontPath路径。
backPath:为后端项目路径 
frontPath:为前端项目路径

## 前端项目地址
### gitee
https://gitee.com/zccbbg/ruo-yi-wms-vue
### github
https://github.com/zccbbg/RuoYi-WMS-VUE

## 在线体验
- 演示地址：http://wms.ichengle.top
- 给大家一个便宜寄快递的福利，大件5折，小件6折：
- <img src="doc/express.jpg" width="200px">

## CSDN若依技术专栏
- 常见问题：https://blog.csdn.net/qq_27575627/category_12336113.html
- 后端技术：https://blog.csdn.net/qq_27575627/category_12331868.html
- 前端技术：https://blog.csdn.net/qq_27575627/category_12331867.html
- 运维：https://blog.csdn.net/qq_27575627/category_12332546.html

## B站视频介绍
https://www.bilibili.com/video/BV1ys4y1q7uG

## 若依框架视频介绍
对若依框架不了解，不知道怎么部署、修改密码等操作的，请参考：https://www.bilibili.com/video/BV1Fi4y1q74p/

## 本地运行文档
https://docs.ichengle.top/wms/open/run.html
## 系统部署文档
https://docs.ichengle.top/wms/open/ops.html

## 若依wms功能
1. 首页：库存预警与到期提醒、基础数据报表展示
2. 仓库/库区：管理维护仓库基础数据
3. 物料：管理维护物料基础数据
4. 客户/供应商/承运商：管理维护联系人基础数据
5. 入库：创建入库单后包括如下几个状态：未发货、在途（已发货未入库）、部分入库、作废、入库完成，入库类型包括：采购入库、外协入库、退货入库，入库单支持lodop和网页打印
6. 出库：创建出库单后包括如下几个状态：未发货、部分发货、已发货、作废，入库类型包括：销售出库、外协出库、调拨出库，出库单支持lodop和网页打印
7. 移库：创建移库单后包括如下几个状态：未操作、部分移动、操作完毕、作废
8. 库存看板：查看当前物料库存数量
9. 库存记录：查看当前物料库存操作记录
10. 库存盘点：已完成
11. 库存月结：已完成
12. 各类报表: 已完成
## 状态流转
#### 入库状态流转
![入库状态流转](https://oscimg.oschina.net/oscnet/up-6bdb5ad6d8ab236f763300b71cf175d9a99.jpg)
#### 出库状态流转
![出库状态流转](https://oscimg.oschina.net/oscnet/up-55cad3f077f914e357efeaae0b3feecf942.jpg)

## 演示图
![首页](https://oscimg.oschina.net/oscnet/up-89f751967b4145f7da92e23536bf231fbe8.jpg)
![支持两种打印方式](https://oscimg.oschina.net/oscnet/up-6daf90ef19571c7f0e7641ae59c403d8272.jpg)
![lodop打印](https://oscimg.oschina.net/oscnet/up-146d2105ae31a27e497323ad19f8bd0d7bd.jpg)
![网页打印](https://oscimg.oschina.net/oscnet/up-5664440042861199d1f3e60928e0700a9ce.jpg)
![仓库列表](https://oscimg.oschina.net/oscnet/up-a00eb79bee48e481249a12cb5e6c476aaa3.jpg)
![库存看板](https://oscimg.oschina.net/oscnet/up-78990915dfba902384ed4b09e3dc0f0fe05.jpg)

## 大厂、外企内推
关注“编写美好前程”公众号：每月记录一篇编程、创业、生活中踩坑的文章，陆续会开放一些微软、阿里、京东、拼多多等大厂或外企的内推岗位！

## 加群/技术支持

|                    公众号                     |
|:------------------------------------------:|
| <img src="doc/datacall.jpg" width="200px"> |
扫公众号二维码，回复：“加群”或“支持”