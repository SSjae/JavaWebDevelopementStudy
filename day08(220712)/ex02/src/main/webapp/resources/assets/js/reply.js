/**
	reply 관리할 모듈(module)
 */

//function create(){
//	return {brand:"Ferrari"}
//}
//const mycar = create();

//const mycar = (function create(){
//	return {brand:"Ferrari"}
//})();
//
//function factory(f){
//	return f();
//}
//factory(create);

const replyService = (function(){
	//reply : {댓글 정보} , callback : f1 , err : f2
	function insert(reply,callback,err){
		console.log("add reply....");
		//callback, err 는 외부에서 전달받을 함수이다.
		//자바스크립트는 함수의 파라미터 개수를 일치시킬 필요가 없기 때문에
		//사용시 callback이나 err와 같은 것은 상황에 따라 작성한다.
		
		$.ajax({
			type:"POST",
			url:"/reply/regist",
			data:JSON.stringify(reply),
			contentType:"application/json; charset=utf-8",
			success:function(result,status,xhr){
				if(callback){
					callback(result);//f1(result)
				}
			},
			error:function(){
				
			}
		})
	}
	
	function drop(replynum, callback, err){
		// /reply/123   /reply/3    /reply/16761
		$.ajax({
			type:"DELETE",
			url:"/reply/"+replynum,
			success:function(result,status,xhr){
				if(callback){
					callback(result)
				}
			},
			error:function(xhr,status,e){
				if(err){
					err(e);
				}
			}
		})
	}
	
	function update(reply,callback,err){
		$.ajax({
			type:"PUT",
			url:"/reply/"+reply.replynum,
			data:JSON.stringify(reply),
			contentType:"application/json; charset=utf-8",
			success:function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error:function(xhr,status,e){
				if(err){
					err(e);
				}
			}
		})
	}
	
	function selectAll(data,callback,err){
		let boardnum = data.boardnum;
		let pagenum = data.pagenum;
		
		$.getJSON(
			"/reply/pages/"+boardnum+"/"+pagenum+".json",
			//위의 uri의 JSON을 정상적으로 읽어왔다면 아래에 있는 함수를 호출해준다.
			//그 때 매개변수 data에 읽어온 json 내용이 담기게 된다.
			function(data){
				//data : {replyCnt:댓글개수, list:[ReplyDTO, ...]}
				if(callback){
					callback(data.replyCnt, data.list);
				}
			}
		).fail(
			function(xhr,status,e){
				if(err){
					err(e);
				}
			}
		)
	}
	function fmtTime(reply){
		let regdate = reply.regdate;
		let updatedate = reply.updatedate;
		let now = new Date();
		let check = regdate == updatedate;
		
		let dateObj = new Date(check?regdate:updatedate);
		
		let gap = now.getTime() - dateObj.getTime();
		
		let str = "";
		if(gap < 1000*60*60*24){
			let hh = dateObj.getHours();
			let mi = dateObj.getMinutes();
			let ss = dateObj.getSeconds();
			
			str = (hh>9?'':'0')+hh+":"+(mi>9?'':'0')+mi+":"+(ss>9?'':'0')+ss
		}
		else{
			let yy = dateObj.getFullYear();
			let mm = dateObj.getMonth()+1;
			let dd = dateObj.getDate();
			
			str = yy+"/"+(mm>9?'':'0')+mm+"/"+(dd>9?'':'0')+dd;
		}
		
		return (check?'':'(수정됨)')+str;
	}
	
	return {add:insert,getList:selectAll,remove:drop,modify:update,get:"",displayTime:fmtTime}
})();



















