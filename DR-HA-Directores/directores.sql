-- DR-HA-CU2: GESTION DE SUPERVISORES
-- DR-HA-CU2.1: REGISTRAR SUPERVISOR
INSERT INTO
    Supervisores(
        txt_nom_sup,
        txt_email_sup,
        num_tel_sup,
        fk_id_suc,
        bool_act_sup
    )
VALUES
    (
        'Martinez González Iris Yonitzi',
        'martinez.gonzalez@dreamhouse.com',
        '1234567890',
        1,
        1
    );

-- DR-HA-CU2.2: Editar supervisor:
UPDATE
    Supervisores
SET
    txt_nom_sup = 'Martinez González Iris Yonitzi',
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
    Supervisores;

-- DR-HA-CU2.3: Dar de baja supervisor:
UPDATE
    Supervisores
SET
    bool_act_sup = 0
WHERE
    pk_id_sup = 7;

-- DR-HA-CU2.4: Dar de alta supervisor:
UPDATE
    Supervisores
SET
    bool_act_sup = 1
WHERE
    pk_id_sup = 7;
