CREATE DATABASE semanatextmining;
USE semanatextmining;


CREATE TABLE aluno(
	id int primary key auto_increment,
    ra char(8) NOT NULL UNIQUE
    );
    
INSERT INTO aluno(ra)VALUES('12000008');
INSERT INTO aluno(ra)VALUES('15099878');
INSERT INTO aluno(ra)VALUES('16390228');
INSERT INTO aluno(ra)VALUES('72346668');
INSERT INTO aluno(ra)VALUES('09787778');
INSERT INTO aluno(ra)VALUES('00785678');
INSERT INTO aluno(ra)VALUES('02795678');
INSERT INTO aluno(ra)VALUES('02095678');
INSERT INTO aluno(ra)VALUES('02785678');
INSERT INTO aluno(ra)VALUES('02885678');
INSERT INTO aluno(ra)VALUES('92395678');
INSERT INTO aluno(ra)VALUES('90005678');
INSERT INTO aluno(ra)VALUES('92340078');
INSERT INTO aluno(ra)VALUES('92345978');
INSERT INTO aluno(ra)VALUES('92342178');
INSERT INTO aluno(ra)VALUES('92341678');
INSERT INTO aluno(ra)VALUES('92347678');
INSERT INTO aluno(ra)VALUES('92346678');
INSERT INTO aluno(ra)VALUES('62340678');
INSERT INTO aluno(ra)VALUES('62349678');
INSERT INTO aluno(ra)VALUES('62345878');
INSERT INTO aluno(ra)VALUES('62345778');
INSERT INTO aluno(ra)VALUES('62345578');
INSERT INTO aluno(ra)VALUES('62345278');
INSERT INTO aluno(ra)VALUES('62345618');
INSERT INTO aluno(ra)VALUES('62345638');

SELECT * FROM aluno;
SELECT ra FROM aluno WHERE id <=4;	
SELECT * FROM aluno WHERE id <=4;

truncate table aluno;

show tables;


CREATE TABLE diariobordo(
	id int primary key auto_increment,
    texto TEXT NOT NULL,
    data_hora DATETIME NOT NULL,
    fk_aluno_id INT NOT NULL
    );

ALTER TABLE diariobordo ADD CONSTRAINT FK_diariobordo
	FOREIGN KEY (fk_aluno_id)
	REFERENCES aluno (id)
	ON DELETE CASCADE;
    
SELECT * FROM aluno;
SELECT * FROM diariobordo;

INSERT diariobordo(texto, data_hora, fk_aluno_id)VALUES('Texto de exemplo', '2024-08-01 09:16:00', 13);
INSERT diariobordo(texto, data_hora, fk_aluno_id)VALUES('Texto de exemplo1', '2024-08-01 10:10:00', 7);
INSERT diariobordo(texto, data_hora, fk_aluno_id)VALUES('Texto de exemplo2', '2024-08-01 08:30:00', 8);

CREATE TABLE avaliacao(
	id INT primary key auto_increment,
    nota1 INT,
    nota2 INT,
    nota3 INT,
    nota4 INT,
    fk_aluno_id INT NOT NULL
);

ALTER TABLE avaliacao ADD CONSTRAINT FK_avaliacao
	FOREIGN KEY (fk_aluno_id)
    REFERENCES aluno(id)
    ON DELETE CASCADE;
    
INSERT avaliacao(nota1, nota2, nota3, nota4, fk_aluno_id)VALUES(20,21,19,25,13);
INSERT avaliacao(nota1, nota2, nota3, nota4, fk_aluno_id)VALUES(22,11,25,25,12);
INSERT avaliacao(nota1, nota2, nota3, nota4, fk_aluno_id)VALUES(25,25,12,20,11);
INSERT avaliacao(nota1, nota2, nota3, nota4, fk_aluno_id)VALUES(10,10,10,25,10);
INSERT avaliacao(nota1, nota2, nota3, nota4, fk_aluno_id)VALUES(6,21,25,25,14);

SELECT * FROM avaliacao;

SELECT a.ra,av.nota1,av.nota2,av.nota3,av.nota4 FROM avaliacao av JOIN aluno a ON av.fk_aluno_id = a.id;

ALTER TABLE avaliacao
ADD CONSTRAINT CHECK (nota1 <=25),
ADD CONSTRAINT CHECK (nota2 <=25),
ADD CONSTRAINT CHECK (nota3 <=25),
ADD CONSTRAINT CHECK (nota4 <=25);


-- Exercicio:
-- Modelo conceitaL: crie uma nova entidade chamada "avaliação"
															-- id pk
                                                            -- nota1 INT
                                                            -- nota2 INT
                                                            -- nota3 INT
                                                            -- nota4 INT
                                                            -- fk_aluno_id
-- Modelo Lógico
-- Modelo Fisico(Br Modelo)
-- INSERT's de 5 alunos com notas
-- SELECT * FROM avaliacao
-- SELECT JOIN: tabela aluno com tabela avaliacao

ALTER TABLE aluno
ADD COLUMN tempo_de_estudo INT NOT NULL,
ADD COLUMN nome VARCHAR(50),
ADD COLUMN renda_media_salarial DECIMAL(10, 2);

DESCRIBE aluno;

SELECT * FROM aluno;

INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000000', 3, 'teste1', 1500.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000001', 2, 'teste2', 1000.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000002', 1, 'teste3', 1900.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000003', 0, 'teste4', 2500.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000004', 15, 'teste5', 22500.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000005', 3, 'teste6', 900.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000006', 5, 'teste7', 3500.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000007', 8, 'teste8', 7500.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000008', 2, 'teste9', 1000.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000009', 1, 'teste10', 1200.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000010', 6, 'teste11', 1400.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000011', 8, 'teste12', 1300.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000012', 5, 'teste13', 1800.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000013', 5, 'teste14', 2800.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000014', 0, 'teste15', 2300.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000015', 1, 'teste16', 2200.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000016', 1, 'teste17', 9000.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000017', 2, 'teste18', 1200.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000018', 15, 'teste19', 2700.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000019', 16, 'teste20', 700.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000020', 20, 'teste21', 1200.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000021', 1, 'teste22', 1800.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000022', 5, 'teste23', 1500.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000023', 6, 'teste24', 1200.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000024', 4, 'teste25', 1100.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000025', 1, 'teste26', 1550.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000026', 0, 'teste27', 1220.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000027', 0, 'teste28', 2700.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000028', 0, 'teste29', 9000.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000029', 0, 'teste30', 2500.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000030', 1, 'teste31', 7300.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000031', 2, 'teste32', 1500.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000032', 3, 'teste33', 1000.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000033', 5, 'teste34', 500.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000034', 9, 'teste35', 700.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000035', 8, 'teste36', 2500.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000036', 6, 'teste37', 2500.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000037', 5, 'teste38', 3500.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000038', 3, 'teste39', 6500.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000039', 2, 'teste40', 1000.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000040', 4, 'teste41', 1200.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000041', 3, 'teste42', 1300.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000042', 8, 'teste43', 1800.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000043', 9, 'teste44', 1100.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000044', 7, 'teste45', 1100.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000045', 8, 'teste46', 1200.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000046', 4, 'teste47', 3500.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000047', 8, 'teste48', 1200.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000048', 3, 'teste49', 1100.00);
INSERT INTO aluno(ra, tempo_de_estudo, nome, renda_media_salarial)VALUES('20000049', 2, 'teste50', 1100.00);

SELECT * FROM aluno ORDER BY id DESC LIMIT 1;

CREATE TABLE instrutor(
	id INT primary key auto_increment,
	user_name VARCHAR(100) NOT NULL UNIQUE,
	password_hash VARCHAR(256)
);
INSERT INTO instrutor (user_name, password_hash) VALUES ('admin', SHA2('admin', 256));

SELECT * FROM instrutor;