SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM reported_user;
DELETE FROM ban;
DELETE FROM moderation_report;
DELETE FROM teamkills;
DELETE FROM unique_id_users;
DELETE FROM uniqueid;
DELETE FROM global_rating;
DELETE FROM ladder1v1_rating;
DELETE FROM uniqueid_exempt;
DELETE FROM version_lobby;
DELETE FROM friends_and_foes;
DELETE FROM ladder_map;
DELETE FROM tutorial;
DELETE FROM map_version_review;
DELETE FROM map_version_reviews_summary;
DELETE FROM map_version;
DELETE FROM `map`;
DELETE FROM mod_version_review;
DELETE FROM mod_version_reviews_summary;
DELETE FROM mod_version;
DELETE
FROM `mod`;
DELETE
FROM mod_stats;
DELETE
FROM oauth_clients;
DELETE
FROM updates_faf;
DELETE
FROM updates_faf_files;
DELETE
FROM avatars;
DELETE
FROM avatars_list;
DELETE
FROM ban;
DELETE
FROM clan_membership;
DELETE
FROM clan;
DELETE
FROM game_player_stats;
DELETE
FROM game_review;
DELETE
FROM game_reviews_summary;
DELETE
FROM game_stats;
DELETE
FROM game_featuredMods;
DELETE
FROM ladder_division_score;
DELETE
FROM ladder_division;
DELETE
FROM lobby_admin;
DELETE
FROM name_history;
DELETE
FROM group_permission_assignment;
DELETE
FROM user_group_assignment;
DELETE
FROM group_permission;
DELETE
FROM user_group;
DELETE
FROM login;
DELETE
FROM email_domain_blacklist;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO oauth_clients (id, name, client_secret, client_type, redirect_uris, default_redirect_uri, default_scope)
VALUES ('test', 'test', '{noop}test', 'public', 'http://localhost https://www.getpostman.com/oauth2/callback ',
        'http://localhost',
        'read_events read_achievements upload_map upload_mod upload_avatar write_account_data vote');

INSERT INTO login (id, login, email, password, steamid, ip)
VALUES (1, 'USER', 'user@faforever.com', '92b7b421992ef490f3b75898ec0e511f1a5c02422819d89719b20362b023ee4f', NULL,
        '127.0.0.1'),
       (2, 'MODERATOR', 'moderator@faforever.com', '778ac5b81fa251b450f827846378739caee510c31b01cfa9d31822b88bed8441',
        1234, '127.0.0.1'),
       (3, 'ADMIN', 'admin@faforever.com', '835d6dc88b708bc646d6db82c853ef4182fabbd4a8de59c213f2b5ab3ae7d9be', NULL,
        '127.0.0.1'),
       (4, 'BANNED', 'banned@faforever.com', '', NULL, '127.0.0.1'),
       (5, 'ACTIVE_USER', 'active-user@faforever.com', '', null, '127.0.0.1');

INSERT INTO user_group (id, technical_name, name_key, parent_group_id, public)
VALUES (1, 'ADMINISTRATOR', 'administrator', null, true),
       (2, 'MODERATOR', 'moderator', null, true),
       (3, 'faf_server_administrators', 'user_group.faf.server_administrators', null, true),
       (4, 'faf_moderators_global', 'user_group.faf.moderators.global', null, true);

INSERT INTO user_group (technical_name, name_key, public, parent_group_id)
VALUES ('', 'user_group.faf.server_administrators', 1, @devops_id);

INSERT INTO user_group_assignment (user_id, group_id)
VALUES (2, 2),
       (3, 1);

INSERT INTO group_permission (id, technical_name, name_key)
VALUES (1, 'READ_AUDIT_LOG', 'permission_group.read_audit_log'),
       (2, 'READ_TEAMKILL_REPORT', 'permission_group.read_teamkill_report'),
       (3, 'READ_ACCOUNT_PRIVATE_DETAILS', 'permission_group.read_account_private_details'),
       (4, 'ADMIN_ACCOUNT_NOTE', 'permission_group.admin_account_note'),
       (5, 'ADMIN_MODERATION_REPORT', 'permission_group.admin_moderation_report'),
       (6, 'ADMIN_ACCOUNT_BAN', 'permission_group.admin_account_ban'),
       (7, 'ADMIN_CLAN', 'permission_group.admin_clan'),
       (8, 'WRITE_COOP_MISSION', 'permission_group.write_coop_mission'),
       (9, 'WRITE_AVATAR', 'permission_group.write_avatar'),
       (10, 'WRITE_MATCHMAKER_POOL', 'permission_group.write_matchmaker_pool'),
       (11, 'WRITE_MATCHMAKER_MAP', 'permission_group.write_matchmaker_map'),
       (12, 'WRITE_EMAIL_DOMAIN_BAN', 'permission_group.write_email_domain_ban'),
       (13, 'ADMIN_VOTE', 'permission_group.admin_vote'),
       (14, 'WRITE_USER_GROUP', 'permission_group.write_user_group'),
       (15, 'READ_USER_GROUP', 'permission_group.read_user_group'),
       (16, 'WRITE_TUTORIAL', 'permission_group.write_tutorial'),
       (17, 'WRITE_NEWS_POST', 'permission_group.write_news_post'),
       (18, 'WRITE_OAUTH_CLIENT', 'permission_group.write_oauth_client'),
       (19, 'ADMIN_MAP', 'permission_group.admin_map'),
       (20, 'ADMIN_MOD', 'permission_group.admin_mod'),
       (21, 'WRITE_MESSAGE', 'permission_group.write_message'),
       (22, 'ADMIN_KICK_SERVER', 'permission_group.admin_kick_server'),
       (23, 'ADMIN_BROADCAST_MESSAGE', 'permission_group.admin_broadcast_message');

INSERT INTO group_permission_assignment (group_id, permission_id)
VALUES (1, 1),
       (1, 8),
       (1, 9),
       (1, 10),
       (1, 11),
       (1, 12),
       (1, 13),
       (1, 1),
       (1, 1),
       (1, 1),
       (2, 1),
       (2, 2),
       (2, 3),
       (2, 4),
       (2, 5),
       (2, 6),
       (2, 7),
       (2, 12),
       (2, 19),
       (2, 20),
       (2, 22);

INSERT INTO name_history (change_time, user_id, previous_name)
VALUES (NOW(), 2, 'OLD_MODERATOR');
