--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: trabalho_bd_vsampaio; Type: SCHEMA; Schema: -; Owner: aluno
--

CREATE SCHEMA trabalho_bd_vsampaio;


ALTER SCHEMA trabalho_bd_vsampaio OWNER TO aluno;

SET search_path = trabalho_bd_vsampaio, pg_catalog;

--
-- Name: inseriralunonaturma(); Type: FUNCTION; Schema: trabalho_bd_vsampaio; Owner: aluno
--

CREATE FUNCTION inseriralunonaturma() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
Begin
	UPDATE turma SET vagas_ocupadas = vagas_ocupadas+1 WHERE id_turma = new.id_turma;
	return new;
end;
$$;


ALTER FUNCTION trabalho_bd_vsampaio.inseriralunonaturma() OWNER TO aluno;

--
-- Name: removeralunonaturma(); Type: FUNCTION; Schema: trabalho_bd_vsampaio; Owner: aluno
--

CREATE FUNCTION removeralunonaturma() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
Begin
	UPDATE turma SET vagas_ocupadas = vagas_ocupadas-1 WHERE id_turma = old.id_turma;
	return old;
end;
$$;


ALTER FUNCTION trabalho_bd_vsampaio.removeralunonaturma() OWNER TO aluno;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aluno; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE aluno (
    id_aluno integer NOT NULL,
    matricula character varying(20) NOT NULL,
    nome_aluno character varying(300) NOT NULL,
    cpf character varying(100) NOT NULL,
    curso character varying(100) NOT NULL
);


ALTER TABLE aluno OWNER TO aluno;

--
-- Name: aluno_cursa_turma; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE aluno_cursa_turma (
    id_aluno integer NOT NULL,
    id_turma integer NOT NULL
);


ALTER TABLE aluno_cursa_turma OWNER TO aluno;

--
-- Name: aluno_participa_projeto; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE aluno_participa_projeto (
    id_aluno integer NOT NULL,
    id_projeto integer NOT NULL
);


ALTER TABLE aluno_participa_projeto OWNER TO aluno;

--
-- Name: departamento; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE departamento (
    id_departamento integer NOT NULL,
    nome_departamento character varying(200) NOT NULL,
    localizacao character varying(300) NOT NULL,
    id_chefe integer
);


ALTER TABLE departamento OWNER TO aluno;

--
-- Name: disciplina; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE disciplina (
    id_disciplina integer NOT NULL,
    nome_disciplina character varying(200) NOT NULL,
    ementa text NOT NULL,
    id_coornedador integer NOT NULL,
    id_departamento integer NOT NULL
);


ALTER TABLE disciplina OWNER TO aluno;

--
-- Name: horario; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE horario (
    id_horario integer NOT NULL,
    hora_inicial timestamp without time zone NOT NULL,
    hora_final timestamp without time zone NOT NULL
);


ALTER TABLE horario OWNER TO aluno;

--
-- Name: laboratorio; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE laboratorio (
    id_local integer NOT NULL,
    num_maquinas integer NOT NULL
);


ALTER TABLE laboratorio OWNER TO aluno;

--
-- Name: local; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE local (
    id_local integer NOT NULL,
    localizacao character varying(300) NOT NULL,
    id_departamento integer NOT NULL
);


ALTER TABLE local OWNER TO aluno;

--
-- Name: plano_departamental; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE plano_departamental (
    id_plano integer NOT NULL,
    id_semestre integer NOT NULL,
    id_departamento integer NOT NULL,
    nome_plano_depa character varying(200) NOT NULL
);


ALTER TABLE plano_departamental OWNER TO aluno;

--
-- Name: plano_departamental_tem_turmas; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE plano_departamental_tem_turmas (
    id_plano integer NOT NULL,
    id_turma integer NOT NULL
);


ALTER TABLE plano_departamental_tem_turmas OWNER TO aluno;

--
-- Name: professor; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE professor (
    id_professor integer NOT NULL,
    nome_professor character varying(200) NOT NULL,
    siape character varying(100) NOT NULL,
    cpf character varying(100) NOT NULL,
    id_departamento integer NOT NULL
);


ALTER TABLE professor OWNER TO aluno;

--
-- Name: projeto_extensao; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE projeto_extensao (
    id_projeto integer NOT NULL,
    nome_projeto character varying(300) NOT NULL,
    descricao text NOT NULL,
    data_termino date NOT NULL,
    id_departamento integer
);


ALTER TABLE projeto_extensao OWNER TO aluno;

--
-- Name: projeto_tem_semestre; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE projeto_tem_semestre (
    id_projeto integer NOT NULL,
    id_semestre integer NOT NULL
);


ALTER TABLE projeto_tem_semestre OWNER TO aluno;

--
-- Name: reserva; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE reserva (
    id_reserva integer NOT NULL,
    dia date NOT NULL,
    id_professor integer NOT NULL,
    id_local integer NOT NULL,
    data_reserva date NOT NULL
);


ALTER TABLE reserva OWNER TO aluno;

--
-- Name: reserva_p_disciplina; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE reserva_p_disciplina (
    id_reserva integer NOT NULL,
    id_turma integer NOT NULL,
    nome_disciplina character varying(200) NOT NULL
);


ALTER TABLE reserva_p_disciplina OWNER TO aluno;

--
-- Name: reserva_p_extensao; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE reserva_p_extensao (
    id_reserva integer NOT NULL,
    id_projeto integer NOT NULL,
    nome_projeto character varying(200) NOT NULL
);


ALTER TABLE reserva_p_extensao OWNER TO aluno;

--
-- Name: reserva_tem_horarios; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE reserva_tem_horarios (
    id_reserva integer NOT NULL,
    id_horario integer NOT NULL
);


ALTER TABLE reserva_tem_horarios OWNER TO aluno;

--
-- Name: sala; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE sala (
    id_local integer NOT NULL,
    num_cadeiras integer NOT NULL
);


ALTER TABLE sala OWNER TO aluno;

--
-- Name: semestre; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE semestre (
    id_semestre integer NOT NULL,
    nome_semestre character varying(200) NOT NULL,
    data_inicial date NOT NULL,
    data_final date NOT NULL
);


ALTER TABLE semestre OWNER TO aluno;

--
-- Name: turma; Type: TABLE; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

CREATE TABLE turma (
    id_turma integer NOT NULL,
    letra character(1) NOT NULL,
    observacao text,
    numero_de_vagas integer NOT NULL,
    id_semestre integer NOT NULL,
    id_disciplina integer NOT NULL,
    id_professor integer NOT NULL,
    vagas_ocupadas integer DEFAULT 0 NOT NULL,
    CONSTRAINT turma_check CHECK (((vagas_ocupadas <= numero_de_vagas) AND (vagas_ocupadas >= 0))),
    CONSTRAINT turma_numero_de_vagas_check CHECK ((numero_de_vagas > 0))
);


ALTER TABLE turma OWNER TO aluno;

--
-- Name: turma_id_turma_seq; Type: SEQUENCE; Schema: trabalho_bd_vsampaio; Owner: aluno
--

CREATE SEQUENCE turma_id_turma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE turma_id_turma_seq OWNER TO aluno;

--
-- Name: turma_id_turma_seq; Type: SEQUENCE OWNED BY; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER SEQUENCE turma_id_turma_seq OWNED BY turma.id_turma;


--
-- Name: id_turma; Type: DEFAULT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY turma ALTER COLUMN id_turma SET DEFAULT nextval('turma_id_turma_seq'::regclass);


--
-- Data for Name: aluno; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO aluno VALUES (1, '201654087', 'Joao das Aboboras', '47064483741', 'Jornalismo');
INSERT INTO aluno VALUES (2, '201635002', 'Vinicius de Castro Sampaio', '16064483741', 'Ciencia da Computacao');
INSERT INTO aluno VALUES (3, '201874012', 'Maria Joaquina Isabela', '47532498517', 'Sistemas de Informação');
INSERT INTO aluno VALUES (4, '12345678', 'Teste 1', '12345678912', 'Teste 1');
INSERT INTO aluno VALUES (5, '123456789', 'Teste 2', '1234567812', 'Teste 2');
INSERT INTO aluno VALUES (6, '12356789', 'Teste 3', '123567812', 'Teste 3');
INSERT INTO aluno VALUES (7, '123556789', 'Teste 4', '1235767812', 'Teste 4');
INSERT INTO aluno VALUES (8, '1356789', 'Teste 5', '15767812', 'Teste 5');


--
-- Data for Name: aluno_cursa_turma; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO aluno_cursa_turma VALUES (1, 1);
INSERT INTO aluno_cursa_turma VALUES (1, 2);
INSERT INTO aluno_cursa_turma VALUES (1, 3);
INSERT INTO aluno_cursa_turma VALUES (1, 4);
INSERT INTO aluno_cursa_turma VALUES (2, 1);
INSERT INTO aluno_cursa_turma VALUES (2, 2);
INSERT INTO aluno_cursa_turma VALUES (2, 3);
INSERT INTO aluno_cursa_turma VALUES (2, 4);
INSERT INTO aluno_cursa_turma VALUES (3, 4);
INSERT INTO aluno_cursa_turma VALUES (3, 1);


--
-- Data for Name: aluno_participa_projeto; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO aluno_participa_projeto VALUES (1, 1);


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO departamento VALUES (1, 'Departamento de Ciência da Computação', 'Campus Universidade Federal de Juiz de Fora, Via Local, 4569, Juiz de Fora - MG', NULL);
INSERT INTO departamento VALUES (2, 'Departamento De Jornalismo', 'Campus Universidade Federal de Juiz de Fora, Via Local, 7452, Juiz de Fora - MG', NULL);


--
-- Data for Name: disciplina; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO disciplina VALUES (1, 'Estrutura de Dados I', 'Listas ligadas: listas simples, duplas, circulares, ortogonais e matrizes.
Alocação dinâmica de memória.
Pilhas e filas.
Árvores: implementação, algoritmos de busca, inserção e remoção.
Árvores binárias de busca, árvores balanceadas: AVL, rubro-negras, B-árvores.
Representação de conjuntos.
Estruturas abstratas de dados, encapsulamento.
Exemplos de aplicações de estruturas de dados.', 1, 1);
INSERT INTO disciplina VALUES (2, 'Teoria dos Grafos', 'Conceitos Básicos
Grafos Eulerianos e Hamiltonianos
Árvores
Grafos Bipartidos
Coloração de Vértices
Emparelhamentos
Coloração de Arestas
Grafos Planares
Digrafos', 2, 1);
INSERT INTO disciplina VALUES (3, 'Introdução ao Jornalismo', 'A função social do jornalismo. A caracterização, a captação e a redação de notícias. A estrutura da notícia nos diversos meios impressos e audiovisuais. A organização e o funcionamento dos jornais e dos departamentos de jornalismo de emissoras de rádio e de televisão. As assessorias de imprensa. As agências de notícias. História do jornalismo no Brasil.', 3, 2);


--
-- Data for Name: horario; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO horario VALUES (1, '2008-01-01 08:00:00', '2008-01-01 09:00:00');
INSERT INTO horario VALUES (2, '2008-01-01 09:00:00', '2008-01-01 10:00:00');
INSERT INTO horario VALUES (3, '2008-01-01 10:00:00', '2008-01-01 11:00:00');
INSERT INTO horario VALUES (4, '2008-01-01 11:00:00', '2008-01-01 12:00:00');
INSERT INTO horario VALUES (5, '2008-01-01 12:00:00', '2008-01-01 13:00:00');


--
-- Data for Name: laboratorio; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO laboratorio VALUES (3, 45);


--
-- Data for Name: local; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO local VALUES (1, 'Prédio ICE', 1);
INSERT INTO local VALUES (2, 'Prédio ICE', 1);
INSERT INTO local VALUES (3, 'Prédio ICH', 1);


--
-- Data for Name: plano_departamental; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--



--
-- Data for Name: plano_departamental_tem_turmas; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--



--
-- Data for Name: professor; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO professor VALUES (1, 'João das Abóboras', 'HAS478XDF', '14785464789', 1);
INSERT INTO professor VALUES (2, 'Maria Joaquina', 'H8FX78XDF', '78541265478', 1);
INSERT INTO professor VALUES (3, 'Ester Ferreira', 'H8FX7981F', '65423187495', 2);


--
-- Data for Name: projeto_extensao; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO projeto_extensao VALUES (1, 'Farmacia Solidaria', 'Desenvolvimento de aplicação para coleta de medicamentos.', '2018-12-01', 1);


--
-- Data for Name: projeto_tem_semestre; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--



--
-- Data for Name: reserva; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO reserva VALUES (1, '2018-01-05', 1, 1, '2018-10-21');


--
-- Data for Name: reserva_p_disciplina; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO reserva_p_disciplina VALUES (1, 1, 'Estrutura de Dados I');


--
-- Data for Name: reserva_p_extensao; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--



--
-- Data for Name: reserva_tem_horarios; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO reserva_tem_horarios VALUES (1, 1);
INSERT INTO reserva_tem_horarios VALUES (1, 2);


--
-- Data for Name: sala; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO sala VALUES (1, 95);
INSERT INTO sala VALUES (3, 63);


--
-- Data for Name: semestre; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO semestre VALUES (1, '2018-1', '2018-01-01', '2018-07-01');
INSERT INTO semestre VALUES (2, '2018-2', '2018-07-01', '2018-12-01');


--
-- Data for Name: turma; Type: TABLE DATA; Schema: trabalho_bd_vsampaio; Owner: aluno
--

INSERT INTO turma VALUES (2, 'B', 'Matriculas encerradas!', 45, 1, 1, 1, 2);
INSERT INTO turma VALUES (3, 'A', 'Matriculas encerradas!', 60, 1, 2, 2, 2);
INSERT INTO turma VALUES (4, 'A', 'Matriculas encerradas!', 35, 2, 3, 3, 3);
INSERT INTO turma VALUES (1, 'A', 'Matriculas encerradas!', 45, 1, 1, 1, 3);


--
-- Name: turma_id_turma_seq; Type: SEQUENCE SET; Schema: trabalho_bd_vsampaio; Owner: aluno
--

SELECT pg_catalog.setval('turma_id_turma_seq', 4, true);


--
-- Name: aluno_cpf_key; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY aluno
    ADD CONSTRAINT aluno_cpf_key UNIQUE (cpf);


--
-- Name: aluno_cursa_turma_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY aluno_cursa_turma
    ADD CONSTRAINT aluno_cursa_turma_pkey PRIMARY KEY (id_aluno, id_turma);


--
-- Name: aluno_matricula_key; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY aluno
    ADD CONSTRAINT aluno_matricula_key UNIQUE (matricula);


--
-- Name: aluno_participa_projeto_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY aluno_participa_projeto
    ADD CONSTRAINT aluno_participa_projeto_pkey PRIMARY KEY (id_aluno, id_projeto);


--
-- Name: aluno_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (id_aluno);


--
-- Name: departamento_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id_departamento);


--
-- Name: disciplina_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY disciplina
    ADD CONSTRAINT disciplina_pkey PRIMARY KEY (id_disciplina);


--
-- Name: horario_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY horario
    ADD CONSTRAINT horario_pkey PRIMARY KEY (id_horario);


--
-- Name: laboratorio_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY laboratorio
    ADD CONSTRAINT laboratorio_pkey PRIMARY KEY (id_local);


--
-- Name: local_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY local
    ADD CONSTRAINT local_pkey PRIMARY KEY (id_local);


--
-- Name: plano_departamental_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY plano_departamental
    ADD CONSTRAINT plano_departamental_pkey PRIMARY KEY (id_plano);


--
-- Name: plano_departamental_tem_turmas_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY plano_departamental_tem_turmas
    ADD CONSTRAINT plano_departamental_tem_turmas_pkey PRIMARY KEY (id_plano, id_turma);


--
-- Name: professor_cpf_key; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY professor
    ADD CONSTRAINT professor_cpf_key UNIQUE (cpf);


--
-- Name: professor_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY professor
    ADD CONSTRAINT professor_pkey PRIMARY KEY (id_professor);


--
-- Name: professor_siape_key; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY professor
    ADD CONSTRAINT professor_siape_key UNIQUE (siape);


--
-- Name: projeto_extensao_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY projeto_extensao
    ADD CONSTRAINT projeto_extensao_pkey PRIMARY KEY (id_projeto);


--
-- Name: projeto_tem_semestre_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY projeto_tem_semestre
    ADD CONSTRAINT projeto_tem_semestre_pkey PRIMARY KEY (id_projeto, id_semestre);


--
-- Name: reserva_p_disciplina_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY reserva_p_disciplina
    ADD CONSTRAINT reserva_p_disciplina_pkey PRIMARY KEY (id_reserva, id_turma);


--
-- Name: reserva_p_extensao_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY reserva_p_extensao
    ADD CONSTRAINT reserva_p_extensao_pkey PRIMARY KEY (id_reserva, id_projeto);


--
-- Name: reserva_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (id_reserva);


--
-- Name: reserva_tem_horarios_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY reserva_tem_horarios
    ADD CONSTRAINT reserva_tem_horarios_pkey PRIMARY KEY (id_reserva, id_horario);


--
-- Name: sala_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY sala
    ADD CONSTRAINT sala_pkey PRIMARY KEY (id_local);


--
-- Name: semestre_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY semestre
    ADD CONSTRAINT semestre_pkey PRIMARY KEY (id_semestre);


--
-- Name: turma_letra_id_semestre_id_disciplina_key; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY turma
    ADD CONSTRAINT turma_letra_id_semestre_id_disciplina_key UNIQUE (letra, id_semestre, id_disciplina);


--
-- Name: turma_pkey; Type: CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno; Tablespace: 
--

ALTER TABLE ONLY turma
    ADD CONSTRAINT turma_pkey PRIMARY KEY (id_turma);


--
-- Name: inseriralunonaturma; Type: TRIGGER; Schema: trabalho_bd_vsampaio; Owner: aluno
--

CREATE TRIGGER inseriralunonaturma AFTER INSERT ON aluno_cursa_turma FOR EACH ROW EXECUTE PROCEDURE inseriralunonaturma();


--
-- Name: removeralunonaturma; Type: TRIGGER; Schema: trabalho_bd_vsampaio; Owner: aluno
--

CREATE TRIGGER removeralunonaturma BEFORE DELETE ON aluno_cursa_turma FOR EACH ROW EXECUTE PROCEDURE removeralunonaturma();


--
-- Name: fk_aluno; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY aluno_cursa_turma
    ADD CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno);


--
-- Name: fk_aluno_projeto; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY aluno_participa_projeto
    ADD CONSTRAINT fk_aluno_projeto FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno);


--
-- Name: fk_chefe_departamento; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT fk_chefe_departamento FOREIGN KEY (id_chefe) REFERENCES professor(id_professor);


--
-- Name: fk_disciplina_coordenador; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY disciplina
    ADD CONSTRAINT fk_disciplina_coordenador FOREIGN KEY (id_coornedador) REFERENCES professor(id_professor);


--
-- Name: fk_disciplina_departamento; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY disciplina
    ADD CONSTRAINT fk_disciplina_departamento FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento);


--
-- Name: fk_local_dep; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY local
    ADD CONSTRAINT fk_local_dep FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento);


--
-- Name: fk_plano_departamental_departamento; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY plano_departamental
    ADD CONSTRAINT fk_plano_departamental_departamento FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento);


--
-- Name: fk_plano_departamental_semestre; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY plano_departamental
    ADD CONSTRAINT fk_plano_departamental_semestre FOREIGN KEY (id_semestre) REFERENCES semestre(id_semestre);


--
-- Name: fk_plano_departamental_tem_turmas_plano; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY plano_departamental_tem_turmas
    ADD CONSTRAINT fk_plano_departamental_tem_turmas_plano FOREIGN KEY (id_plano) REFERENCES plano_departamental(id_plano);


--
-- Name: fk_plano_departamental_tem_turmas_turma; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY plano_departamental_tem_turmas
    ADD CONSTRAINT fk_plano_departamental_tem_turmas_turma FOREIGN KEY (id_turma) REFERENCES turma(id_turma);


--
-- Name: fk_professor_departamento; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY professor
    ADD CONSTRAINT fk_professor_departamento FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento);


--
-- Name: fk_projeto_extensao_departamento; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY projeto_extensao
    ADD CONSTRAINT fk_projeto_extensao_departamento FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento);


--
-- Name: fk_reserva_local; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY reserva
    ADD CONSTRAINT fk_reserva_local FOREIGN KEY (id_local) REFERENCES local(id_local);


--
-- Name: fk_reserva_p_disciplina_reserva; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY reserva_p_disciplina
    ADD CONSTRAINT fk_reserva_p_disciplina_reserva FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva);


--
-- Name: fk_reserva_p_disciplina_turma; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY reserva_p_disciplina
    ADD CONSTRAINT fk_reserva_p_disciplina_turma FOREIGN KEY (id_turma) REFERENCES turma(id_turma);


--
-- Name: fk_reserva_p_extensao; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY reserva_p_extensao
    ADD CONSTRAINT fk_reserva_p_extensao FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva);


--
-- Name: fk_reserva_p_extensao_projeto; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY reserva_p_extensao
    ADD CONSTRAINT fk_reserva_p_extensao_projeto FOREIGN KEY (id_projeto) REFERENCES projeto_extensao(id_projeto);


--
-- Name: fk_reserva_professor; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY reserva
    ADD CONSTRAINT fk_reserva_professor FOREIGN KEY (id_professor) REFERENCES professor(id_professor);


--
-- Name: fk_reserva_tem_horarios_horario; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY reserva_tem_horarios
    ADD CONSTRAINT fk_reserva_tem_horarios_horario FOREIGN KEY (id_horario) REFERENCES horario(id_horario);


--
-- Name: fk_reserva_tem_horarios_reserva; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY reserva_tem_horarios
    ADD CONSTRAINT fk_reserva_tem_horarios_reserva FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva);


--
-- Name: fk_sala_local; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY sala
    ADD CONSTRAINT fk_sala_local FOREIGN KEY (id_local) REFERENCES local(id_local);


--
-- Name: fk_sala_local; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY laboratorio
    ADD CONSTRAINT fk_sala_local FOREIGN KEY (id_local) REFERENCES local(id_local);


--
-- Name: fk_turma; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY aluno_cursa_turma
    ADD CONSTRAINT fk_turma FOREIGN KEY (id_turma) REFERENCES turma(id_turma);


--
-- Name: fk_turma_disc; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY turma
    ADD CONSTRAINT fk_turma_disc FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina);


--
-- Name: fk_turma_prof; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY turma
    ADD CONSTRAINT fk_turma_prof FOREIGN KEY (id_professor) REFERENCES professor(id_professor);


--
-- Name: fk_turma_semestre; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY turma
    ADD CONSTRAINT fk_turma_semestre FOREIGN KEY (id_semestre) REFERENCES semestre(id_semestre);


--
-- Name: projeto_tem_semestre_projeto; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY projeto_tem_semestre
    ADD CONSTRAINT projeto_tem_semestre_projeto FOREIGN KEY (id_projeto) REFERENCES projeto_extensao(id_projeto);


--
-- Name: projeto_tem_semestre_semestre; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY projeto_tem_semestre
    ADD CONSTRAINT projeto_tem_semestre_semestre FOREIGN KEY (id_semestre) REFERENCES semestre(id_semestre);


--
-- Name: turma_id_disciplina_fkey; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY turma
    ADD CONSTRAINT turma_id_disciplina_fkey FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina);


--
-- Name: turma_id_professor_fkey; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY turma
    ADD CONSTRAINT turma_id_professor_fkey FOREIGN KEY (id_professor) REFERENCES professor(id_professor);


--
-- Name: turma_id_semestre_fkey; Type: FK CONSTRAINT; Schema: trabalho_bd_vsampaio; Owner: aluno
--

ALTER TABLE ONLY turma
    ADD CONSTRAINT turma_id_semestre_fkey FOREIGN KEY (id_semestre) REFERENCES semestre(id_semestre);


--
-- PostgreSQL database dump complete
--

