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
--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE getProductOne(
    p_pseq IN product.pseq%TYPE,
    p_cur OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_cur FOR SELECT * FROM pview WHERE pseq = p_pseq;
END;
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------

-- Cart

CREATE OR REPLACE PROCEDURE insertCart(
    p_pseq IN cart.pseq%TYPE,
    p_qty IN cart.qty%TYPE,
    p_tseq IN cart.tseq%TYPE
)
IS
BEGIN
    INSERT INTO cart(cseq, pseq, qty, tseq) values(cart_cseq.nextval, p_pseq, p_qty, p_tseq);
END;

--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE getCartList(
    p_cur OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_cur FOR SELECT * FROM  cview ORDER BY cseq ASC;
END;














