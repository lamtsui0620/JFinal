<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/head.jsp"%>
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-sm-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>自定义响应式表格</h5>
					<div class="ibox-tools">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a> <a class="dropdown-toggle" data-toggle="dropdown"
							href="table_basic.html#"> <i class="fa fa-wrench"></i>
						</a>
						<ul class="dropdown-menu dropdown-user">
							<li><a href="table_basic.html#">选项1</a></li>
							<li><a href="table_basic.html#">选项2</a></li>
						</ul>
						<a class="close-link"> <i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content">
					<div class="row">
		                    <div class="ibox-content">
		                        <form role="form" id="form1" class="form-inline" action="list">
		                        	<input type="hidden" name="pageNumber" value="1">
		                            <div class="form-group">
		                                <label for="userCode" class="sr-only">用户账号</label>
		                                <input id="userCode" type="text" placeholder="请输入用户账号" name="user.userCode" value="${user.userCode }" class="form-control">
		                            </div>
		                            <div class="form-group">
		                                <label for="userName" class="sr-only">用户名</label>
		                                <input id="userName" type="text" placeholder="请输入用户名" name="user.userName" value="${user.userName}" class="form-control">
		                            </div>
									<button type="submit" class="btn btn-primary">搜索</button>
		                        </form>
		                    </div>
					</div>
					<div class="row">
						<div class="col-sm-4 m-b-xs">
							<div class="btn-group hidden-xs" id="exampleToolbar" role="group">
                                    <button type="button" onclick="add();" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-heart" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                    </button>
                             </div>
						</div>
					</div>
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th></th>
									<th>访问时间</th>
									<th>用户账号</th>
									<th>用户名称</th>
									<th>IP地址</th>
									<th>操作平台</th>
									<th>浏览器</th>
									<th>通过</th>
									<th>访问信息</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.list}" var="v">
									<tr>
										<td><input type="radio" class="i-checks"
											name="checksIds" value="${v.id}"></td>
										<td>${fn:substring(v.createTime, 0, 19)}</td>
										<td>${v.userCde}</td>
										<td>${v.userName}</td>
										<td>${v.ipAddress}</td>
										<td>${v.browser}</td>
										<td>${v.browser}</td>
										<td>${v.isPass}</td>
										<td><c:if test="${not empty v.operInfo }">${v.operInfo }</c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div id="page"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	formatBrowserAndMac();
});

function conRole(id){
	location.href = "conRole?id="+id;
}

function formatBrowserAndMac() {
	var oCheckBox = $("input[name='checksIds']");
	oCheckBox.each(function() {
		var oBrowser = $(this).parent("td").siblings("td").eq(4);
		var oMac = $(this).parent("td").siblings("td").eq(5);
		oBrowser.html(infoFormat(oBrowser.html(), 'browser'));
		oMac.html(infoFormat(oMac.html(), 'mac'));
	});
}

function infoFormat(code, type) {
	var name = '';
	if(type == 'browser') {
		if(code.indexOf("Firefox") != -1)
			name="Firefox";
		else if(code.indexOf("Edge") != -1)
			name="Microsoft Edge";
		else if(code.indexOf("Chrome") != -1)
			name="Chrome";
		else if(code.indexOf("MicroMessenger") != -1)
			name="Wechat";
		else if(code.indexOf("MSIE") != -1)
			name="IE";
		else
			name="UnKnown";
	} else if(type == 'mac'){
		if(code.indexOf("Windows") != -1)
			name="Windows";
		else if(code.indexOf("Android") != -1)
			name="Android";
		else if(code.indexOf("iPhone") != -1)
			name="iPhone";
		else if(code.indexOf("Linux") != -1)
			name="Linux";
		else
			name="UnKnown";
	}
	return name;
}
</script>
<%@ include file="/common/footer.jsp"%>
