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
    <#--<script src="/js/ga.js"></script>-->
</head>
<body>
<div class="container">
    <h1>Click Edit Row</h1>
    <table id="table"
           data-toggle="table"
           data-click-edit="true"
           data-unique-id="treeId"
           data-url="/json/data1.json">
        <thead>
        <tr>
            <th data-field="id">ID</th>
            <th data-field="name" data-editable="input">Item Name</th>
            <th data-field="price" data-editable="select">Item Price</th>
        </tr>
        </thead>
    </table>
</div>
<script>
    $(function () {
        //Setup options for your 'Select'options, obj name must same as your data-field name.
        $.selectArray=
                {price: [{idxNum: '$', name: '100'}, {idxNum: '$', name: '500'}, {idxNum: 'NT$', name: '1000'}, {idxNum: 'NT$', name: '2500'}, {idxNum: 'NT$', name: '5000'}],
                    name: [{idxNum: 1, name: 'Jenny'}, {idxNum: 2, name: 'Aby'}, {idxNum: 3, name: 'Martin'}, {idxNum: 4, name: 'Hellen'}, {idxNum: 5, name: 'Steve'}]};

        $('#table').bootstrapTable(); // init via javascript

        $(window).resize(function () {
            $('#table').bootstrapTable('resetView');
        });
    });
</script>
</body>
</html>
