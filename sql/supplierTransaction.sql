-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('供应商账户流水', '3', '1', 'supplierTransaction', 'wms/supplierTransaction/index', 1, 0, 'C', '0', '0', 'wms:supplierTransaction:list', '#', 1, sysdate(), '', null, '供应商账户流水菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('供应商账户流水查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'wms:supplierTransaction:query',        '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('供应商账户流水新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'wms:supplierTransaction:add',          '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('供应商账户流水修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'wms:supplierTransaction:edit',         '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('供应商账户流水删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'wms:supplierTransaction:remove',       '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('供应商账户流水导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'wms:supplierTransaction:export',       '#', 1, sysdate(), '', null, '');
