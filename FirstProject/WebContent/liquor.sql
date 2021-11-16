-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- tbl_user Table Create SQL
CREATE TABLE tbl_user
(
    u_id           VARCHAR2(20)    NOT NULL, 
    u_pwd          VARCHAR2(20)    NOT NULL, 
    u_name         VARCHAR2(20)    NOT NULL, 
    u_birthdate    DATE            DEFAULT SYSDATE NOT NULL, 
    u_gender       VARCHAR2(1)     NOT NULL, 
    u_joindate     DATE            DEFAULT SYSDATE NOT NULL, 
    admin_yn       VARCHAR2(1)     NOT NULL, 
     PRIMARY KEY (u_id)
)
/

COMMENT ON TABLE tbl_user IS '회원 정보'
/

COMMENT ON COLUMN tbl_user.u_id IS '회원 아이디'
/

COMMENT ON COLUMN tbl_user.u_pwd IS '회원 비밀번호'
/

COMMENT ON COLUMN tbl_user.u_name IS '회원 이름'
/

COMMENT ON COLUMN tbl_user.u_birthdate IS '회원 생년월일'
/

COMMENT ON COLUMN tbl_user.u_gender IS '회원 성별'
/

COMMENT ON COLUMN tbl_user.u_joindate IS '회원 가입일자'
/

COMMENT ON COLUMN tbl_user.admin_yn IS '관리자 여부'
/


-- tbl_cocktail Table Create SQL
CREATE TABLE tbl_cocktail
(
    cocktail_seq           NUMBER(12, 0)     NOT NULL, 
    cocktail_name          VARCHAR2(50)      NOT NULL, 
    cocktail_speciality    VARCHAR2(4000)    NOT NULL, 
    cocktail_degree        NUMBER(12, 1)     NOT NULL, 
    cocktail_color         VARCHAR2(20)      NOT NULL, 
    reg_date               DATE              DEFAULT SYSDATE NOT NULL, 
    u_id                   VARCHAR2(20)      NOT NULL, 
     PRIMARY KEY (cocktail_seq)
)
/

CREATE SEQUENCE tbl_cocktail_SEQ
START WITH 1
INCREMENT BY 1;
/
-- 여기까지 실행함
CREATE OR REPLACE TRIGGER tbl_cocktail_AI_TRG
BEFORE INSERT ON tbl_cocktail 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_cocktail_SEQ.NEXTVAL
    INTO :NEW.cocktail_seq
    FROM DUAL;
END;
/

--DROP TRIGGER tbl_cocktail_AI_TRG;
/

--DROP SEQUENCE tbl_cocktail_SEQ;
/

COMMENT ON TABLE tbl_cocktail IS '칵테일 정보'
/

COMMENT ON COLUMN tbl_cocktail.cocktail_seq IS '칵테일 순번'
/

COMMENT ON COLUMN tbl_cocktail.cocktail_name IS '칵테일 이름'
/

COMMENT ON COLUMN tbl_cocktail.cocktail_speciality IS '칵테일 특징'
/

COMMENT ON COLUMN tbl_cocktail.cocktail_degree IS '칵테일 도수'
/

COMMENT ON COLUMN tbl_cocktail.cocktail_color IS '칵테일 색'
/

COMMENT ON COLUMN tbl_cocktail.reg_date IS '등록 일자'
/

COMMENT ON COLUMN tbl_cocktail.u_id IS '등록자 아이디'
/

ALTER TABLE tbl_cocktail
    ADD CONSTRAINT FK_tbl_cocktail_u_id_tbl_user_ FOREIGN KEY (u_id)
        REFERENCES tbl_user (u_id)
/


-- tbl_recommend Table Create SQL
CREATE TABLE tbl_recommend
(
    reco_seq        NUMBER(12, 0)    NOT NULL, 
    cocktail_seq    NUMBER(12, 0)    NOT NULL, 
    reco_date       DATE             DEFAULT SYSDATE NOT NULL, 
    reco_opinion    VARCHAR2(150)    NOT NULL, 
     PRIMARY KEY (reco_seq)
)
/

CREATE SEQUENCE tbl_recommend_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER tbl_recommend_AI_TRG
BEFORE INSERT ON tbl_recommend 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_recommend_SEQ.NEXTVAL
    INTO :NEW.reco_seq
    FROM DUAL;
END;
/

--DROP TRIGGER tbl_recommend_AI_TRG;
/

--DROP SEQUENCE tbl_recommend_SEQ;
/

COMMENT ON TABLE tbl_recommend IS '칵테일 지난 추천 내'
/

COMMENT ON COLUMN tbl_recommend.reco_seq IS '추천 순번'
/

COMMENT ON COLUMN tbl_recommend.cocktail_seq IS '칵테일 순번'
/

COMMENT ON COLUMN tbl_recommend.reco_date IS '칵테일 추천 일자'
/

COMMENT ON COLUMN tbl_recommend.reco_opinion IS '칵테일 추천 사유'
/

ALTER TABLE tbl_recommend
    ADD CONSTRAINT FK_tbl_recommend_cocktail_seq_ FOREIGN KEY (cocktail_seq)
        REFERENCES tbl_cocktail (cocktail_seq)
/


-- my_cocktail Table Create SQL
CREATE TABLE my_cocktail
(
    my_cocktail_seq        NUMBER(12, 0)     NOT NULL, 
    cocktail_seq           NUMBER(12, 0)     NOT NULL, 
    reg_date               DATE              DEFAULT SYSDATE NOT NULL, 
    u_id                   VARCHAR2(20)      NOT NULL, 
    my_cocktail_comment    VARCHAR2(4000)    NULL, 
     PRIMARY KEY (my_cocktail_seq)
)
/

CREATE SEQUENCE my_cocktail_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER my_cocktail_AI_TRG
BEFORE INSERT ON my_cocktail 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT my_cocktail_SEQ.NEXTVAL
    INTO :NEW.my_cocktail_seq
    FROM DUAL;
END;
/

--DROP TRIGGER my_cocktail_AI_TRG;
/

--DROP SEQUENCE my_cocktail_SEQ;
/

COMMENT ON TABLE my_cocktail IS '나의 칵테일 (즐겨찾기)'
/

COMMENT ON COLUMN my_cocktail.my_cocktail_seq IS '나의 칵테일 순번'
/

COMMENT ON COLUMN my_cocktail.cocktail_seq IS '칵테일 순번'
/

COMMENT ON COLUMN my_cocktail.reg_date IS '등록 일자'
/

COMMENT ON COLUMN my_cocktail.u_id IS '등록자 아이디'
/

COMMENT ON COLUMN my_cocktail.my_cocktail_comment IS '등록 코멘트'
/

ALTER TABLE my_cocktail
    ADD CONSTRAINT FK_my_cocktail_cocktail_seq_tb FOREIGN KEY (cocktail_seq)
        REFERENCES tbl_cocktail (cocktail_seq)
/

ALTER TABLE my_cocktail
    ADD CONSTRAINT FK_my_cocktail_u_id_tbl_user_u FOREIGN KEY (u_id)
        REFERENCES tbl_user (u_id)
/


-- tbl_my_recipe Table Create SQL
CREATE TABLE tbl_my_recipe
(
    my_recipe_seq           NUMBER(12, 0)     NOT NULL, 
    my_ingredient_name      VARCHAR2(150)     NOT NULL, 
    my_ingredient_amount    NUMBER(12, 1)     NOT NULL, 
    my_ingredient_method    VARCHAR2(4000)    NOT NULL, 
    u_id                    VARCHAR2(20)      NOT NULL, 
    my_cocktail_name        VARCHAR2(20)      NOT NULL, 
     PRIMARY KEY (my_recipe_seq)
)
/

CREATE SEQUENCE tbl_my_recipe_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER tbl_my_recipe_AI_TRG
BEFORE INSERT ON tbl_my_recipe 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_my_recipe_SEQ.NEXTVAL
    INTO :NEW.my_recipe_seq
    FROM DUAL;
END;
/

--DROP TRIGGER tbl_my_recipe_AI_TRG;
/

--DROP SEQUENCE tbl_my_recipe_SEQ;
/

COMMENT ON TABLE tbl_my_recipe IS '나만의 칵테일 레시피 정보'
/

COMMENT ON COLUMN tbl_my_recipe.my_recipe_seq IS '나의 레시피 순번'
/

COMMENT ON COLUMN tbl_my_recipe.my_ingredient_name IS '나의 성분'
/

COMMENT ON COLUMN tbl_my_recipe.my_ingredient_amount IS '나의 투입량'
/

COMMENT ON COLUMN tbl_my_recipe.my_ingredient_method IS '나의 비법'
/

COMMENT ON COLUMN tbl_my_recipe.u_id IS '작성자 아이디'
/

COMMENT ON COLUMN tbl_my_recipe.my_cocktail_name IS '나의 칵테일 이름'
/

ALTER TABLE tbl_my_recipe
    ADD CONSTRAINT FK_tbl_my_recipe_u_id_tbl_user FOREIGN KEY (u_id)
        REFERENCES tbl_user (u_id)
/


-- tbl_cocktail_recipe Table Create SQL
CREATE TABLE tbl_cocktail_recipe
(
    recipe_seq            NUMBER(12, 0)     NOT NULL, 
    cocktail_seq          NUMBER(12, 0)     NOT NULL, 
    ingredient_name       VARCHAR2(50)      NOT NULL, 
    ingredient_amount     NUMBER(12, 1)     NOT NULL, 
    ingredient_caution    VARCHAR2(4000)    NULL, 
     PRIMARY KEY (recipe_seq)
)
/

CREATE SEQUENCE tbl_cocktail_recipe_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER tbl_cocktail_recipe_AI_TRG
BEFORE INSERT ON tbl_cocktail_recipe 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_cocktail_recipe_SEQ.NEXTVAL
    INTO :NEW.recipe_seq
    FROM DUAL;
END;
/

--DROP TRIGGER tbl_cocktail_recipe_AI_TRG;
/

--DROP SEQUENCE tbl_cocktail_recipe_SEQ;
/

COMMENT ON TABLE tbl_cocktail_recipe IS '칵테일 레시피 정보'
/

COMMENT ON COLUMN tbl_cocktail_recipe.recipe_seq IS '레시피 순번'
/

COMMENT ON COLUMN tbl_cocktail_recipe.cocktail_seq IS '칵테일 순번'
/

COMMENT ON COLUMN tbl_cocktail_recipe.ingredient_name IS '성분 명'
/

COMMENT ON COLUMN tbl_cocktail_recipe.ingredient_amount IS '투입 량'
/

COMMENT ON COLUMN tbl_cocktail_recipe.ingredient_caution IS '주의 사항'
/

ALTER TABLE tbl_cocktail_recipe
    ADD CONSTRAINT FK_tbl_cocktail_recipe_cocktai FOREIGN KEY (cocktail_seq)
        REFERENCES tbl_cocktail (cocktail_seq)
/


-- tbl_cocktail_feature Table Create SQL
CREATE TABLE tbl_cocktail_feature
(
    feature_seq             NUMBER(12, 0)    NOT NULL, 
    cocktail_seq            NUMBER(12, 0)    NOT NULL, 
    cocktail_color          VARCHAR2(20)     NOT NULL, 
    sparkle_yn              VARCHAR2(1)      NOT NULL, 
    cocktail_base_liquid    VARCHAR2(20)     NOT NULL, 
    sweet_seq               NUMBER(12, 0)    NULL, 
    sour_seq                NUMBER(12, 0)    NULL, 
    alcohol_seq             NUMBER(12, 0)    NULL, 
    flavour_seq             NUMBER(12, 0)    NULL, 
    reg_date                DATE             DEFAULT SYSDATE NOT NULL, 
    u_id                    VARCHAR2(20)     NOT NULL, 
     PRIMARY KEY (feature_seq)
)
/

CREATE SEQUENCE tbl_cocktail_feature_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER tbl_cocktail_feature_AI_TRG
BEFORE INSERT ON tbl_cocktail_feature 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_cocktail_feature_SEQ.NEXTVAL
    INTO :NEW.feature_seq
    FROM DUAL;
END;
/

--DROP TRIGGER tbl_cocktail_feature_AI_TRG;
/

--DROP SEQUENCE tbl_cocktail_feature_SEQ;
/

COMMENT ON TABLE tbl_cocktail_feature IS '칵테일 특징'
/

COMMENT ON COLUMN tbl_cocktail_feature.feature_seq IS '특징 순번'
/

COMMENT ON COLUMN tbl_cocktail_feature.cocktail_seq IS '칵테일 순번'
/

COMMENT ON COLUMN tbl_cocktail_feature.cocktail_color IS '칵테일 색깔'
/

COMMENT ON COLUMN tbl_cocktail_feature.sparkle_yn IS '탄산 여부'
/

COMMENT ON COLUMN tbl_cocktail_feature.cocktail_base_liquid IS '칵테일 기본 술'
/

COMMENT ON COLUMN tbl_cocktail_feature.sweet_seq IS '달콤 순번'
/

COMMENT ON COLUMN tbl_cocktail_feature.sour_seq IS '신맛 순번'
/

COMMENT ON COLUMN tbl_cocktail_feature.alcohol_seq IS '알콜 도수 순번'
/

COMMENT ON COLUMN tbl_cocktail_feature.flavour_seq IS '향 순번'
/

COMMENT ON COLUMN tbl_cocktail_feature.reg_date IS '등록 일'
/

COMMENT ON COLUMN tbl_cocktail_feature.u_id IS '등록자 아이디'
/

ALTER TABLE tbl_cocktail_feature
    ADD CONSTRAINT FK_tbl_cocktail_feature_cockta FOREIGN KEY (cocktail_seq)
        REFERENCES tbl_cocktail (cocktail_seq)
/

ALTER TABLE tbl_cocktail_feature
    ADD CONSTRAINT FK_tbl_cocktail_feature_u_id_t FOREIGN KEY (u_id)
        REFERENCES tbl_user (u_id)
/

select sequence_name  from user_sequences;


