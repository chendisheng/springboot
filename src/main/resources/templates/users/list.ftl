<!DOCTYPE html>
<html>
<head>
    <title>Click Edit Row</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/bootstrap-table.css">
    <link rel="stylesheet" href="/css/bootstrap-table-click-edit-row.css">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-table.js"></script>
    <script src="/js/bootstrap-table-click-edit-row.js"></script>
    <script src="/js/bootstrap-table-export.js"></script>
    <script src="/js/tableExport.js"></script>
<#--<script src="/js/ga.js"></script>-->
</head>
<body>
<div class="container">
    <h1>用户列表到导出</h1>
    <div id="toolbar">
        <select class="form-control">
            <option value="">Export Basic</option>
            <option value="all">Export All</option>
            <option value="selected">Export Selected</option>
        </select>
        <button id="exportExcel" class="form-control">导出</button>
    </div>
    <table id="table"

    </table>
</div>
<script>
    function DoOnMsoNumberFormat(cell, row, col) {
        var result = "";
        if (row > 0 && col == 0)
            result = "\\@";
        return result;
    }
    $(function () {

        $('#table').bootstrapTable({
            url: 'http://localhost:8081/user/all',
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: {},//传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表

            exportDataType:'all',
            showExport: true,  //是否显示导出按钮
            buttonsAlign:"right",  //按钮位置
            exportTypes:['excel'],  //导出文件类型
            Icons:'glyphicon-export',
            exportOptions:{
//                ignoreColumn: [0,1],  //忽略某一列的索引
                fileName: '用户列表报表',  //文件名称设置
                worksheetName: 'sheet1',  //表格工作区名称
                tableName: '用户列表报表',
                excelstyles: ['background-color', 'color', 'font-size', 'font-weight'],
                onMsoNumberFormat: '\@'
            },
            columns: [{
                field: 'id',
                title: '用户ID'
            }, {
                field: 'username',
                title: '用户名'
            }, {
                field: 'psw',
                title: '密码'
            }, ]
        });

        $('#exportExcel').on('click',function(){
            console.log("aaaa");
            $.ajax({
                //提交数据的类型 POST GET
                type:"get",
                //提交的网址
                url:"http://localhost:8081/user/exportExcel",
                //提交的数据
//                data:{Name:"sanmao",Password:"sanmaoword"},
//                //返回数据的格式
//                datatype: "html",//"xml", "html", "script", "json", "jsonp", "text".
                //在请求之前调用的函数
                beforeSend:function(){$("#msg").html("logining");},
                //成功返回之后调用的函数
                success:function(data){
//                    $("#msg").html(decodeURI(data));
                }   ,
                //调用执行后调用的函数
                complete: function(XMLHttpRequest, textStatus){
//                    alert(XMLHttpRequest.responseText);
//                    alert(textStatus);
                    //HideLoading();
                },
                //调用出错执行的函数
                error: function(){
                    //请求出错处理
                }
            });
        });

    });
</script>
</body>
</html>
