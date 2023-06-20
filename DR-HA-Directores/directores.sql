-- DR-HA-CU2: GESTION DE SUPERVISORES
-- DR-HA-CU2.1: REGISTRAR SUPERVISOR
INSERT INTO
    supervisores(
        txt_nom_sup,
        txt_email_sup,
        num_tel_sup,
        fk_id_suc,
        bool_act_sup
    )
VALUES
    (
        'Martinez González Iris Yonitzi',
        'iris.gonzalez@dreamhouse.com',
        '1234567890',
        3,
        0
    );

-- DR-HA-CU2.2: Editar supervisor:
UPDATE
    supervisores
SET
    txt_nom_sup = 'Martinez González Iris Yonitziaa',
    txt_email_sup = 'martinez.gonzalez@dreamhouse.com',
    num_tel_sup = '1234567890',
    fk_id_suc = 1,
    bool_act_sup = 1
WHERE
    pk_id_sup = 7;

-- DR-HA-CU2.4: Consultar supervisores:
SELECT
    *
FROM
    supervisores;

-- DR-HA-CU2.4: Consultar supervisores Con la direccion de la sucursal y numero de contacto de la sucursal:
SELECT
    s.pk_id_sup,
    s.txt_nom_sup,
    s.txt_email_sup,
    s.num_tel_sup,
    su.txt_dir_suc,
    su.num_tel_suc
FROM
    supervisores s
    INNER JOIN sucursales su ON s.fk_id_suc = su.pk_id_suc;

-- DR-HA-CU2.3: Dar de baja supervisor:
UPDATE
    supervisores
SET
    bool_act_sup = 0
WHERE
    pk_id_sup = 7;

-- DR-HA-CU2.4: Dar de alta supervisor:
UPDATE
    supervisores
SET
    bool_act_sup = 1
WHERE
    pk_id_sup = 7;
