package com.stomato.utils;

public class Pager {
	
	private int pageCount;
	private int rows;
	private int curPage;
	private int records;
	
	public Pager(int rows,int curPage,int records){

		this.rows = rows;
		this.curPage = curPage;
		this.records = records;

		pageCount=records / rows ;
		int mod=records % rows ;
		if(mod > 0){
			pageCount++;
		}
	}
	
	public String toString(){
		String pagerHtml = "<ul class=\"pages\">";
		if (curPage > 1){
			pagerHtml+=("<li class=\"prev\"><a href=\"javascript:void(0);\" class=\"btn mini tertiary\" rel=\"prev\" onclick=\"changePage("+(curPage - 1)+")\">←</a></li>");
		}else{
			pagerHtml+=("<li class=\"prev\"><a href=\"javascript:void(0);\" class=\"btn mini tertiary disabled\" rel=\"prev\">←</a></li>");
		}
		int limit_s = 1;
		int limit_e = 1;
	    if (curPage <= 5){
	    	limit_s = 1;
	    }
	    else{
	    	limit_s = curPage - 4;
	    }
	    if (pageCount > limit_s + 5){
	    	limit_e = limit_s + 5;
	    }
	    else{
	        limit_e = pageCount;
	    }
	    for(int i = limit_s; i < limit_e + 1;i++){
	    	if (curPage == i)
	    		pagerHtml+=("<li><a href=\"javascript:void(0);\" class=\"btn mini tertiary disabled\">"+curPage+"</a></li>");
	        else
	        	pagerHtml+=("<li ><a href=\"javascript:void(0);\" class=\"btn mini tertiary\" onclick=\"changePage("+(i)+")\">"+i+"</a></li>");
	    }
	    if (curPage < pageCount){
	    	pagerHtml+=("<li class=\"next\"><a href=\"javascript:void(0);\" class=\"btn mini tertiary\" rel=\"next\" onclick=\"changePage("+(curPage + 1)+")\">→</a></li>");
	    }else{
	    	pagerHtml+=("<li class=\"next\"><a href=\"javascript:void(0);\" class=\"btn mini tertiary disabled\" rel=\"next\">→</a></li>");
	    }
	    pagerHtml+="</ul>";
	    pagerHtml+="<script>"+
					"function changePage(cur_page){"+
						"if( !cur_page ){"+
							"cur_page = 1;"+
						"}"+
						"var $FORM = $(\"form:first\");"+
						"var action = $FORM.attr(\"action\") + \"?p=\" + cur_page;"+
						"$FORM.attr(\"action\",action).submit(); " +
						"return false;"+
					"}"+
				   "</script>";
	    return pagerHtml;
	};
}
