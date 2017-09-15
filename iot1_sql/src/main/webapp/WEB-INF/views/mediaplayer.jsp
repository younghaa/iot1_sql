<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="k-moonlight">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="This KendoMediaPlayer example demonstrates the basic functionality of the widget. With jQuery-based MediaPlayer widget in Kendo UI, you can add media content to your web site">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <title>jQuery MediaPlayer control example | KendoMediaPlayer Demo</title>
    <link href='//fonts.googleapis.com/css?family=Roboto+Slab:400,700' rel='stylesheet'>
    <link rel="shortcut icon" href="/jsp-ui/favicon.ico"/>
    <link rel="canonical" href="http://demos.telerik.com/jsp-ui/mediaplayer/index" />
<link href="https://kendo.cdn.telerik.com/2017.3.913/styles/kendo.common.min.css" rel="stylesheet" />
<link href="https://kendo.cdn.telerik.com/2017.3.913/styles/kendo.rtl.min.css" rel="stylesheet" />
<link href="https://kendo.cdn.telerik.com/2017.3.913/styles/kendo.moonlight.min.css" rel="stylesheet" />
    <link href="/jsp-ui/content/shared/styles/examples.css" rel="stylesheet" />



        <script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
        <script src="https://kendo.cdn.telerik.com/2017.3.913/js/kendo.all.min.js"></script>
        <script src="https://kendo.cdn.telerik.com/2017.3.913/js/kendo.timezones.min.js"></script>



    <script src="/jsp-ui/content/shared/js/kendo-dojo.js"></script>
    <script src="/jsp-ui/content/shared/js/console.js"></script>
    <script src="/jsp-ui/content/shared/js/prettify.js"></script>
    <!-- <![if gte IE 8]>-->
    <script src="/jsp-ui/content/shared/inspector/inspector.js"></script>
    <link href="/jsp-ui/content/shared/inspector/inspector.css" rel="stylesheet" />
    <!--<![endif]-->
</head>
<body>
<script src="/jsp-ui/content/shared/js/example-datasources.js"></script>
<script src="/jsp-ui/content/shared/js/web-examples.js"></script>
        
    <h1 id="exampleTitle">
            <span class="exampleIcon mediaPlayerIcon"></span>
            <strong>MediaPlayer</strong></h1>
<div id="example">
    <div class="demo-section k-content wide" style="max-width: 644px;">
        <div id="mediaplayer" style="height:360px"></div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#mediaplayer").kendoMediaPlayer({
                autoPlay: true,
                navigatable: true,
                media: {
                    title: "아이린",
                    source: "https://youtu.be/_6qGc0-q59U"
                }
            });
        });
    </script>
</div>
        <script>
            $(function(){ $("#exampleWrap").css("visibility", ""); });
        </script>
    </div>

<!--widget inspector-->
    <script>$(document).ready(function(){

        function kendoWidgetInstance(el) {
            el = $(el);
            return kendo.widgetInstance(el, kendo.ui) ||
                kendo.widgetInstance(el, kendo.mobile.ui) ||
                kendo.widgetInstance(el, kendo.dataviz.ui);
        }

        var widgets = [];
        var datasource = [];

        function haveWidget(w) {
            for (var i = widgets.length; --i >= 0;)
                if (widgets[i] === w) return true;
            return false;
        }

        $("#exampleWrap *").each(function(){
            var w = kendoWidgetInstance(this);
            if (w && !haveWidget(w)) {
                datasource.push({
                    name   : w.options.name,
                    index  : widgets.length
                });
                widgets.push(w);
            }
        });

        if (widgets.length == 0) {
            $("#inspector-container, .inspector-tab").hide();
        } else if (kendo.ui.Inspector) {
            $("#inspector-widgets").kendoDropDownList({
                dataSource     : datasource,
                dataTextField  : "name",
                dataValueField : "index",
                value          : 0,
                change         : function() {
                    inspector.reset(widgets[this.value()]);
                }
            });
            var inspector = $("#inspector").kendoInspector({
                showPicker : false,
                showEvents : false,
                docBaseUrl : "http://docs.telerik.com/kendo-ui/api/wrappers/jsp/mediaplayer",
                widget     : widgets[0]
            }).data("kendoInspector");
        }

    })</script>
<!--/widget inspector-->

 <div id="footer">
     <div class="copyright">
         <p>Copyright &copy; 2017 Progress Software Corporation and/or its subsidiaries or affiliates. All Rights Reserved.</p>
    </div>
</div>

</div>

<script>
    $(window).on("resize", function() {
      kendo.resize($(".k-chart"));
    });
    
    $(".try-kendo").click(function(e) {
        window.dojo.postSnippet($('#source-code-1').data('html'), window.location.href);
    });

    setTimeout(function(){ prettyPrint(); }, 100);
</script>

</body>
</html>
    