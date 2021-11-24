
<%@page import="Model.DAO"%>

<%@page import="Model.RecipeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="jquery-3.6.0.min.js"></script>
</head>
<style>
html {
            background-color: rgba(18, 18, 18, 1);
        }
        
        header {
            width: 100%;
            height: 100px;
            margin: 0 auto;
            background-color: rgba(18, 18, 18, 1);
        }
        
        .head_text {
            color: white;
            text-align: center;
            font-size: 25px;
            font-style: italic;
            font-weight: 800;
            padding-top: 35px;
        }
        
        .back_btn {
            width: 20px;
            height: 20px;
            background-color: rgba(18, 18, 18, 1);
            padding: 0px;
            padding-top: 40px;
            border: 0px;
            position: absolute;
        }
        
        button {
            background-color: black;
            padding: 0px;
            border: 0px;
            float: left;
            display: block;
            width: 30px;
        }
        
        .layout {
            position: absolute;
            top: 0;
            left: 0;
            margin-top: 100px;
            width: 100%;
            height: 100%;
            opacity: .8;
            
        }
        
        #div_no1 {
            width: 100%;
            height: 20%;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            background: hsla(211, 96%, 62%, 1);
            background: linear-gradient(90deg, hsla(211, 96%, 62%, 1) 0%,
                hsla(295, 94%, 76%, 1) 100%);
            background: -moz-linear-gradient(90deg, hsla(211, 96%, 62%, 1) 0%,
                hsla(295, 94%, 76%, 1) 100%);
            background: -webkit-linear-gradient(90deg, hsla(211, 96%, 62%, 1) 0%,
                hsla(295, 94%, 76%, 1) 100%);
            filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#439CFB",
                endColorstr="#F187FB", GradientType=1);
            
        }
        
        #div_no2 {
            width: 100%;
            height: 20%;
            background: hsla(152, 100%, 50%, 1);
            background: linear-gradient(90deg, hsla(152, 100%, 50%, 1) 0%,
                hsla(186, 100%, 69%, 1) 100%);
            background: -moz-linear-gradient(90deg, hsla(152, 100%, 50%, 1) 0%,
                hsla(186, 100%, 69%, 1) 100%);
            background: -webkit-linear-gradient(90deg, hsla(152, 100%, 50%, 1) 0%,
                hsla(186, 100%, 69%, 1) 100%);
            filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#00FF87",
                endColorstr="#60EFFF", GradientType=1);
                
        }
        
        #div_no3 {
            width: 100%;
            height: 20%;
            background: hsla(217, 100%, 50%, 1);
            background: linear-gradient(90deg, hsla(217, 100%, 50%, 1) 0%,
                hsla(186, 100%, 69%, 1) 100%);
            background: -moz-linear-gradient(90deg, hsla(217, 100%, 50%, 1) 0%,
                hsla(186, 100%, 69%, 1) 100%);
            background: -webkit-linear-gradient(90deg, hsla(217, 100%, 50%, 1) 0%,
                hsla(186, 100%, 69%, 1) 100%);
            filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#0061FF",
                endColorstr="#60EFFF", GradientType=1);
                
        }
        
        #div_no4 {
            width: 100%;
            height: 20%;
            background: hsla(99, 75%, 75%, 1);
            background: linear-gradient(90deg, hsla(99, 75%, 75%, 1) 0%,
                hsla(15, 93%, 71%, 1) 100%);
            background: -moz-linear-gradient(90deg, hsla(99, 75%, 75%, 1) 0%,
                hsla(15, 93%, 71%, 1) 100%);
            background: -webkit-linear-gradient(90deg, hsla(99, 75%, 75%, 1) 0%,
                hsla(15, 93%, 71%, 1) 100%);
            filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#B2EF91",
                endColorstr="#FA9372", GradientType=1);
                
        }
        
        #div_no5 {
            width: 100%;
            height: 20%;
            background: hsla(340, 80%, 69%, 1);
            background: linear-gradient(90deg, hsla(340, 80%, 69%, 1) 0%,
                hsla(15, 93%, 71%, 1) 100%);
            background: -moz-linear-gradient(90deg, hsla(340, 80%, 69%, 1) 0%,
                hsla(15, 93%, 71%, 1) 100%);
            background: -webkit-linear-gradient(90deg, hsla(340, 80%, 69%, 1) 0%,
                hsla(15, 93%, 71%, 1) 100%);
            filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#EF709B",
                endColorstr="#FA9372", GradientType=1);
                
        }
        .resizer{
            position: relative;
            width: 100%;
            height: 1px;
            border-radius: 1px;
            background-color: black;
            z-index: 2;
        }
        .resizer.nw1{
            top: -1px;
            left: -1px;
            cursor: n-resize;
            
        }
        .resizer.nw2{
            top: -1px;
            left: -1px;
            cursor: n-resize;
        }
        .resizer.nw3{
            top: -1px;
            left: -1px;
            cursor: n-resize;
        }
        .resizer.nw4{
            top: -1px;
            left: -1px;
            cursor: n-resize;
        }
        .resizer.nw5{
            top: -1px;
            left: -1px;
            cursor: n-resize;
        }
        
</style>

<body>


<%
ArrayList<ArrayList> recipe_ratio=new ArrayList<>();
recipe_ratio=(ArrayList<ArrayList>)session.getAttribute("recipe_ratio");/* ���ǿ� �ִ� ArrayList ����� �� �ְ� ������ ���� */
ArrayList<String> names = new ArrayList<>();
ArrayList<Integer> ratios=new ArrayList<>();
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@������� �׽�Ʈ�� �ڵ�






//@@@@@@@@@@@@@@@@@@@@�������

%>
<div id="layout">
<%		
		names = recipe_ratio.get(0);
		/*RecipeGuideServiceCon ���� ������ recipe_ratio ArrayList���� ù��° ArrayList(��� ��) ��������  */
		
		ratios=recipe_ratio.get(1);%>
		<!-- RecipeGuideServiceCon ���� ������ recipe_ratio ArrayList���� �� ��° ArrayList(��� ����) �������� -->
			
		<%for(int i=0;i<ratios.size();i++){			
		%><div id="div_no<%=i%>"><%=names.get(i)%> 
		<div id="resizer nw<%=i%>"></div>
		</div>
			<%System.out.println("div"+i+"�������");
			}%><!-- ��� ������ŭ div ����� for��, ���� id="div_no0"~"div_no9" -->
		
			<script>
			
			/* ������ div ���̸� �޾ƿ� ������ ���� ���� */
			<%for(int i=0;i<ratios.size();i++){%>
			var h=<%=ratios.get(i)%>;
					document.getElementById("div_no"+<%=i%>).style.height=""+h+"%";
					<%System.out.println("div"+i+"������ ����");
					}%>
			</script>			
		</div>

	<script src="main.js">
        </script>
        <script type="text/javascript">
    let edited_ratio="";
    let edited_name="";
    function mouseup(){
		window.removeEventListener('mousemove', mousemove);
		window.removeEventListener('mouseup', mouseup);
        for(let i=0;i<<%=ratios.size()%>;i++){
        	if(i==ratios.size()){
  	      	 	edited_ratio=edited_ratio+e.clientHeight;        		
        	}else{
        		edited_ratio=edited_ratio+e.clientHeight+";";
        	}
        }
        <%String edited_name="";
        for(int i=0;i<names.size();i++){
        	if(i==names.size()){
       			edited_name=edited_name+names.get(i);
        	}else{
        		edited_name=edited_name+names.get(i)+";";
        	}
        }%>
        edited_name=<%=edited_name%>
      }
    var URL = "http://localhost:8081/FirstProject/saveMyRecipe?edited_name= "+edited_name +"&edited_ratio="+edited_ratio;
    var rtnVal = window.showModalDialog(URL, "", "dialogWidth:0; dialogHeight:0; help:no; status:no;");
    $("button").on("click",function () {
        //Ajax ���
        $.ajax({
            url : "http://localhost:8081/FirstProject/saveMyRecipe?edited_name="+edited_name +"&edited_ratio="+edited_ratio,     //����� �ּ�
            type : "get",        
            success:function(data){
                alert("Success");
                console.log(data);
                let getData=$("div").html(data);
            },
            error:function(){
                alert("Fail");
            }
        });

        
    });

	//��ũ������ �ȿ��� �����̷�Ʈ 
</script>
<button>�����ϱ�</button>

</body>
</html>