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
		window.location.href = url;
	}
}