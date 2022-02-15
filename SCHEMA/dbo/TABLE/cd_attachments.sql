CREATE TABLE dbo.cd_attachments (
	id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
	fn_type integer NOT NULL,
	fn_user bigint NOT NULL,
	fn_result uuid NOT NULL,
	fn_point uuid NOT NULL,
	fn_route uuid NOT NULL,
	n_longitude numeric(20,15),
	n_latitude numeric(20,15),
	c_notice text,
	d_date timestamp without time zone NOT NULL,
	c_path text NOT NULL,
	n_size integer NOT NULL,
	c_extension text,
	c_mime text,
	jb_data jsonb,
	dx_created timestamp without time zone DEFAULT now() NOT NULL,
	n_distance bigint,
	b_disabled boolean DEFAULT false NOT NULL
);

ALTER TABLE dbo.cd_attachments OWNER TO "mobwal-cloud";

COMMENT ON TABLE dbo.cd_attachments IS 'Файлы';

COMMENT ON COLUMN dbo.cd_attachments.id IS 'Идентификатор';

COMMENT ON COLUMN dbo.cd_attachments.fn_type IS 'Тип изображения';

COMMENT ON COLUMN dbo.cd_attachments.fn_user IS 'Пользователь';

COMMENT ON COLUMN dbo.cd_attachments.fn_result IS 'Результат';

COMMENT ON COLUMN dbo.cd_attachments.fn_point IS 'Точка';

COMMENT ON COLUMN dbo.cd_attachments.fn_route IS 'Маршрут';

COMMENT ON COLUMN dbo.cd_attachments.n_longitude IS 'Долгота';

COMMENT ON COLUMN dbo.cd_attachments.n_latitude IS 'Широта';

COMMENT ON COLUMN dbo.cd_attachments.c_notice IS 'Примечание';

COMMENT ON COLUMN dbo.cd_attachments.d_date IS 'Дата создания';

COMMENT ON COLUMN dbo.cd_attachments.c_path IS 'Путь к файлу';

COMMENT ON COLUMN dbo.cd_attachments.n_size IS 'Размер';

COMMENT ON COLUMN dbo.cd_attachments.c_extension IS 'Расширение файла';

COMMENT ON COLUMN dbo.cd_attachments.c_mime IS 'MIME';

COMMENT ON COLUMN dbo.cd_attachments.jb_data IS 'JSON данные';

COMMENT ON COLUMN dbo.cd_attachments.dx_created IS 'Дата создания в БД';

--------------------------------------------------------------------------------

ALTER TABLE dbo.cd_attachments
	ADD CONSTRAINT cd_attachments_pkey PRIMARY KEY (id);
