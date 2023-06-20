--Reporte de propiedades disponibles y sus propietarios:
SELECT
    p.pk_id_propd,
    p.txt_ubi_propd,
    p.num_no_hab_propd,
    p.txt_tam_propd,
    p.num_prec_propd,
    pr.txt_nom_prop
FROM
    propiedades p
    INNER JOIN propietarios pr ON p.fk_id_prop = pr.pk_id_prop
WHERE
    p.bool_disp_propd = 1;

--Reporte de citas no confirmadas con detalles de la propiedad y el cliente:
SELECT
    c.pk_id_cit,
    c.txt_fecha_cit,
    c.txt_hora_cit,
    p.txt_ubi_propd,
    p.num_no_hab_propd,
    cl.txt_nom_cli
FROM
    citas c
    INNER JOIN propiedades p ON c.fk_id_propd = p.pk_id_propd
    INNER JOIN clientes cl ON c.fk_id_cli = cl.pk_id_cli
WHERE
    c.bool_confir_cit = 0M
