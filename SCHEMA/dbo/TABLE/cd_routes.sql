CREATE TABLE dbo.cd_routes (
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
    c_name text NOT NULL,
    d_date_start date NOT NULL,
    d_date_end date NOT NULL,
    c_notice text,
    b_extended boolean NOT NULL,
    d_extended date,
    b_draft boolean NOT NULL DEFAULT false,
    b_disabled boolean NOT NULL DEFAULT false,
    n_order integer NOT NULL DEFAULT 0,
    f_org bigint NOT NULL,
    c_imp_id text,
    dx_created timestamp without time zone NOT NULL DEFAULT now(),
    CONSTRAINT cd_routes_pkey PRIMARY KEY (id)
);

ALTER TABLE dbo.cd_routes OWNER TO "city";

COMMENT ON TABLE dbo.cd_routes
    IS 'Маршруты';

COMMENT ON COLUMN dbo.cd_routes.id
    IS 'Идентификатор';

COMMENT ON COLUMN dbo.cd_routes.c_name
    IS 'Наименование или номер маршрута';

COMMENT ON COLUMN dbo.cd_routes.d_date_start
    IS 'Дата начала выполнения';

COMMENT ON COLUMN dbo.cd_routes.d_date_end
    IS 'Дата завершения выполнения';

COMMENT ON COLUMN dbo.cd_routes.c_notice
    IS 'Примечание';

COMMENT ON COLUMN dbo.cd_routes.b_extended
    IS 'Продлен';

COMMENT ON COLUMN dbo.cd_routes.d_extended
    IS 'Продлен до';

COMMENT ON COLUMN dbo.cd_routes.b_draft
    IS 'Является черновиком';

COMMENT ON COLUMN dbo.cd_routes.b_disabled
    IS 'Признак отключения';

COMMENT ON COLUMN dbo.cd_routes.dx_created
    IS 'Дата создания в БД';

COMMENT ON COLUMN dbo.cd_routes.f_org
    IS 'Организация';

COMMENT ON COLUMN dbo.cd_routes.c_imp_id
    IS 'Ключ для импорта';

COMMENT ON COLUMN dbo.cd_routes.n_order
    IS 'Приоритетность';
