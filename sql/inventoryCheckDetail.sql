-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('库存盘点单据详情', '3', '1', 'inventoryCheckDetail', 'wms/inventoryCheckDetail/index', 1, 0, 'C', '0', '0', 'wms:inventoryCheckDetail:list', '#', 1, sysdate(), '', null, '库存盘点单据详情菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('库存盘点单据详情查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'wms:inventoryCheckDetail:query',        '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('库存盘点单据详情新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'wms:inventoryCheckDetail:add',          '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('库存盘点单据详情修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'wms:inventoryCheckDetail:edit',         '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('库存盘点单据详情删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'wms:inventoryCheckDetail:remove',       '#', 1, sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('库存盘点单据详情导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'wms:inventoryCheckDetail:export',       '#', 1, sysdate(), '', null, '');
