CREATE TABLE dbo.cd_routes (
	id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
	c_name text NOT NULL,
	c_description text,
	dx_created timestamp without time zone DEFAULT now() NOT NULL,
	f_org bigint NOT NULL
);

ALTER TABLE dbo.cd_routes OWNER TO city;

COMMENT ON TABLE dbo.cd_routes IS 'Маршруты';

COMMENT ON COLUMN dbo.cd_routes.id IS 'Идентификатор';

COMMENT ON COLUMN dbo.cd_routes.c_name IS 'Наименование или номер маршрута';

COMMENT ON COLUMN dbo.cd_routes.c_description IS 'Примечание';

COMMENT ON COLUMN dbo.cd_routes.dx_created IS 'Дата создания в БД';

COMMENT ON COLUMN dbo.cd_routes.f_org IS 'Организация';

--------------------------------------------------------------------------------

ALTER TABLE dbo.cd_routes
	ADD CONSTRAINT cd_routes_pkey PRIMARY KEY (id);
