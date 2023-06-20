CREATE TABLE T_USER (
  cpf   NUMBER(11)  NOT NULL,
  nome  VARCHAR(40) NOT NULL,
  email VARCHAR(40) NOT NULL,
  senha VARCHAR(60) NOT NULL,
  PRIMARY KEY(cpf)
);

CREATE TABLE T_CARTEIRA (
  cd_carteira NUMBER(4)   NOT NULL,
  T_USER_cpf  NUMBER(11)  NOT NULL,
  nome        VARCHAR(40) NOT NULL,
  descricao   VARCHAR(100),
  PRIMARY KEY(cd_carteira),
  FOREIGN KEY(T_USER_cpf) REFERENCES T_USER(cpf)
);

CREATE TABLE T_TRANSACAO (
  cd_transacao           NUMBER(4)   NOT NULL,
  T_CARTEIRA_cd_carteira NUMBER(4)   NOT NULL,
  tipo                   VARCHAR(10) NOT NULL,
  nome                   VARCHAR(40) NOT NULL,
  valor                  NUMBER(6,2) NOT NULL,
  data                   DATE,
  PRIMARY KEY(cd_transacao),
  FOREIGN KEY(T_CARTEIRA_cd_carteira) REFERENCES T_CARTEIRA(cd_carteira)
);

CREATE TABLE T_META (
  cd_meta                NUMBER(4)   NOT NULL,
  T_CARTEIRA_cd_carteira NUMBER(4)   NOT NULL,
  nome                   VARCHAR(40) NOT NULL,
  gasto_mensal           NUMBER(6,2) NOT NULL,
  PRIMARY KEY(cd_meta),
  FOREIGN KEY(T_CARTEIRA_cd_carteira) REFERENCES T_CARTEIRA(cd_carteira)
);