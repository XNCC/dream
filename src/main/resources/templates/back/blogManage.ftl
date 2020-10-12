<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <!-- Title-->
    <title>Home</title>
    <!-- Favicon-->
    <link rel="icon" href=image/favicon.jpg" type="image/x-icon">
    <!-- Stylesheets-->
    <script src="js/jquery.js"></script>
    <script src="wangeditor/wangEditor.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="pageHelper/jquery.sPage.css">
<style>
    .manageBlogColor {
        border-bottom: dashed #DDDDDD 1px;
        border-radius: 5px;
        padding-bottom: 1%;
        padding-top: 1%;
    }
    .manageBlogaflout{
        float:right;
    }
</style>

</head>
<body>
<#include "./header.ftl">
<div class="container">
    <div>
        <h2>博客管理</h2>
    </div>

    <div id="showBlogId">
        <#if rows??>
            <#list rows as item>
                <div class="row">
                    <div class="col-md-11 col-md-offeset-1 manageBlogColor">
                        <div class="col-md-12">
                            <p>${item.softwaretitle!}</p>
                            <i>${item.tag!} &nbsp;&nbsp;&nbsp;${item.starttime!}  </i>
                            <a class="manageBlogaflout" href="updateBlog/${item.id!} ">修改</a><a
                                    class="manageBlogaflout" href="deleteBlog/${item.id!}">删除&nbsp;&nbsp;&nbsp;</a>
                        </div>
                    </div>
                </div>
            </#list>
        </#if>
    </div>

    <!--Bootstrap分页插件-->
    <div class="row">
        <div class="col-md-12 setManagerBlogcenter">
            <div id="myPage" class="demo"></div>
        </div>
    </div>
</div>


<script src="pageHelper/jquery.sPage.min.js"></script>
<script>
    $(function () {
        $("#myPage").sPage({
            page:${page!1},//当前页码
            pageSize:${pagesize!1},//每页显示多少条数据，默认10条
            total:${total!10},//数据总条数
            showTotal: true,//是否显示总条数，默认关闭：false
            totalTxt: "共{total}条",//数据总条数文字描述，{total}为占位符
            showSkip: true,//是否显示跳页，默认关闭：false
            showPN: true,//是否显示上下翻页，默认开启：true
            prevPage: "上一页",//上翻页文字描述，默认“上一页”
            nextPage: "下一页",//下翻页文字描述，默认“下一页”
            backFun: function (page) {
                //点击分页按钮回调函数，返回当前页码
                // $("#pNum").text(page);
                ajaxPage(page);
            }
        });
    });
</script>
</body>
</html>