-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('库存盘点单据', '3', '1', 'inventoryCheck', 'wms/inventoryCheck/index', 1, 0, 'C', '0', '0', 'wms:inventoryCheck:list', '#', 1, sysdate(), '', null, '库存盘点单据菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('库存盘点单据查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'wms:inventoryCheck:query',        '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('库存盘点单据新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'wms:inventoryCheck:add',          '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('库存盘点单据修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'wms:inventoryCheck:edit',         '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('库存盘点单据删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'wms:inventoryCheck:remove',       '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('库存盘点单据导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'wms:inventoryCheck:export',       '#', 1, sysdate(), '', null, '');
