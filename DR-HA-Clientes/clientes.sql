-- DR-HA-CU6: ALQUILERES DISPONIBLES
-- DR-HA-CU6.1: VER ALQUILERES DISPONIBLES
SELECT
    pk_id_propd,
    txt_ubi_propd,
    num_no_hab_propd,
    txt_tam_propd,
    num_prec_propd,
    txt_comp_propd
FROM
    Propiedades
WHERE
    bool_disp_propd = 1
    AND bool_act_propd = 1;

-- DR-HA-CU6.2: REGISTRAR CITA DE ALQUILER
INSERT INTO
    Citas(
        txt_fecha_cit,
        txt_hora_cit,
        fk_id_propd,
        fk_id_cli
    )
VALUES
    ('07/06/2023', '10:00', 1, 9);
