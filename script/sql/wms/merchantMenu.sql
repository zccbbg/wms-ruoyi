-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1809059968309743618, '往来单位', '1808758090157985794', '1', 'merchant', 'wms/merchant/index', 1, 0, 'C', '0', '0', 'wms:merchant:list', '#', 'admin', sysdate(), '', null, '往来单位菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1809059968309743619, '往来单位查询', 1809059968309743618, '1',  '#', '', 1, 0, 'F', '0', '0', 'wms:merchant:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1809059968309743620, '往来单位新增', 1809059968309743618, '2',  '#', '', 1, 0, 'F', '0', '0', 'wms:merchant:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1809059968309743621, '往来单位修改', 1809059968309743618, '3',  '#', '', 1, 0, 'F', '0', '0', 'wms:merchant:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1809059968309743622, '往来单位删除', 1809059968309743618, '4',  '#', '', 1, 0, 'F', '0', '0', 'wms:merchant:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1809059968309743623, '往来单位导出', 1809059968309743618, '5',  '#', '', 1, 0, 'F', '0', '0', 'wms:merchant:export',       '#', 'admin', sysdate(), '', null, '');
