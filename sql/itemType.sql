-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('物料类型表', '3', '1', 'itemType', 'wms/itemType/index', 1, 0, 'C', '0', '0', 'wms:itemType:list', '#', 1, sysdate(), '', null, '物料类型表菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('物料类型表查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'wms:itemType:query',        '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('物料类型表新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'wms:itemType:add',          '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('物料类型表修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'wms:itemType:edit',         '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('物料类型表删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'wms:itemType:remove',       '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('物料类型表导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'wms:itemType:export',       '#', 1, sysdate(), '', null, '');
