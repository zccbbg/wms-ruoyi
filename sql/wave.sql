-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('波次', '3', '1', 'wave', 'wms/wave/index', 1, 0, 'C', '0', '0', 'wms:wave:list', '#', 1, sysdate(), 1, null, '波次菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('波次查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'wms:wave:query',        '#', 1, sysdate(), 1, null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('波次新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'wms:wave:add',          '#', 1, sysdate(), 1, null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('波次修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'wms:wave:edit',         '#', 1, sysdate(), 1, null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('波次删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'wms:wave:remove',       '#', 1, sysdate(), 1, null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('波次导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'wms:wave:export',       '#', 1, sysdate(), 1, null, '');
