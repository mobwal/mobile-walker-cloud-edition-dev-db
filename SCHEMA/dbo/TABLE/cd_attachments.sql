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
	f_storage uuid NOT NULL,
	n_distance bigint,
	b_disabled boolean DEFAULT false NOT NULL
);

ALTER TABLE dbo.cd_attachments OWNER TO "city";

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

COMMENT ON COLUMN dbo.cd_attachments.d_date IS 'Дата создания в мобильном устройстве';

COMMENT ON COLUMN dbo.cd_attachments.f_storage IS 'Связь с хранилищем';

COMMENT ON COLUMN dbo.cd_attachments.n_distance IS 'Дистанция до задания, если задана координата';

COMMENT ON COLUMN dbo.cd_attachments.b_disabled IS 'Признак удаленной (отключения) записи';

--------------------------------------------------------------------------------

ALTER TABLE dbo.cd_attachments
	ADD CONSTRAINT cd_attachments_pkey PRIMARY KEY (id);
