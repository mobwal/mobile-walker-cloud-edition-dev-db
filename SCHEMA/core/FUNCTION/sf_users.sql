CREATE OR REPLACE FUNCTION core.sf_users(_f_user bigint) RETURNS TABLE(id bigint, c_login text, c_claims text, c_services text, b_disabled boolean, c_name text, c_post text, c_about text, d_last_auth_date timestamp without time zone, c_imp_id text, f_org bigint, c_notice text, c_email text)
    LANGUAGE plpgsql
    AS $$
/**
* @params {bigint} _f_user - иден. пользователя
*/
BEGIN
	RETURN QUERY SELECT u.id, u.c_login,
    concat('.', ( SELECT string_agg(t.c_name, '.'::text) AS string_agg
           FROM ( SELECT r.c_name
                   FROM core.pd_userinroles uir
                     JOIN core.pd_roles r ON uir.f_role = r.id
                  WHERE uir.f_user = u.id
                  ORDER BY r.n_weight DESC) t), '.') AS c_claims,
	concat('.', ( SELECT string_agg(t.c_const, '.'::text) AS string_agg
           FROM ( select * from core.sf_services(u.f_org)) t), '.') AS c_services,
    u.b_disabled,
	u.c_name,
	u.c_post,
	u.c_about,
	u.d_last_auth_date,
	u.c_imp_id,
	u.f_org,
	u.c_notice,
	u.c_email
   FROM core.pd_users u
  WHERE u.id = _f_user and u.sn_delete = false;
END;
$$;

ALTER FUNCTION core.sf_users(_f_user bigint) OWNER TO city;

COMMENT ON FUNCTION core.sf_users(_f_user bigint) IS 'Получение информации о пользователе';
