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
<#--<link href="/css/bootstrap.min.css" rel="stylesheet">-->
<#--<link href="/css/main.css" rel="stylesheet">-->
<#--<link rel="stylesheet" href="/css/bootstrap.min.css">-->
<#--<link rel="stylesheet" href="/css/bootstrap-table.css">-->
<#--<link href="/css/bootstrap-table.min.css" rel="stylesheet" />-->
<#--<link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />-->

<#--<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries &ndash;&gt;-->
<#--<!--[if lt IE 9]>-->
<#--<script src="//cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script>-->
<#--<script src="//cdn.jsdelivr.net/respond/1.4.2/respond.min.js"></script>-->
<#--<![endif]&ndash;&gt;-->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<#--<script src="//cdn.jsdelivr.net/ie10-viewport/1.0.0/ie10-viewport.min.js"></script>-->
<#--<script src="/js/jquery.min.js"></script>-->
<#--<script src="/js/bootstrap.min.js"></script>-->
<#--<script src="/js/bootstrap.min.js"></script>-->
<#--<script src="/js/bootstrap-table.js"></script>-->
<#--<!-- put your locale files after bootstrap-table.js &ndash;&gt;-->
<#--<script src="/js/bootstrap-table-zh-CN.js"></script>-->

<#--<script src="/js/bootstrap-table.js"></script>-->
<#--<script src="/js/bootstrap-table-editable.js"></script>-->
<#--<script src="/js/bootstrap-select.js"></script>-->
<#--<script src="/js/bootstrap-datetimepicker.min.js"></script>-->

    <!-- 可编辑 -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/bootstrap-table.css">
    <link rel="stylesheet" href="/css/bootstrap-editable.css">

    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-table.js"></script>
    <script src="/js/bootstrap-table-editable.js"></script>
    <script src="/js/bootstrap-editable.js"></script>
    <script src="/js/validateUtil.js"></script>

    <!-- jquery validate -->
    <script src="/js/jquery.validate.min.js"></script>


</head>

<body>

<!-- Begin page content -->
<div class="container">

    <div class="page-header">
        <h1>Sprint Boot: Hello</h1>
    </div>



    <div class="panel-body" style="padding-bottom:0px;">
        <form id="form2" class="form-horizontal">
        <div class="form form-group">
            <div class="my_table_bar">
                <div class="col-xs-11 bar_title">
                    <p align="center">
                        <strong>成果的知识产权情况</strong>
                    </p>
                </div>
                <div class="col-xs-1 bar_option">
                    <a class="insert" href="javascript:addRow(1);" title="新增行">
                        <i class="glyphicon glyphicon-plus" id="editTable_add_kjcg"></i>
                        新增
                    </a>
                </div>
            </div>
            <table id="reportTable1" class="table table-bordered table-hover"></table>
        </div>
        <div class="my_table_bar">
            <div class="col-xs-11 bar_title">
                <p align="center">
                    <strong>成果的知识产权情况</strong>
                </p>
            </div>
            <div class="col-xs-1 bar_option">
                <a class="insert" href="javascript:addRow(2);" title="新增行">
                    <i class="glyphicon glyphicon-plus" id="editTable_add_kjcg"></i>
                    新增
                </a>
            </div>
        </div>

        <table id="reportTable2" class="table table-bordered table-hover"></table>
        <#--<a href="#" id="username" data-type="text" data-title="用户名">用户名</a>-->
        <div>
            <input id="test1" name="test1" />
            <input id="test2" name="test2" />
        </div>
        <button id="check" class="btn btn-default">测试</button>
        <button id="submit"  class="btn btn-primary btn-sm">
            提交
        </button>
        </form>

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
            "<a class=\"remove\" href='javascript:removeRow("+index+",1)' title=\"删除\">",
            "<i class='glyphicon glyphicon-remove'></i>",
            "删除",
            "</a>     "
        ].join('');
    }
    function operateFormatter2(value, row, index) {
        return [
            "<a class=\"remove\" href='javascript:removeRow("+index+",2)' title=\"删除\">",
            "<i class='glyphicon glyphicon-remove'></i>",
            "删除",
            "</a>     "
        ].join('');
    }


    function test(){
        var data1 = $('#reportTable1').bootstrapTable("getData");
        console.log(data1);

        var data2 = $('#reportTable2').bootstrapTable("getData");
        console.log(data2);
    }


    //可编辑列表新增一行
    function addRow(mark){
        var table ;
        if(mark =='1'){
            table =  $('#reportTable1');
        }
        if(mark =='2')
        {
            table =  $('#reportTable2');
        }
        var data = table.bootstrapTable('getData');

        var rows = [];
        if(mark =='1'){
            rows =[{rowNo: data.length,
                JX_RANK: "",
                JX_TIME: "",
                JX_ORG: "",
                JX_NAME: ""}]
        }
        if(mark =='2')
        {
            rows =[{rowNo: data.length,
                    ZSCQ_XS: "",
                    ZSCQ_NAME: "",
                    ZSCQ_CODE: "",
                    ZSCQ_TIME: ""}]
        }

        //通过mark来判断为哪个可编辑框创建新一行
        if(mark == 1){
            $('#reportTable1').bootstrapTable('append',rows);
        }else if(mark == 2){
            $('#reportTable2').bootstrapTable('append',rows);
        }

    }
    //删除指定行
    function removeRow(deleteIndex,mark){
        var table ;
        if(mark =='1'){
            table =  $('#reportTable1');
        }
        if(mark =='2')
        {
            table =  $('#reportTable2');
        }
        var row =  table.bootstrapTable('getData');
        var rowNo = row[deleteIndex].rowNo;

        table.bootstrapTable('remove', {
            field: 'rowNo',
            values: [rowNo]
        });
        table.find('.no-records-found').hide();
    }

    // 改变 input 编辑框值时，更新 data 数据，便于新增行时原来填写好的数据不会被新增行强制覆盖
    function reloadRowData(obj, row,index,key){
        var name = obj.name;
        row[name] = obj.value;
        $('#reportTable2').bootstrapTable('updateRow', {
            index: index,
            row:row
        });
    }



    function inputModel(value, row, index,key) {
        return "<input type=\"text\" class=\“form-control\” name=\""+key+"\" value=\"" + value + "\" onchange='reloadRowData(this, " + JSON.stringify(row) + ", " + index + ", \"" + key + "\")' />";
    }



    function loadEditTable(tid){

        //重置table内数据
        $('#reportTable1').bootstrapTable('destroy');//这里必须要添加这个销毁，否则新增、修改、查看的切换可编辑列表中的数据可能加载出现问题。
        $('#reportTable2').bootstrapTable('destroy');

        $('#reportTable1').bootstrapTable({
            queryParams: function queryParams(params) {   //设置查询参数
                var param = {
                    pageSize: params.limit,   //页面大小
                    pageNumber: params.pageNumber  //页码
                };
                return param;
            },
            dataType: "json",
            method: 'get',
            url:'${base}/data/getList',
            responseHandler: function (res) {//这里我查看源码的，在ajax请求成功后，发放数据之前可以对返回的数据进行处理，返回什么部分的数据，比如我的就需要进行整改的！
                return {
                    total : res.bo.total,
                    rows : res.bo.records
                };
            },
            editable:true,//开启编辑模式
            sidePagination: "service", //表示服务端请求
            clickToSelect: true,
            cache : false,
            columns: [
                {field:"rowNo",title:"rowNo",visible:false, align:"center",formatter:function (value,row,index) {
                    return index;
                }},
                {field:"JX_NAME",title:"IP",align:"center",
                    editable:{required:true,type:'text',validate:function(v){
                        if(!isValidIP(v)){
                            return "不是有效IP地址"
                        }
                    }}},
                {field:"JX_ORG",title:"Port",align:"center",
                    editable:{type:'text',validate:function(v){
                        if(!isValidPort(v)){
                            return "不是有效端口号"
                        }
                    } } },
                {field:"JX_TIME",title:"权重",align:"center",editable:{type:'text',validate:function(v){
                    if(!isPositive(v)){
                        return "不是有效正整数"
                    }
                } }},
//                {field:"JX_RANK",title:"授奖等级",align:"center",editable:{type:'text' }},
                {field:"operate",title:"操作",align:"center",formatter:operateFormatter1,editable:false}
            ],
            onLoadSuccess: function(){  //加载成功时执行
                console.log("加载成功");
            },
            onLoadError: function(){  //加载失败时执行
                console.log("加载数据失败");
            }

        });

        $('#reportTable2').bootstrapTable({
            queryParams: function queryParams(params) {   //设置查询参数
                var param = {
                    pageNumber: params.limit,
                    pageSize: params.pageNumber
                };
                return param;
            },
            responseHandler: function (res) {//这里我查看源码的，在ajax请求成功后，发放数据之前可以对返回的数据进行处理，返回什么部分的数据，比如我的就需要进行整改的！
                return {
                    total : res.bo.total,
                    rows : res.bo.records
                };
            },
            method: 'get',
            url:'${base}/data/getList2',
            editable:true,//开启编辑模式
            clickToSelect: true,
            sidePagination: "service", //表示服务端请求
            cache : false,
            columns: [
                {field:"rowNo",title:"rowNo",visible:false, align:"center",formatter:function (value,row,index) {
                    return index;
                }},
                {field:"ZSCQ_XS",title:"知识产权形式",align:"center",
                    formatter:function(value,row,index)
                    {
                        return inputModel(value,row,index,'ZSCQ_XS');
                    }
                },
                {field:"ZSCQ_NAME",title:"所获知识产权项目名称",align:"center",
                    formatter:function(value,row,index)
                    {
                        return inputModel(value,row,index,'ZSCQ_NAME');
                    }
                },
                {field:"ZSCQ_CODE",title:"知识产权号",align:"center",
                    formatter:function(value,row,index)
                    {
                    return inputModel(value,row,index,'ZSCQ_CODE');
                    }
                },
                {field:"operate",title:"操作",align:"center",formatter:operateFormatter2,edit:false}
            ],
            onLoadSuccess: function(){  //加载成功时执行
               console.log("加载成功");
            },
            onLoadError: function(){  //加载失败时执行
                console.log("加载数据失败");
            }
        });
    }

    var MyValidator = function() {
        var handleSubmit = function() {
            $('#form2').validate({
                errorElement : 'span',
                errorClass : 'help-block',
                focusInvalid : false,
                rules : {
                    ZSCQ_XS : {
                        required : true
                    },
                    ZSCQ_NAME : {
                        required : true
                    },
                    ZSCQ_CODE : {
                        required : true
                    }
                },
                messages : {
                    name : {
                        required : "ZSCQ_XS is required."
                    },
                    password : {
                        required : "ZSCQ_NAME is required."
                    },
                    intro : {
                        required : "ZSCQ_CODE is required."
                    }
                },

                highlight : function(element) {
//                    console.log("highlight");
                    $(element).closest('.form-group').addClass('has-error');
                },

                success : function(label) {
//                    console.log("success");
                    label.closest('.form-group').removeClass('has-error');
                    label.remove();
                },

                errorPlacement : function(error, element) {
//                    console.log("errorPlacement");
                    element.parent('div').append(error);
                },

                submitHandler : function(form) {
//                    console.log("submitHandler");
                    form.submit();
                }
            });

            $('.form-horizontal input').keypress(function(e) {
                if (e.which == 13) {
                    if ($('.form-horizontal').validate().form()) {
                        $('.form-horizontal').submit();
                    }
                    return false;
                }
            });
        }
        return {
            init : function() {
                handleSubmit();
            }
        };

    }();


    $(document).ready(function(){


        //$('#username').editable();
        loadEditTable(0);

        $('#check').on("click",function () {
            test();

        })

        $('#submit').on("click",function () {
            console.log("test");
            $('#form2').validate({
                debug:true
            })

        })
    });

    MyValidator.init();

</script>
</body>
</html>
