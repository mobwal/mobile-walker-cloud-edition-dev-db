CREATE TABLE dbo.cs_route_statuses (
	id integer DEFAULT nextval('dbo.cs_route_statuses_id_seq'::regclass) NOT NULL,
	c_name text NOT NULL,
	c_short_name text,
	c_const text NOT NULL,
	n_order integer DEFAULT 0,
	b_disabled boolean DEFAULT false NOT NULL
);

ALTER TABLE dbo.cs_route_statuses OWNER TO "mobwal-cloud";

COMMENT ON TABLE dbo.cs_route_statuses IS 'Тип результат';

COMMENT ON COLUMN dbo.cs_route_statuses.id IS 'Идентификатор';

COMMENT ON COLUMN dbo.cs_route_statuses.c_name IS 'Наименование';

COMMENT ON COLUMN dbo.cs_route_statuses.c_short_name IS 'Краткое наименование';

COMMENT ON COLUMN dbo.cs_route_statuses.c_const IS 'Константа';

COMMENT ON COLUMN dbo.cs_route_statuses.n_order IS 'Приоритет статуса';

COMMENT ON COLUMN dbo.cs_route_statuses.b_disabled IS 'Отключено';

--------------------------------------------------------------------------------

ALTER TABLE dbo.cs_route_statuses
	ADD CONSTRAINT cs_route_statuses_pkey PRIMARY KEY (id);