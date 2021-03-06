<%--@elvariable id="command" type="g.model.bet.vo.VBetDetailListVo"--%>
<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/include/include.inc.jsp" %>
<!--//region your codes 1-->

<!--//endregion your codes 1-->
<div class="row">
    <form:form action="${root}/currentReport/detail.html" method="post">

        <form:hidden path="search.ownerId" value="${command.ownerId}" />
        <form:hidden path="search.sysUserId" value="${command.sysUserId}" />
        <form:hidden path="search.gameId" value="${command.gameId}" />
        <form:hidden path="search.gameModelId" value="${command.gameModelId}" />

        <div id="validateRule" style="display: none">${command.validateRule}</div>

        <div class="position-wrap clearfix">
            <h2>
                <a class="navbar-minimalize" href="javascript:void(0)">
                    <i class="icon iconfont">&#xe610;</i>
                </a>
            </h2>
            <span>${views.sysResource['报表']}</span>
            <span>/</span>
            <span>今日报表</span>
            <soul:button target="goToLastPage" refresh="true" cssClass="m-l-sm btn btn-outline btn-default btn-xs co-gray6 return-btn" text="" opType="function">
                <em class="fa fa-caret-left"></em>${views.common['return']}
            </soul:button>
        </div>

        <div class="col-lg-12">
            <div class="wrapper white-bg shadow">
                <div class="clearfix filter-wraper border-b-1">
                    <div class="pull-right">
                        <a id="export" class="btn btn-outline btn-filter">
                            <span class="hd">导出</span>
                        </a>
                    </div>
                </div>

                <div class="search-list-container">
                    <%@ include file="IndexPartial.jsp" %>
                </div>

            </div>
        </div>
    </form:form>
</div>

<!--//region your codes 3-->
<soul:import res="site/playerstatistics/currentReport/DetailList"/>
<!--//endregion your codes 3-->