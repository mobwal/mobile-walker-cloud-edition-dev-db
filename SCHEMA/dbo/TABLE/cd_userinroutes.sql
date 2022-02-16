CREATE TABLE IF NOT EXISTS dbo.cd_userinroutes (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    f_route uuid NOT NULL,
    f_user bigint NOT NULL,
    dx_created timestamp without time zone NOT NULL DEFAULT now(),
    CONSTRAINT cd_userinroutes_pkey PRIMARY KEY (id),
    CONSTRAINT cd_userinroutes_f_route_fkey FOREIGN KEY (f_route)
        REFERENCES dbo.cd_routes (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT cd_userinroutes_f_user_fkey FOREIGN KEY (f_user)
        REFERENCES core.pd_users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE dbo.cd_userinroutes OWNER to "city";

COMMENT ON TABLE dbo.cd_userinroutes
    IS 'Исполнители маршрута';

COMMENT ON COLUMN dbo.cd_userinroutes.id
    IS 'Идентифиактор';

COMMENT ON COLUMN dbo.cd_userinroutes.f_route
    IS 'Маршрут';

COMMENT ON COLUMN dbo.cd_userinroutes.f_user
    IS 'Пользователь';

COMMENT ON COLUMN dbo.cd_userinroutes.dx_created
    IS 'Дата создания в БД';