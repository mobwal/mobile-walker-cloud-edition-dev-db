CREATE TABLE dbo.cd_points (
	id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
	f_collection uuid,
	fn_route uuid NOT NULL,
	c_address text NOT NULL,
	c_description text,
	n_longitude numeric(20,15),
	n_latitude numeric(20,15),
	c_comment text,
	b_anomaly boolean DEFAULT false NOT NULL,
	b_check boolean DEFAULT true NOT NULL,
	n_order integer NOT NULL,
	dx_created timestamp without time zone DEFAULT now() NOT NULL
);

ALTER TABLE dbo.cd_points OWNER TO city;

COMMENT ON TABLE dbo.cd_points IS 'Точки';

COMMENT ON COLUMN dbo.cd_points.id IS 'Идентификатор';

COMMENT ON COLUMN dbo.cd_points.f_collection IS 'Идентификатор коллекции';

COMMENT ON COLUMN dbo.cd_points.fn_route IS 'Маршрут';

COMMENT ON COLUMN dbo.cd_points.c_address IS 'Адрес';

COMMENT ON COLUMN dbo.cd_points.c_description IS 'Описание';

COMMENT ON COLUMN dbo.cd_points.n_order IS 'Сортировка';

COMMENT ON COLUMN dbo.cd_points.n_longitude IS 'Долгота';

COMMENT ON COLUMN dbo.cd_points.n_latitude IS 'Широта';

COMMENT ON COLUMN dbo.cd_points.dx_created IS 'Дата создания в БД';

--------------------------------------------------------------------------------

ALTER TABLE dbo.cd_points
	ADD CONSTRAINT cd_points_pkey PRIMARY KEY (id);

--------------------------------------------------------------------------------

ALTER TABLE dbo.cd_points
	ADD CONSTRAINT cd_points_f_route_fkey FOREIGN KEY (fn_route) REFERENCES dbo.cd_routes(id);
	
--------------------------------------------------------------------------------

ALTER TABLE dbo.cd_points
	ADD CONSTRAINT cd_points_f_collection_fkey FOREIGN KEY (f_collection) REFERENCES dbo.cd_collections(id);
