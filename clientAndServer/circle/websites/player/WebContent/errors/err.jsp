<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>404</title>
    <style>
        body{margin:0;padding:0;}
        #splash{background: #111a2d; position:fixed; width:100%; height:100%;}
        .contact{ width: 6rem; position: fixed;left: 50%;top: 50%;height: 2.3rem;margin: -1.15rem 0 0 -2.6rem;}
        .tp{float: left; width:2.04rem; height:2.31rem; background:url(/static/css/bull/404.png) no-repeat; background-size:100%}
        .nr{float: left; color: #fff;margin: 0.6rem 0 0 0.4rem;  }
        .nr p{padding: 0; margin: 0;  font-size: 0.24rem;  }
        .btn{background: #f65833;  height: 0.6rem;  width: 1.8rem;  border-radius: 0.1rem;  text-align: center;  line-height: 0.6rem;  font-size: 0.3rem;margin-top: 0.2rem;  }
    </style>
    <script>
        (function (doc, win) {
            var docEl = doc.documentElement,
                    resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
                    recalc = function () {
                        var isLanscape = window.orientation==180||window.orientation==0;
                        var clientWidth = isLanscape?docEl.clientHeight:docEl.clientWidth;
                        if (!clientWidth) return;
                        docEl.style.fontSize = 100 * (clientWidth  / 1280) + 'px';
                    };

            if (!doc.addEventListener) return;
            win.addEventListener(resizeEvt, recalc, false);
            doc.addEventListener('DOMContentLoaded', recalc, false);
        })(document, window);
    </script>
</head>
<body>
<div id="splash">
    <div class="contact">
        <div class="tp">
        </div>
        <div class="nr">
            <p>Sorry 您访问的页面弄丢了</p>
            <p style="font-size:0.18rem">您可以通过以下方式继续访问</span>
            <div class="btn">重新加载</div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var lanscaped =function(isLanscape){
        var hw = window.innerWidth;
        var hh = window.innerHeight;
        contain.style.width = (isLanscape?hh:hw) + 'px';
        contain .style.height = (isLanscape?hw:hh)+'px';
        contain.style["margin-top"] = (isLanscape?(hh-hw)/2 : 0) + 'px';
        contain.style["margin-left"] = (isLanscape?-(hh-hw)/2 : 0)+'px';
        contain.style.webkitTransform = contain .style.transform = (isLanscape?'rotateZ(90deg)':'');
    }
    var checSplash = function(){
        contain = document.getElementById('splash');
        var isLanscape = window.orientation==180||window.orientation==0;
        window.addEventListener("onorientationchange" in window ? "orientationchange" : "resize", function(){
            lanscaped(window.orientation==180||window.orientation==0);
        }, false);
        if(isLanscape){
            lanscaped(true);
        }else{
        }
    }
    checSplash();
</script>
</body>
</html>