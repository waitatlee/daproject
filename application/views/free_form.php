<!doctype html>
<html lang="en">
<head>
    <meta name="robots" content="nofollow" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <title>Document</title>
</head>
<body>
<form action="javaScript:;" METHOD="get">
    <input type="text" name="mobile">
    <input type="hidden" name='isSubscribe' value="<?php echo $isSubscribe; ?>" id="cd">
    <input type="submit" value="提交" id="handle">
</form>
</body>
</html>

<script type="text/javascript">
$(function(){
    $('#handle').click(function(){
        alert('cc');
        var mobileReg = /^[1][3,4,5,7,8][0-9]{9}$/;
        var mobile = $('input[name="mobile"]').val();
        if(!mobileReg.test(mobile)){
            alert('手机号格式不正确');
            return;
        }
        $.post('/free/handle', {
            'mobile': mobile
        }, function(res){
           if(res.success){
                alert('提交成功');
           }
        }, 'json');
    });
});
</script>