<!doctype html>
<html lang="en">
<head>
    <meta name="robots" content="nofollow" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="<?php echo STATIC_HOST; ?>/js/jquery-3.3.1.min.js"></script>
    <title>免费话费</title>
</head>
<body>
<?php echo form_open('free/handle'); ?>
    <input type="text" name="mobile">
    <input type="hidden" name='isSubscribe' value="<?php echo $isSubscribe; ?>">
    <input type="button" value="提交" id="handle">
<?php echo form_close();?>
</body>
</html>

<script type="text/javascript">
$(function(){
    $('#handle').click(function(){
        var mobileReg = /^[1][3,4,5,7,8][0-9]{9}$/;
        var mobile = $('input[name="mobile"]').val();
        if(!mobileReg.test(mobile)){
            alert('手机号格式不正确');
            return false;
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