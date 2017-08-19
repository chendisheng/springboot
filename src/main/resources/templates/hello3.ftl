<#assign base = request.contextPath />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="fyunli">

    <base id="base" href="${base}">
    <title>Spring Boot - hello</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/main.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/bootstrap-table.css">
    <link href="/css/bootstrap-table.min.css" rel="stylesheet" />
    <link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />

    <#--<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries &ndash;&gt;-->
    <#--<!--[if lt IE 9]>-->
    <#--<script src="//cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script>-->
    <#--<script src="//cdn.jsdelivr.net/respond/1.4.2/respond.min.js"></script>-->
    <#--<![endif]&ndash;&gt;-->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <#--<script src="//cdn.jsdelivr.net/ie10-viewport/1.0.0/ie10-viewport.min.js"></script>-->
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-table.js"></script>
    <!-- put your locale files after bootstrap-table.js -->
    <script src="/js/bootstrap-table-zh-CN.js"></script>

    <script src="/js/bootstrap-table.js"></script>
    <script src="/js/bootstrap-table-editable.js"></script>
    <script src="/js/bootstrap-select.js"></script>
    <script src="/js/bootstrap-datetimepicker.min.js"></script>

    <!-- 可编辑 -->
    <link href="/css/bootstrap-editable.css" rel="stylesheet" />
    <link href="/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="/css/bootstrap-table.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="/js/bootstrap-table.min.js"></script>

    <!-- Latest compiled and minified Locales -->
    <script src="/js/bootstrap-table-zh-CN.min.js"></script>



</head>

<body>

<!-- Begin page content -->
<div class="container">
    <div class="page-header">
        <h1>Sprint Boot: Hello</h1>
    </div>

    <div>
        Date: ${time?date}
        <br>
        Time: ${time?time}
        <br>
        Message: ${message}
    </div>

    <div class="panel-body" style="padding-bottom:0px;">
        <div class="my_table_bar">
            <div class="col-xs-10 bar_title">
                <p align="center">
                    <strong>成果的知识产权情况</strong>
                </p>
            </div>
            <div class="col-xs-2 bar_option">
                <a class="insert" href="javascript:addRow(2);" title="新增行">
                    <i class="glyphicon glyphicon-plus" id="editTable_add_kjcg"></i>
                    新增
                </a>
            </div>
        </div>
        <table id="reportTable1" class="table table-bordered table-hover"></table>
        <a href="#" id="username" data-type="text" data-title="用户名">用户名</a>
    </div>

</div>

<footer class="footer">
    <div class="container">
        <p class="text-muted">©2016 fyunli</p>
    </div>
</footer>





<script>

    function operateFormatter1(value, row, index) {
        return [
            "<a class=\"remove\" href='javascript:removeRow("+index+",1)' title=\"删除改行\">",
            "<i class='glyphicon glyphicon-remove'></i>",
            "</a>     "
        ].join('');
    }
    function operateFormatter2(value, row, index) {
        return [
            "<a class=\"remove\" href='javascript:removeRow("+index+",2)' title=\"删除改行\">",
            "<i class='glyphicon glyphicon-remove'></i>",
            "</a>     "
        ].join('');
    }



    //可编辑列表新增一行
    function addRow(mark){
        var rows = [];

        //通过mark来判断为哪个可编辑框创建新一行
        if(mark == 1){
            $('#reportTable1').bootstrapTable('append',rows);
        }else if(mark == 2){
            $('#reportTable2').bootstrapTable('append',rows);
        }

    }
    //删除指定行
    function removeRow(deleteIndex,mark){
        if(mark == "1"){
            $('#reportTable1').bootstrapTable('removeRow', deleteIndex);
        }else if(mark == "2"){
            $('#reportTable2').bootstrapTable('removeRow', deleteIndex);
        }
    }

    function loadEditTable(tid){

        //重置table内数据
        $('#reportTable1').bootstrapTable('destroy');//这里必须要添加这个销毁，否则新增、修改、查看的切换可编辑列表中的数据可能加载出现问题。
        $('#reportTable2').bootstrapTable('destroy');

        $('#reportTable1').bootstrapTable({
            queryParams: function queryParams(params) {   //设置查询参数
                var param = {
                    pageNumber: params.pageNumber,
                    pageSize: params.pageSize
                };
                return param;
            },
            method: 'get',
            url:'http://localhost/data/getList',
            responseHandler: function (res) {//这里我查看源码的，在ajax请求成功后，发放数据之前可以对返回的数据进行处理，返回什么部分的数据，比如我的就需要进行整改的！
                return res;
            },
            editable:true,//开启编辑模式
            sidePagination: "service", //表示服务端请求
            clickToSelect: true,
            cache : false,
            columns: [
                {field:"JX_NAME",title:"所获奖项明称",align:"center",editable:{required:true,type:'text' }},
                {field:"JX_ORG",title:"奖励单位",align:"center",editable:{type:'text' }},
                {field:"JX_TIME",title:"奖励年度",align:"center",editable:{type:'text' }},
                {field:"JX_RANK",title:"授奖等级",align:"center",editable:{type:'text' }},
                {field:"operate",title:"操作",align:"center",edit:false}
            ],
            onEditableHidden: function(field, row, $el, reason) { // 当编辑状态被隐藏时触发
                if(reason === 'save') {
                    var $td = $el.closest('tr').children();
                    $td.eq(-1).html((row.price*row.number).toFixed(2));
                    $el.closest('tr').next().find('.editable').editable('show'); //编辑状态向下一行移动
                } else if(reason === 'nochange') {
                    $el.closest('tr').next().find('.editable').editable('show');
                }
            },
            onEditableSave: function (field, row, oldValue, $el) {
                $table = $('#reportTable1').bootstrapTable({});
                $table.bootstrapTable('updateRow', {index: row.rowId, row: row});
            }
        });

        $('#reportTable2').bootstrapTable({
            queryParams: function queryParams(params) {   //设置查询参数
                var param = {
                    pageNumber: params.pageNumber,
                    pageSize: params.pageSize
                };
                return param;
            },
            responseHandler: function (res) {//这里我查看源码的，在ajax请求成功后，发放数据之前可以对返回的数据进行处理，返回什么部分的数据，比如我的就需要进行整改的！
                return res;
            },
            method: 'get',
            url:'http://localhost/data/getList2',
            editable:true,//开启编辑模式
            clickToSelect: true,
            sidePagination: "service", //表示服务端请求
            cache : false,
            columns: [
                {field:"ZSCQ_XS",title:"知识产权形式",align:"center",edit:{required:true ,type:'text'}},
                {field:"ZSCQ_NAME",title:"所获知识产权项目名称",align:"center",edit:{type:'text'}},
                {field:"ZSCQ_CODE",title:"知识产权号",align:"center",edit:{type:'text'}},
                {field:"ZSCQ_TIME",title:"授权时间",align:"center",edit:{type:'text'}},
                {field:"operate",title:"操作",align:"center",edit:false}
            ],
            onEditableSave: function (field, row, oldValue, $el) {
                $table = $('#reportTable1').bootstrapTable({});
                $table.bootstrapTable('updateRow', {index: row.rowId, row: row});
            }
//            ,
//            onLoadSuccess: function(){  //加载成功时执行
//                layer.msg("加载成功");
//            },
//            onLoadError: function(){  //加载失败时执行
//                layer.msg("加载数据失败", {time : 1500, icon : 2});
//            }
        });
    }
    $(document).ready(function(){
        //$('#username').editable();
        loadEditTable(0);
    });



</script>
</body>
</html>
