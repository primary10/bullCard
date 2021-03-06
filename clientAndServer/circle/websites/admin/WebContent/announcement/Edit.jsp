<%--@elvariable id="command" type="g.model.announcement.vo.GameAnnouncementVo"--%>
<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/include/include.inc.jsp" %>
<!--//region your codes 1-->

<!--//endregion your codes 1-->

<html lang="zh-CN">
<head>
    <title>编辑</title>
    <%@ include file="/include/include.head.jsp" %>
    <!--//region your codes 2-->

    <!--//endregion your codes 2-->
</head>

<body>

<form:form id="editForm" action="${root}/gameAnnouncement/edit.html" method="post">
    <form:hidden path="result.id" />
    <div id="validateRule" style="display: none">${command.validateRule}</div>

    <!--//region your codes 3-->
    <div class="">
        <soul:button cssClass="btn btn-default" text="保存" opType="ajax" dataType="json" target="${root}/gameAnnouncement/persist.html" precall="validateForm" post="getCurrentFormData" callback="saveCallbak" />
        <soul:button cssClass="btn btn-default" text="删除" opType="ajax" dataType="json" target="${root}/gameAnnouncement/delete.html?id=${result.id}" callback="deleteCallbak" confirm="您确定要删除该条记录吗？" />
    </div>

    <div class="table-responsive">
        <div class="">游戏公告表</div>
        <table class="table table-condensed table-hover table-bordered">
        </table>
    </div>
    <!--//endregion your codes 3-->

</form:form>

</body>
<%@ include file="/include/include.js.jsp" %>
<!--//region your codes 4-->
<soul:import type="edit"/>
<!--//endregion your codes 4-->
</html>