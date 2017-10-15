<!DOCTYPE html>
<html>
<head>
    <#--<script src="/js/jquery.min.js"></script>-->
    <#--<script src="/js/bootstrap.min.js"></script>-->
    <meta charset="utf-8" />
    <title>Fancy Validate - jQuery UI Autocomplete</title>
    <link href="/js/jquery-ui/css/ui-lightness/jquery-ui-1.8.17.custom.css" rel="stylesheet" />
    <script src="/js/jquery-1.7.1.min.js"></script>
    <script src="/js/jquery-ui/js/jquery-ui-1.8.17.custom.min.js"></script>
    <script src="/js/jquery-ui/js/jquery-ui-widget-combobox.js"></script>
    <style>
        body {
            font-size: 14px;
        }
        fieldset {
            width: 388px;
            margin: 0 auto;
            text-align: right;
        }
        fieldset div {
            margin: 15px auto;
        }
        .cbo .ui-button-text {
            line-height: 1.3;
            padding-top: 0;
            padding-bottom: 0;
        }
        .cbo .ui-autocomplete-input {
            width: 7.2em;
        }
    </style>
    <script>
        $(function() {
            /* ajax autocomplete */
            // ajax 返回字符串数组
            $("#ajax1").autocomplete({
                source: "http://localhost:8081/ajax/arrayData",
                minLength: 2
            });
            // ajax 返回json数组
            $("#ajax2").autocomplete({
                source: "http://localhost:8081/ajax/jsonData",
                minLength: 2
            });


            /* local source autocomplete */
            // 本地字符串数组
            var availableTags = [
			    "C#",
			    "C++",
			    "Java",
			    "JavaScript",
			    "ASP",
                "ASP.NET",
			    "JSP",
			    "PHP",
			    "Python",
			    "Ruby"
		    ];
            $("#local1").autocomplete({
                source: availableTags
                /*, select: function(e, ui) {
                alert(ui.item.value) 
                }*/
            })
            ;
            /*$("#local1").bind("autocompleteselect", function(e, ui) {
                alert(ui.item.value);
            });*/
            // 本地json数组
            var availableTagsJSON = [
			    { label: "C# Language", value: "C#" },
			    { label: "C++ Language", value: "C++" },
			    { label: "Java Language", value: "Java" },
			    { label: "JavaScript Language", value: "JavaScript" },
			    { label: "ASP.NET", value: "ASP.NET" },
			    { label: "JSP", value: "JSP" },
			    { label: "PHP", value: "PHP" },
			    { label: "Python", value: "Python" },
			    { label: "Ruby", value: "Ruby" }
		    ];
            $("#local2").autocomplete({
                source: availableTagsJSON
            })
            ;

            /* custom source autocomplete */
            // 自定义source函数
            var hosts = ["gmail.com", "live.com", "hotmail.com", "yahoo.com", "cnblogs.com", "火星.com", "囧月.com"];
            $("#email1").autocomplete({
                autoFocus: true,
                source: function(request, response) {
                    var term = request.term, //request.term为输入的字符串
                        ix = term.indexOf("@"),
                        name = term, // 用户名
                        host = "", // 域名
                        result = []; // 结果

                    result.push(term);
                    // result.push({ label: term, value: term }); // json格式
                    if (ix > -1) {
                        name = term.slice(0, ix);
                        host = term.slice(ix + 1);
                    }
                    if (name) {
                        var findedHosts = (host ? $.grep(hosts, function(value) {
                            return value.indexOf(host) > -1;
                        }) : hosts),
                        findedResults = $.map(findedHosts, function(value) {
                            return name + "@" + value; //返回字符串格式
                            // return { label: name + " @ " + value, value: name + "@" + value }; // json格式
                        });
                        result = result.concat($.makeArray(findedResults));
                    }
                    response(result); //呈现结果
                }
            });

            /* jsonp autocomplete */
            // 自定义source函数
            $("#jsonp").autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url: "http://ws.geonames.org/searchJSON",
                        dataType: "jsonp",
                        data: {
                            featureClass: "P",
                            style: "full",
                            maxRows: 12,
                            name_startsWith: request.term
                        },
                        success: function(data) {
                            response($.map(data.geonames, function(item) {
                                return {
                                    label: item.name + (item.adminName1 ? ", " + item.adminName1 : "") + ", " + item.countryName,
                                    value: item.name
                                }
                            }));
                        }
                    });
                },
                minLength: 2
                /*, select: function( event, ui ) {
                log( ui.item ?
                "Selected: " + ui.item.label :
                "Nothing selected, input was " + this.value);
                },*/
            });

            /* multi value autocomplete */
            // 按逗号分隔多个值
            function split(val) {
                return val.split(/,\s*/);
            }
            // 提取输入的最后一个值
            function extractLast(term) {
                return split(term).pop();
            }
            // 按Tab键时，取消为输入框设置value
            function keyDown(event) {
                if (event.keyCode === $.ui.keyCode.TAB &&
						$(this).data("autocomplete").menu.active) {
                    event.preventDefault();
                }
            }
            var options = {
                // 获得焦点
                focus: function() {
                    // prevent value inserted on focus
                    return false;
                },
                // 从autocomplete弹出菜单选择一个值时，加到输入框最后，并以逗号分隔
                select: function(event, ui) {
                    var terms = split(this.value);
                    // remove the current input
                    terms.pop();
                    // add the selected item
                    terms.push(ui.item.value);
                    // add placeholder to get the comma-and-space at the end
                    terms.push("");
                    this.value = terms.join(", ");
//                    // 这里的this指向当前输入框的DOM元素
//                    // event参数是事件对象
//                    // ui对象只有一个item属性，对应数据源中被选中的对象
//                    $(this).val(ui.item.label) ;
                    $("#ajax3-value").val( this.value  );
//
//                    // 必须阻止事件的默认行为，否则autocomplete默认会把ui.item.value设为输入框的value值
//                    event.preventDefault();
                    return false;
                }
            };
            // 多个值，本地数组
            $("#local3").bind("keydown", keyDown)
                .autocomplete($.extend(options, {
                    minLength: 2,
                    source: function(request, response) {
                        // delegate back to autocomplete, but extract the last term
                        response($.ui.autocomplete.filter(
						    availableTags, extractLast(request.term)));
                    }
                }));
            // 多个值，ajax返回json
            $("#ajax3").bind("keydown", keyDown)
                .autocomplete($.extend(options, {
                    minLength: 2,
                    source: function(request, response) {
                        $.getJSON("http://localhost:8081/ajax/jsonData", {
                            term: extractLast(request.term)
                        }, response);
                    }
                }));

            /* combobox autocomplete */
            $("#combo1").combobox();
        });
    </script>
</head>
<body>
    <form action="?" id="fancyform">
    <fieldset>
        <legend>jQuery UI Autocomplete</legend>
        <div>
            ajax返回数组(随便输)：<input id="ajax1" type="text" />
        </div>
        <div>
            ajax返回JSON(随便输)：<input id="ajax2" type="text" />
        </div>
        <div>
            本地数组(输入如：ja,sc等)：<input id="local1" type="text" />
        </div>
        <div>
            本地JSON(输入如：ja,sc等)：<input id="local2" type="text" />
        </div>
        <div>
            JSONP(输入如：bejing)：<input id="jsonp" type="text" />
        </div>
        <div>
            Email(随便输)：<input id="email1" type="text" />
        </div>
        <div>
            多个值，本地数组(输入如：ja,sc等)：<input id="local3" type="text" />
        </div>
        <div>
            多个值，ajax返回JSON(随便输)：<input id="ajax3" type="text" />
            <br>
            实际值：<input id="ajax3-value" type="text" />

        </div>
        <div class="cbo">
            Combobox(选择)：<select id="combo1">
                <option value="">请选择</option>
                <option value="1">地球</option>
                <option value="2">月球</option>
                <option value="3">火星</option>
            </select>
        </div>
    </fieldset>
    </form>
</body>
</html>
