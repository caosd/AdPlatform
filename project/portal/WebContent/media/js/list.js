function perPage(){
	var pageNum = $('#pageNum').val();
	pageNum=parseInt(pageNum)- 1;
	$('#pageNum').val(pageNum);
	$('#searchForm').submit();
}

function nextPage(){
	var pageNum = $('#pageNum').val();
	pageNum=parseInt(pageNum) +1;
	$('#pageNum').val(pageNum);
	$('#searchForm').submit();
}

function deleteData(url){
	if(confirm("确认删除该记录？")){
		$('#searchForm').submit(url);
	}
}

$(document).ready(function(){ 
	//页面查询列表，选择一页显示的行数
	$('#searchForm select[name=pageSize]').change(function(){ 
		$("#searchForm").submit();
	}) 
})