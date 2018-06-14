<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['news_content']=array (
  'id' => '1',
  'name' => 'news_content',
  'description' => '新闻内容列表',
  'perpage' => '20',
  'hasattach' => '1',
  'built_in' => '0',
  'thumb_preferences' => '{"enabled":["40x40"],"default":"original"}',
  'fields' => 
  array (
    1 => 
    array (
      'id' => '1',
      'name' => 'nc_id',
      'description' => '主键',
      'model' => '1',
      'type' => 'int',
      'length' => '11',
      'values' => '',
      'width' => '150',
      'height' => '20',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '0',
      'listable' => '1',
      'order' => '1',
      'editable' => '1',
    ),
    2 => 
    array (
      'id' => '2',
      'name' => 'nc_content',
      'description' => '内容',
      'model' => '1',
      'type' => 'wysiwyg',
      'length' => '255',
      'values' => '',
      'width' => '600',
      'height' => '300',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '2',
      'editable' => '1',
    ),
  ),
  'listable' => 
  array (
    0 => '1',
    1 => '2',
  ),
  'searchable' => 
  array (
    0 => '2',
  ),
);