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

</head>
<body>
<#include "./header.ftl">
<div class="container">
    <div>
        <h2>写文章</h2>
    </div>
    <div class="row" style="margin-top: 2%;">
        <div class="col-md-10">
            <div id="editor">
            </div>
        </div>

        <div class="col-md-2">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="exampleInputName2">模板选择</label>
                        <select class="form-control" id="template">
                            <option value="1">博客模板</option>
                            <option value="2">下载页模板</option>
                            <option value="3">教程模板</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="exampleInputName2">标题</label>
                        <input type="text" class="form-control" id="title" placeholder="标题">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="exampleInputName2">分类</label>
                        <input type="text" class="form-control" id="type" placeholder="分类">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="exampleInputName2">标签</label>
                        <input type="text" class="form-control" id="tag" placeholder="标签">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <button type="button" class="btn btn-primary" id="submit">发布</button>
                    <button type="button" class="btn btn-primary" id="saveDraft">保存为草稿</button>
                </div>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#editor')
    editor.customConfig.uploadImgShowBase64 = true
    editor.create()
    $("#editor > div.w-e-text-container").height("500px");
    //    提交
    $("#submit").click(function () {
        var content = editor.txt.html();
        var template = $("#template").val();
        var softwaretitle = $("#title").val();
        var contenttype = $("#type").val();
        var tag = $("#tag").val();
        //发布
        $.post("/write", {"content": content, "softwaretitle": softwaretitle, "contenttype": contenttype, tag: tag},
            function (data) {
                if (data.status == "0") {
                    alert("保存成功");
                } else {
                    alert("保存失败");
                }
            });
    });
    //保存为草稿
    $("#saveDraft").click(function () {
        var content = editor.txt.html();
        var template = $("#template").val();
        var softwaretitle = $("#title").val();
        var contenttype = $("#type").val();
        var tag = $("#tag").val();
        $.post("/saveDraft", {"content": content, "softwaretitle": softwaretitle, "contenttype": contenttype, tag: tag},
            function (data) {
                if (data.status == "0") {
                    alert("保存成功");
                } else {
                    alert("保存失败");
                }
            });
    });
    //    选择模板
    $("#template").change(function () {
        var id = $('#template  option:selected').val();
        $.post("/selectTemplateById", {"id": id},
            function (data) {
                editor.txt.html(data)
            });

    });
    window.onload=function(){
        //初始化模板
        $.post("/selectFirstTemplate", {},
            function (data) {
                editor.txt.html(data)
            });
    }
</script>
</body>
</html>