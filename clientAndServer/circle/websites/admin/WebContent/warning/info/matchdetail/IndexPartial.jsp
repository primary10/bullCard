<%--@elvariable id="command" type="g.model.warning.vo.PlayerWarningMultipleListVo"--%>
<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/include/include.inc.jsp" %>

<!--//region your codes 1-->
<div class="table-responsive table-min-h ">
    <table class="table table-striped table-bordered table-hover dataTable" aria-describedby="editable_info">
        <thead>
            <tr>
                <th class="inline">序号</th>
                <th class="inline">玩家</th>
                <th class="inline">派彩盈亏金额</th>
                <th class="inline">有效交易金额</th>
                <th class="inline">赛事开始时间</th>
                <th class="inline">赛事结束时间</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${command.result}" var="p" varStatus="status">
                <tr>
                    <td>${(command.paging.pageNumber-1)*command.paging.pageSize+(status.index+1)}</td>
                    <td>${p.username}</td>
                    <td>${p.profitAmount}</td>
                    <td>${p.effectiveAmount}</td>
                    <td>${soulFn:formatDateTz(p.beginTime, DateFormat.DAY_SECOND, timeZone)}</td>
                    <td>${soulFn:formatDateTz(p.endTime, DateFormat.DAY_SECOND, timeZone)}</td>
                </tr>
            </c:forEach>
            <c:if test="${fn:length(command.result)<1}">
                <tr>
                    <td colspan="6" class="no-content_wrap">
                        <div>
                            <i class="fa fa-exclamation-circle"></i> ${views.common['noResult']}
                        </div>
                    </td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>

<soul:pagination/>
<!--//endregion your codes 1-->
