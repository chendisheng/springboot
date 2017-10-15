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

    <script>
        $(function(){
            var validate = $("#myform").validate({
                debug: true, //调试模式取消submit的默认提交功能
                //errorClass: "label.error", //默认为错误的样式类为：error
                focusInvalid: false, //当为false时，验证无效时，没有焦点响应
                onkeyup: false,
                submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form
                    alert("提交表单");
                    form.submit();   //提交表单
                },

                rules:{
                    myname:{
                        required:true
                    },
                    email:{
                        required:true,
                        email:true
                    },
                    password:{
                        required:true,
                        rangelength:[3,10]
                    },
                    ZSCQ_XS:{
                        required:true
                    },
                    confirm_password:{
                        equalTo:"#password"
                    }
                },
                messages:{
                    myname:{
                        required:"必填"
                    },
                    email:{
                        required:"必填",
                        email:"E-Mail格式不正确"
                    },
                    password:{
                        required: "不能为空",
                        rangelength: $.validator.format("密码最小长度:{0}, 最大长度:{1}。")
                    },
                    ZSCQ_XS:{
                        required:"不能为空"
                    },
                    confirm_password:{
                        equalTo:"两次密码输入不一致"
                    }
                }

            });

        });
    </script>

</head>

<body>
<form id="myform" method="post" action="">
    <p>
        <label for="myname">用户名：</label>
        <!-- id和name最好同时写上 -->
        <input id="myname" name="myname" />
    </p>
    <p>
        <label for="email">E-Mail：</label>
        <input id="email" name="email" />
    </p>
    <p>
        <label for="password">登陆密码：</label>
        <input id="password" name="password" type="password" />
    </p>
    <p>
        <label for="confirm_password">确认密码：</label>
        <input id="confirm_password" name="confirm_password" type="password" />
    </p>
    <p>
        <input class="submit" type="submit" value="立即注册" />
    </p>
    <br>
    <table id="reportTable2" class="table table-bordered table-hover"></table>
</form>

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
        return "<input type=\"text\" name=\""+key+"\" value=\"" + value + "\" onchange='reloadRowData(this, " + JSON.stringify(row) + ", " + index + ", \"" + key + "\")' />";
    }

    $(document).ready(function(){
        $('#reportTable2').bootstrapTable('destroy');
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

    });
</script>
</body>
</html>
