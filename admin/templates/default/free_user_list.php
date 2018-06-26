<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');?>
<div class="headbar">
    <div class="position"><?=$bread?></div>
	<div class="position"></div>
	<div class="field">
		<table class="list_table">
			<col width="40px" />
			<col />
			<thead>
				<tr>
                	<th></th>
					<th>手机号码</th>
					<th>提交时间</th>
                    <th>状态</th>
                    <th>管理选项</th>
				</tr>
			</thead>
		</table>
	</div>
</div>

<div class="content">
		<table id="list_table" class="list_table">
			<col width="40px" />
			<col />
			<tbody>
            <?php foreach($list as $v) : ?>
            	<tr>
                	<td></td>
                	<td><?php echo $v['mobile']; ?></td>
                    <td><?php echo date('Y-m-d H:i:s', $v['create_at']); ?></td>
                    <td><?php echo $statusEnum[$v['status']]; ?></td>
                    <td>
                        <a class="confirm_delete" href=""><img class="operator" src="images/icon_del.gif" alt="删除" title="删除"></a>
                    </td>
                </tr>
            <?php endforeach; ?>
			</tbody>
		</table>
</div>
<script language="javascript">
	$('a.confirm_delete').click(function(){
		return confirm('是否要删除所选字段？');	
	});
</script>