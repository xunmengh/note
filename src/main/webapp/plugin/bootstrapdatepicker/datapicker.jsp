<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <title>datapicker</title>
    <link rel="stylesheet" href="/plug-in/report/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/plug-in/report/bootstrapdatepicker/css/bootstrap-datetimepicker.min.css" />
    <script type="text/javascript" src="/plug-in/report/jquery.min.js"></script>
    <script type="text/javascript" src="/plug-in/report/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/plug-in/report/bootstrapdatepicker/moment.min.js"></script>
    <script type="text/javascript" src="/plug-in/report/bootstrapdatepicker/moment.zh-cn.js"></script>
    <script type="text/javascript" src="/plug-in/report/bootstrapdatepicker/js/bootstrap-datetimepicker.min.js"></script>
</head>
<body>


<div class="container">
    <div class="row">
        <div class='col-sm-4'>
            <div class="row">
                <div class="col-sm-12 change-width" style="padding-right: 5px;" >
                    <input type='text' class="form-control" id='startDatePicker' />
                </div>
                <div class="col-sm-6" style="padding-left: 5px; display: none;" id="startSeasonDiv">
                    <select class="form-control" id="startSeasonSel">
                        <option value="1" selected>第一季度</option>
                        <option value="2">第二季度</option>
                        <option value="3">第三季度</option>
                        <option value="4">第四季度</option>
                    </select>
                </div>
            </div>
        </div>
        <div class='col-sm-4'>
            <div class="row">
                <div class="col-sm-12 change-width" style="padding-right: 5px;">
                    <input type='text' class="form-control" id='endDatePicker' />
                </div>
                <div class="col-sm-6" style="padding-left: 5px;display: none;" id="endSeasonDiv">
                    <select class="form-control " id="endSeasonSel">
                        <option value="1" selected>第一季度</option>
                        <option value="2">第二季度</option>
                        <option value="3">第三季度</option>
                        <option value="4">第四季度</option>
                    </select>
                </div>
            </div>
        </div>
        <div class='col-sm-4'>
                <button type="button" class="btn btn-default" id="days"  format="YYYYMMDD" range="1">日</button>
                <button type="button" class="btn btn-default" id="months" format="YYYYMM" range="2">月</button>
                <button type="button" class="btn btn-default" id="season" format="YYYY" range="3">季</button>
                <button type="button" class="btn btn-default" id="years" format="YYYY" range="4">年</button>
            <a type="button" href="#" class="btn btn-default" id="rq" >日期</a>
        </div>

        <script type="text/javascript">
            $(function () {

                var rq="1|20160101-20161011";

                var range=1;
                var start="";
                var end="";
                var startSeason="";
                var endSeason="";

                if(rq){
                    var rqs=rq.split("|");//
                    range=rqs[0];
                    start=rqs[1].split("-")[0];
                    end=rqs[1].split("-")[1];
                    if(range=="3"){
                        startSeason=start.substr(-1,1);//截取最后一位
                        start=start.substr(0,start.length-1);
                        endSeason=end.substr(-1,1);//截取最后一位
                        end=end.substr(0,end.length-1);
                    }
                }

                var $startDate=$('#startDatePicker').datetimepicker({
                    format: 'YYYYMM',
                    locale:'zh-cn',
                    maxDate:new Date()
                });

                var $endDate=$('#endDatePicker').datetimepicker({
                    format: 'YYYYMM',
                    locale:'zh-cn',
                    maxDate:new Date()
                });


                $('button').on('click', function () {
                        $("button").removeClass("btn-primary");
                        $(this).addClass("btn-primary");

                    $startDate.data("DateTimePicker").format($(this).attr("format"));
                    $endDate.data("DateTimePicker").format($(this).attr("format"));

                    var id=$(this).attr("id");

                    if(id=="season"){
                        $("div.change-width").removeClass("col-sm-12").addClass("col-sm-6");
                        $("#startSeasonDiv").show();
                        $("#endSeasonDiv").show();
                    }else{
                        $startDate.data("DateTimePicker").viewMode(id);
                        $endDate.data("DateTimePicker").viewMode(id);
                        $("#startSeasonDiv").hide();
                        $("#endSeasonDiv").hide();
                        $("div.change-width").removeClass("col-sm-6").addClass("col-sm-12");
                    }
                });

                $('button[range="'+range+'"]').trigger('click');
                if(start){
                    $startDate.data("DateTimePicker").date(start);
                    $endDate.data("DateTimePicker").date(end);
                }
                if(startSeason){
                    $("#startSeasonSel").val(startSeason);
                    $("#endSeasonSel").val(endSeason);
                }


                $("#rq").click(function(){
                    getRq();
                })
                function getRq(){
                    var range=$("button.btn-primary").attr('range');
                    var start=$startDate.data("date");
                    var end=$endDate.data("date");
                    if(!start||!end){
                         alert('请选择完整日期区间！');
                        return false;
                    }
                    if(parseInt(start)>parseInt(end)){
                        alert('开始日期不能大于结束日期！');
                        return false;
                    }
                    var startSean="";
                    var endSeason="";
                    if(range=="3"){
                        var startSeason= $("#startSeasonSel").val();
                        var endSeason= $("#endSeasonSel").val();
                        if(start==end&&parseInt(startSeason)>parseInt(endSeason)){
                            alert('开始日期不能大于结束日期！');
                            return false;
                        }
                    }
                    console.info(range+"|"+start+startSeason+"-"+end+endSeason);
                }


            });
        </script>
    </div>
</div>
</body>
</html>