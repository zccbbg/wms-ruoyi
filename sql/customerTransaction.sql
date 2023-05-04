-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('客户账户流水', '3', '1', 'customerTransaction', 'wms/customerTransaction/index', 1, 0, 'C', '0', '0', 'wms:customerTransaction:list', '#', 1, sysdate(), '', null, '客户账户流水菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('客户账户流水查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'wms:customerTransaction:query',        '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('客户账户流水新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'wms:customerTransaction:add',          '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('客户账户流水修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'wms:customerTransaction:edit',         '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('客户账户流水删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'wms:customerTransaction:remove',       '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('客户账户流水导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'wms:customerTransaction:export',       '#', 1, sysdate(), '', null, '');
