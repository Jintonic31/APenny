-- Admins

CREATE OR REPLACE PROCEDURE getBanner(
    p_cur OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_cur FOR SELECT * FROM bview ORDER BY biseq DESC;
END;

--------------------------------------------------------------------------------

-- Product

CREATE OR REPLACE PROCEDURE getProduct(
    p_cur OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_cur FOR SELECT * FROM  pview ORDER BY pseq DESC;
END;
--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE getPcategory(
    p_cur OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_cur FOR SELECT * FROM  pcategory ORDER BY pcseq ASC;
END;