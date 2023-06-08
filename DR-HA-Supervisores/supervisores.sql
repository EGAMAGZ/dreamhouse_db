-- DR-HA-CU4: GESTION DE PROPIEDADES
-- DR-HA-CU4.1: DAR DE ALTA PROPIEDADES
INSERT INTO
    Propiedades(
        txt_ubi_propd,
        num_no_hab_propd,
        txt_tam_propd,
        num_prec_propd,
        txt_comp_propd,
        fk_id_prop
    )
VALUES
    (
        'Andador Sur Olivas,San Elena los altos,77962',
        4,
        '32m2',
        16307989,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        1
    );

-- DR-HA-CU4.3: DAR DE BAJA PROPIEDADES
UPDATE
    Propiedades
SET
    bool_act_propd = 0
WHERE
    pk_id_propd IN (6, 7);

-- DR-HA-CU4.2: DAR DE ALTA PROPIEDADES
UPDATE
    Propiedades
SET
    bool_act_propd = 1
WHERE
    pk_id_propd = 6;

-- DR-HA-CU4.4: GENERAR INFORME POR MUNICIPIO
-- * Cantitdad de clientes mayores a 40 años
SELECT COUNT(*) FROM Clientes WHERE num_edad_cli >= 40;

-- DR-HA-CU4.5: VALIDAR CONTRARO MEDIANTE LA LISTA DE VALIDACION
UPDATE
    Contratos
SET
    bool_val_cont = 1
WHERE
    pk_id_cont = 3;
