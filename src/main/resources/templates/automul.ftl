<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>jQuery UI Autocomplete - Multiple, remote</title>
    <link rel="stylesheet" href="/js/jquery-ui-1.12.1/jquery-ui.css">
    <#--<link rel="stylesheet" href="/resources/demos/style.css">-->
    <style>
        .ui-autocomplete-loading {
            background: white url("img/ui-anim_basic_16x16.gif") right center no-repeat;
        }
    </style>
    <script src="/js/jquery.js"></script>
    <script src="/js/jquery-ui-1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
            function split( val ) {
                val.replace(/;\s*/,',');
                return val.split( /,\s*/ );
            }
            function extractLast( term ) {
                return split( term ).pop();
            }


            //在JSON对象数组查询 指定值对象
            function getItem(array,n,v){
                var obj ;
                for (var i = 0; i < array.length; i++){
                    if (array[i]["value"]==v){
                        obj = array[i];
                       return obj;
                    }
                }
                return obj;
            }

            function getItemView(data,term){
                var itemView = [] ;
                var valArray = extractLast(term);
                for(var j = 0; j < valArray.length(); j++){
                    for (var i = 0; i < data.length; i++){
                        if (data[i]["value"]==v){
                            itemView.push(data[i].label);
                        }
                    }
                }
                return itemView;

            }


            //值转换成对应标签
            function itemView(data, v){
                var obj = getItem(data,"value",v)
                if(obj){
                    return obj.label;
                }
            }

            var sourceData = [];
            $( "#birds" )
            // don't navigate away from the field on tab when selecting an item
                    .on( "keydown", function( event ) {
                        if ( event.keyCode === $.ui.keyCode.TAB &&
                                $( this ).autocomplete( "instance" ).menu.active ) {
                            event.preventDefault();
                        }
                    })
                    .autocomplete({
                        source: function( request, response ) {
                            $.getJSON( "http://localhost:8081/selectize/getByLike",
                                    { term: extractLast( request.term )
                            }, response );
                        },
                        search: function() {
                            // custom minLength
                            var term = extractLast( this.value );
                            if ( term.length < 2 ) {
                                return false;
                            }
                        },
                        focus: function() {
                            // prevent value inserted on focus
                            return false;
                        },
                        response:function(event, ui){
                            console.log("response function enter");
                            console.log(this.value);
                            var inputVals = this.value;
                            if(inputVals.indexOf(";") != -1){
                                var ids = extractLast(inputVals);
                                $.ajax({
                                    url: 'http://localhost:8081/selectize/getByMulIds' ,
                                    data: {id:ids.join(',')},
                                    type: 'GET',
                                    async: false,
                                    error: function() {
                                        console.log(" >>>多值复制 后查询出错 ");
                                    },
                                    success: function(res) {
                                        console.log(" >>>多值复制 后查询结果 ");
                                        console.log(res);
//                                        var source = $( "#birds" ).autocomplete( "option", "source" );
                                        var itemViews = getItemView(res,inputVals);
                                        this.value = itemViews.join(",");

                                    }
                                });
                            }
                            console.log("response function exit");
//
//
//                            var terms = split( this.value );
//                            var source = $( "#birds" ).autocomplete( "option", "source" );
//                            terms.pop();
//                            var viewItems = getItemView(source,value);
                        },
                        select: function( event, ui ) {
                            console.log("select  function exit");
                            var terms = split( this.value );
                            console.log(this.value);
                            console.log(ui.item.value);
                            // remove the current input
                            terms.pop();
                            // add the selected item
                            var data ={};
                            var url = "http://localhost:8081/selectize/getByLike" ;
                            $.ajax({
                                url: url ,
                                data: {term:ui.item.value},
                                type: 'GET',
                                async: false,
                                error: function() {
                                    console.log(" >>>aaa ");
                                },
                                success: function(res) {
                                    console.log(" >>>aaa ");
                                    $('#birds-json').val(JSON.stringify(res));
                                }
                            });
//                            $.getJSON(
//                                url,
//                                {term:ui.item.value},
//                                function(res){
//                                    $('#birds-json').val(JSON.stringify(res));
//                                }
//                            );
                            var jsonStr = $('#birds-json').val();
                            console.log(jsonStr);
                            data = JSON.parse(jsonStr);
                            var label = itemView(data,ui.item.value );
                            terms.push( label);
                            // add placeholder to get the comma-and-space at the end
                            terms.push( "" );
                            this.value = terms.join( ", " );
                            return false;
                        }
                    });
        } );
    </script>
</head>
<body>

<div class="ui-widget">
    <label for="birds">Birds: </label>
    <input id="birds" size="50">
    <input id="birds-val" type ="text"/>
    <input id="birds-json" type="text"/>
</div>


</body>
</html>