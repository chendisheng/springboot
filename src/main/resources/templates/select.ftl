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
    <#--<link rel="stylesheet" href="/css/bootstrap.min.css">-->
    <#--<link rel="stylesheet" href="/css/bootstrap-table.css">-->
    <#--<link rel="stylesheet" href="/css/bootstrap-editable.css">-->

    <#--<script src="/js/jquery.min.js"></script>-->
    <#--<script src="/js/bootstrap.min.js"></script>-->
    <#--<script src="/js/bootstrap-table.js"></script>-->
    <#--<script src="/js/bootstrap-table-editable.js"></script>-->
    <#--<script src="/js/bootstrap-editable.js"></script>-->
    <#--<script src="/js/validateUtil.js"></script>-->

    <#--<!-- jquery validate &ndash;&gt;-->
    <#--<script src="/js/jquery.validate.min.js"></script>-->

    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/stylesheet.css">
    <link rel="stylesheet" href="/css/selectize.default.css">

    <script src="/js/jquery.min.js"></script>
    <script src="/js/standalone/selectize.js"></script>
    <script src="/js/index.js"></script>

</head>

<body>

<!-- Begin page content -->
<div class="container">

    <div id="wrapper">
        <h1>Selectize.js</h1>
        <div class="demo">
            <h2>API</h2>
            <p>Examples of how to interact with the control programmatically.</p>
            <div class="control-group">
                <label for="select-tools">Tools:</label>
                <select id="select-tools" multiple placeholder="Pick a tool..."></select>
            </div>
            <div class="buttons">
                <input type="button" value="clear()" id="button-clear">
                <input type="button" value="clearOptions()" id="button-clearoptions">
                <input type="button" value="addOption()" id="button-addoption">
                <input type="button" value="addItem()" id="button-additem">
                <input type="button" value="setValue()" id="button-setvalue">
            </div>
            <script>

                var formatName = function(item) {
                    return $.trim((item.id || '') + ' ' + (item.username || ''));
                };
                var queryData = [];
                var $select = $('#select-tools').selectize({
                    plugins: ['remove_button'],
                    maxItems: null,
                    valueField: 'id',
                    labelField: 'username',
                    searchField: 'id',
                    maxOptions:2,
//                    delimiter: ",",
                    options: [
//                        {id: 1, title: 'Spectrometer', url: 'http://en.wikipedia.org/wiki/Spectrometers'},
//                        {id: 2, title: 'Star Chart', url: 'http://en.wikipedia.org/wiki/Star_chart'},
//                        {id: 3, title: 'Electrical Tape', url: 'http://en.wikipedia.org/wiki/Electrical_tape'}
                    ],
                    create: false,
                    render: {
                        item: function(item, escape) {
                            var name = formatName(item);
                            return '<div>' +
                                    (name ? '<span class="name">' + escape(item.id) + '</span>' : '') +
                                    (item.username ? '<span >' + escape(item.username) + '</span>' : '') +
                                    '</div>';
                        },
                        option: function(item, escape) {
                            var name = item.id;
                            var label = name || item.username;
                            var caption = name ? item.psw : null;
                            return '<div>' +
                                    '<span class="label">' + escape(label) + '</span>' +
                                    (caption ? '<span class="caption">' + escape(caption) + '</span>' : '') +
                                    '</div>';
                        }
                    },
//                    score: function(search) {
//                        var score = this.getScoreFunction(search);
//                        return function(item) {
//                            return score(item) * (1 + Math.min(item.watchers / 100, 1));
//                        };
//                    },
                    load: function(query, callback) {
                        if (!query.length) return callback();
                        console.log("load");
                        $.ajax({
//                            url: 'http://localhost:8081/selectize/getUserById?userId=' + encodeURIComponent(query),
                            url: 'http://localhost:8081/user/all' ,
                            type: 'GET',
                            async: false,
                            error: function() {

                                callback();
                            },
                            success: function(res) {
                                callback(res);
                            }
                        });

                        queryData = query.split(",");

                        console.log("load2");
                        console.log(queryData);
                        console.log(this);
                        console.log("load3");
                    },
                    onLoad:function(data){
                        console.log("onLoad funciton");
                        console.log(data);
                        console.log(queryData);

                        addItem(data);
                    },
                    onKeyDown:function(e){
                        console.log("onKeyDown funciton");

                    }


                });

                // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

                var control = $select[0].selectize;

                $('#button-clear').on('click', function() {
                    control.clear();
                });

                $('#button-clearoptions').on('click', function() {
                    control.clearOptions();
                });

                $('#button-addoption').on('click', function() {
                    control.addOption({
                        id: 4,
                        title: 'Something New',
                        url: 'http://google.com'
                    });
                });

                $('#button-additem').on('click', function() {
                    control.addItem(2);
                });

                $('#button-setvalue').on('click', function() {
                    control.setValue([2, 3]);
                });

                function addItem(item){

                    for(var i=0,len=item.size;i<len;i++){
                        console.log("addItem"+i);
                        control.addItem(item[i]);
                    }

                }
            </script>
        </div>
    </div>

</div>

<footer class="footer">
    <div class="container">
        <p class="text-muted">©2016 fyunli</p>
    </div>
</footer>





<script>



</script>
</body>
</html>
