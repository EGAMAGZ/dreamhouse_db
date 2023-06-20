-- DR-HA-CU5: GESTION DE ALQUILERES
-- DR-HA-CU5.1: REGISTRO DE ALQUILERES
INSERT INTO
    propiedades(
        txt_ubi_propd,
        num_no_hab_propd,
        txt_tam_propd,
        num_prec_propd,
        txt_comp_propd,
        fk_id_prop
    )
VALUES
    (
        'Avenida Jordania,Nueva México,19344',
        5,
        '30m2',
        83217665,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        5
    );

-- DR-HA-CU5.2: EDICION DE ALQUILERES
UPDATE
    propiedades
SET
    num_no_hab_propd = 3,
    txt_tam_propd = '24m2',
    bool_act_propd = 1
WHERE
    pk_id_propd = 8;

-- DR-HA-CU5.3: CONFIRMACION DE CITA DE ALQUILER
UPDATE
    propiedades
SET
    bool_act_propd = 1
WHERE
    pk_id_propd = 8;

INSERT INTO
    Citas(
        txt_fecha_cit,
        txt_hora_cit,
        fk_id_propd,
        fk_id_cli
    )
VALUES
    ('27/6/2023', '13:00', 8, 4);

UPDATE
    Citas
SET
    bool_confir_cit = 1
WHERE
    pk_id_cit = 4;

-- DR-HA-CU5.4: GENERAR CONTRATO DE ALQUILER
INSERT INTO
    contratos(
        fk_id_cli,
        fk_id_propd,
        txt_cond_al_cont,
        fk_id_sup,
        txt_ini_cont,
        txt_fin_cont,
        txt_cond_com_cont,
        num_pag_cont,
        bool_val_cont
    )
VALUES
    (
        4,
        8,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        1,
        '30/10/2022',
        '06/06/2023',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        9481,
        1
    );
