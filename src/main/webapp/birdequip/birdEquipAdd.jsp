<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TbirdEquip" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="jb" uri="http://www.jb.cn/jbtag"%>  
<script type="text/javascript">
	$(function() {
	 parent.$.messager.progress('close');
		$('#form').form({
			url : '${pageContext.request.contextPath}/birdEquipController/add',
			onSubmit : function() {
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				var isValid = $(this).form('validate');
				if (!isValid) {
					parent.$.messager.progress('close');
				}
				return isValid;
			},
			success : function(result) {
				parent.$.messager.progress('close');
				result = $.parseJSON(result);
				if (result.success) {
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;">	
		<form id="form" method="post">		
				<input type="hidden" name="id"/>
			<table class="table table-hover table-condensed">
				<tr>													
					<th><%=TbirdEquip.ALIAS_NAME%></th>	
					<td>
											<input class="span2" name="name" type="text"/>
					</td>	
					<th><%=TbirdEquip.ALIAS_GROUP_TYPE%></th>	
					<td>
											<jb:select dataType="GP" name="groupType"></jb:select>	
					</td>	
											
				</tr>	
					
				<tr>	
					<th><%=TbirdEquip.ALIAS_PWD%></th>	
					<td>
											<input class="span2" name="pwd" type="text"/>
					</td>						
					<th><%=TbirdEquip.ALIAS_DTUTYPE%></th>	
					<td>
											<input class="span2" name="dtutype" type="text"/>
					</td>							
				</tr>	
				<tr>	
					<th><%=TbirdEquip.ALIAS_STATUS%></th>	
					<td>
											<jb:select dataType="ST" name="status"></jb:select>	
					</td>	
					<th><%=TbirdEquip.ALIAS_EQUIP_TYPE%></th>	
					<td>
											<jb:select dataType="ET" name="equipType"></jb:select>	
					</td>																		
				</tr>
				<tr>	
											
					<th><%=TbirdEquip.ALIAS_LOCATION%></th>	
					<td colspan="3">
											<input class="span2" name="location" type="text" style="width:80%"/>
					</td>	
										
				</tr>	
				<tr>	
					<th><%=TbirdEquip.ALIAS_REMARK%></th>	
					<td colspan="3">
											<textarea class="span2" name="remark" style="width:80%"></textarea>
					</td>							
										
				</tr>	
				
			</table>		
		</form>
	</div>
</div>