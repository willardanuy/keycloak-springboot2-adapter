
/****************************************/
/* CREATE and USE database "dbcadastro" */
/****************************************/

CREATE TABLE public.estrutura_mercadologica (
    id bigint NOT NULL,
    segmento character varying(100) NOT NULL,
    categoria character varying(100) NOT NULL,
    subcategoria character varying(100) NOT NULL
);

ALTER TABLE public.estrutura_mercadologica OWNER TO postgres;

CREATE SEQUENCE public.estrutura_mercadologica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.estrutura_mercadologica_id_seq OWNER TO postgres;

ALTER SEQUENCE public.estrutura_mercadologica_id_seq OWNED BY public.estrutura_mercadologica.id;

CREATE TABLE public.marca (
    id bigint NOT NULL,
    marca character varying(100) NOT NULL,
    fabricante character varying(100)
);

ALTER TABLE public.marca OWNER TO postgres;

CREATE SEQUENCE public.marca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.marca_id_seq OWNER TO postgres;

ALTER SEQUENCE public.marca_id_seq OWNED BY public.marca.id;

CREATE TABLE public.produto_yandeh (
    id bigint NOT NULL,
    id_tipo_produto_yandeh integer,
    codigo_fornecedor character varying(100),
    id_marca bigint,
    id_estrutura_mercadologica bigint,
    atributos_cadastrados jsonb NOT NULL,
    atributos_inferidos jsonb NOT NULL
);

ALTER TABLE public.produto_yandeh OWNER TO postgres;

CREATE SEQUENCE public.produto_yandeh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.produto_yandeh_id_seq OWNER TO postgres;

ALTER SEQUENCE public.produto_yandeh_id_seq OWNED BY public.produto_yandeh.id;

CREATE TABLE public.sku_produto (
    id character varying(100) NOT NULL,
    id_produto_yandeh bigint NOT NULL
);

ALTER TABLE public.sku_produto OWNER TO postgres;

CREATE TABLE public.tipo_produto_yandeh (
    id integer NOT NULL,
    tipo_produto_nome character varying(100) NOT NULL,
    estrutura_atributos jsonb NOT NULL
);

ALTER TABLE public.tipo_produto_yandeh OWNER TO postgres;

CREATE SEQUENCE public.tipo_produto_yandeh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.tipo_produto_yandeh_id_seq OWNER TO postgres;

ALTER SEQUENCE public.tipo_produto_yandeh_id_seq OWNED BY public.tipo_produto_yandeh.id;

ALTER TABLE ONLY public.estrutura_mercadologica ALTER COLUMN id SET DEFAULT nextval('public.estrutura_mercadologica_id_seq'::regclass);

ALTER TABLE ONLY public.marca ALTER COLUMN id SET DEFAULT nextval('public.marca_id_seq'::regclass);

ALTER TABLE ONLY public.produto_yandeh ALTER COLUMN id SET DEFAULT nextval('public.produto_yandeh_id_seq'::regclass);

ALTER TABLE ONLY public.tipo_produto_yandeh ALTER COLUMN id SET DEFAULT nextval('public.tipo_produto_yandeh_id_seq'::regclass);

INSERT INTO public.estrutura_mercadologica VALUES (1, 'Desconhecido', 'Desconhecido', 'Desconhecido');
INSERT INTO public.estrutura_mercadologica VALUES (2, 'Livraria', 'Livros', 'Humor e Entretenimento');
INSERT INTO public.estrutura_mercadologica VALUES (3, 'Livraria', 'Livros', 'Administração');
INSERT INTO public.estrutura_mercadologica VALUES (4, 'Livraria', 'Livros', 'Gastronomia');
INSERT INTO public.estrutura_mercadologica VALUES (5, 'Livraria', 'Livros', 'Literatura Nacional');
INSERT INTO public.estrutura_mercadologica VALUES (6, 'Livraria', 'Livros', 'Psicologia');
INSERT INTO public.estrutura_mercadologica VALUES (7, 'Livraria', 'Livros', 'Literatura Internacional');
INSERT INTO public.estrutura_mercadologica VALUES (8, 'Livraria', 'Livros', 'Religião');
INSERT INTO public.estrutura_mercadologica VALUES (9, 'Livraria', 'Livros', 'Arquitetura');
INSERT INTO public.estrutura_mercadologica VALUES (10, 'Livraria', 'Livro', 'Psicologia');
INSERT INTO public.estrutura_mercadologica VALUES (11, 'Livraria', 'Livro', 'Literatura Nacional');
INSERT INTO public.estrutura_mercadologica VALUES (12, 'Livraria', 'Livro', 'Literatura Internacional');
INSERT INTO public.estrutura_mercadologica VALUES (13, 'Livraria', 'Livro', 'Religião');
INSERT INTO public.estrutura_mercadologica VALUES (14, 'Livraria', 'Livro', 'Etiqueta');
INSERT INTO public.estrutura_mercadologica VALUES (15, 'Livraria', 'Livro', 'Autoajuda');
INSERT INTO public.estrutura_mercadologica VALUES (16, 'Livraria', 'Livro', 'Biografia');
INSERT INTO public.estrutura_mercadologica VALUES (17, 'Livraria', 'Livro', 'Administração');
INSERT INTO public.estrutura_mercadologica VALUES (18, 'Livraria', 'Livro', 'Artes e Fotografia');
INSERT INTO public.estrutura_mercadologica VALUES (19, 'Livraria', 'Livros', 'Juvenil');

SELECT pg_catalog.setval('public.estrutura_mercadologica_id_seq', 19, true);

INSERT INTO public.marca VALUES (1, 'Ioio', 'Hershey Company');
INSERT INTO public.marca VALUES (2, 'Editora Sextante', 'GMT Sextante');
INSERT INTO public.marca VALUES (4, 'Arqueiro', 'Arqueiro SP');
INSERT INTO public.marca VALUES (3, 'Editora Quinta', 'GMT Sextante');
INSERT INTO public.marca VALUES (5, 'Editora SP', 'Editora SP');

SELECT pg_catalog.setval('public.marca_id_seq', 5, true);

INSERT INTO public.produto_yandeh VALUES (479849, 2, NULL, 3, 5, '{"Ano": "2011", "Mês": "", "País": "", "Idioma": "", "Autores": "Parris, S. J.", "Edição": "1", "Páginas": "364", "Coleção": "", "Peso (Kg)": "0.445", "Subtitulo": "", "Tradutores": "Ribeiro, Vera", "Altura (Cm)": "23.00", "Complemento": "", "Descrição": "Heresia", "Ilustradores": "", "Largura (Cm)": "16.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "2.00", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (479923, 2, NULL, 3, 7, '{"Ano": "2009", "Mês": "", "País": "", "Idioma": "", "Autores": "Lowry, Lois", "Edição": "1", "Páginas": "192", "Coleção": "", "Peso (Kg)": "0.22", "Subtitulo": "", "Tradutores": "Newland, Maria Luiza", "Altura (Cm)": "21.00", "Complemento": "", "Descrição": "O Doador", "Ilustradores": "", "Largura (Cm)": "14.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.30", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (480064, 2, NULL, 3, 8, '{"Ano": "2011", "Mês": "", "País": "", "Idioma": "", "Autores": "Edwards, Kim", "Edição": "1", "Páginas": "336", "Coleção": "", "Peso (Kg)": "0.5", "Subtitulo": "", "Tradutores": "Abreu, Fernanda", "Altura (Cm)": "23.00", "Complemento": "", "Descrição": "Lago dos sonhos", "Ilustradores": "", "Largura (Cm)": "16.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.90", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (480405, 2, NULL, 2, 11, '{"Ano": "2010", "Mês": "", "País": "", "Idioma": "", "Autores": "Prather, Hugh ", "Edição": "1", "Páginas": "128", "Coleção": "Autoestima", "Peso (Kg)": "0.22", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.00 ", "Complemento": "", "Descrição": "Como ser feliz apesar de tudo", "Ilustradores": "", "Largura (Cm)": "14.00 ", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (480700, 2, NULL, 2, 12, '{"Ano": "2009", "Mês": "", "País": "", "Idioma": "", "Autores": "Buzan, Tony", "Edição": "1", "Páginas": "96", "Coleção": "", "Peso (Kg)": "0.60", "Subtitulo": "", "Tradutores": "Moura, Antonio", "Altura (Cm)": "21.00", "Complemento": "", "Descrição": "Memória Brilhante", "Ilustradores": "", "Largura (Cm)": "14.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Ciências Cognitivas", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (480778, 2, NULL, 2, 13, '{"Ano": "2011", "Mês": "", "País": "", "Idioma": "", "Autores": "Ribeiro, Teté", "Edição": "1", "Páginas": "240", "Coleção": "", "Peso (Kg)": "0.18", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.00 ", "Complemento": "", "Descrição": "Divas Abandonadas", "Ilustradores": "", "Largura (Cm)": "14.00 ", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (510953, 2, NULL, 2, 13, '{"Ano": "2012", "Mês": "", "País": "", "Idioma": "", "Autores": "Coelho, Paulo", "Edição": "1", "Páginas": "240", "Coleção": "", "Peso (Kg)": "0.30 ", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.00 ", "Complemento": "", "Descrição": "Onze Minutos", "Ilustradores": "", "Largura (Cm)": "14.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (720298, 2, NULL, 2, 9, '{"Ano": "2014", "Mês": "", "País": "", "Idioma": "", "Autores": "Coelho, Paulo", "Edição": "1", "Páginas": "240", "Coleção": "", "Peso (Kg)": "0.28 ", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.00 ", "Complemento": "", "Descrição": "Adultério", "Ilustradores": "", "Largura (Cm)": "14.00 ", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.40", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (722426, 2, NULL, 3, 7, '{"Ano": "2014", "Mês": "", "País": "", "Idioma": "", "Autores": "Roberts, Nora", "Edição": "1", "Páginas": "288", "Coleção": "", "Peso (Kg)": "0.29", "Subtitulo": "", "Tradutores": "Senna, Janaína", "Altura (Cm)": "23.00", "Complemento": "", "Descrição": "Mar de rosas", "Ilustradores": "", "Largura (Cm)": "16.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (740243, 2, NULL, 2, 4, '{"Ano": "2015", "Mês": "", "País": "", "Idioma": "", "Autores": "Kondo, Marie", "Edição": "1", "Páginas": "160", "Coleção": "", "Peso (Kg)": "0.187", "Subtitulo": "", "Tradutores": "Oliveira, Marcia", "Altura (Cm)": "21.00 ", "Complemento": "", "Descrição": "A mágica da arrumação", "Ilustradores": "", "Largura (Cm)": "14.00 ", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.00", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (787749, 3, NULL, 2, 1, '{"Ano": "2005", "Mês": "", "País": "", "Idioma": "", "Autores": "Goleman, Daniel", "Edição": "1", "Páginas": "48", "Coleção": "Autoestima", "Peso (Kg)": "0.15", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.00 ", "Complemento": "Acompanha CD", "Descrição": "A arte da meditação", "Ilustradores": "", "Largura (Cm)": "14.00 ", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Espiritualidade", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (788058, 4, NULL, 2, 4, '{"Ano": "2018", "Mês": "1", "País": "", "Idioma": "", "Autores": "Kruger, C. Baxter ", "Edição": "1", "Páginas": "256", "Coleção": "", "Peso (Kg)": "0.300", "Subtitulo": "", "Tradutores": "Chaves, Débora", "Altura (Cm)": "21.00", "Complemento": "", "Descrição": "A revelação", "Ilustradores": "", "Largura (Cm)": "14.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.6", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Cristianismo", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (479855, 2, NULL, 3, 6, '{"Ano": "2009", "Mês": "", "País": "", "Idioma": "", "Autores": "Sack, John", "Edição": "1", "Páginas": "336", "Coleção": "", "Peso (Kg)": "0.4", "Subtitulo": "", "Tradutores": "Calado, Alves", "Altura (Cm)": "23.00", "Complemento": "", "Descrição": "A passagem do anjo", "Ilustradores": "", "Largura (Cm)": "16.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.90", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (480081, 2, NULL, 2, 9, '{"Ano": "2011", "Mês": "", "País": "", "Idioma": "", "Autores": "Patterson, James", "Edição": "1", "Páginas": "224", "Coleção": "", "Peso (Kg)": "0.282", "Subtitulo": "", "Tradutores": "Zanon, Cássia", "Altura (Cm)": "23.00", "Complemento": "", "Descrição": "O diário de Suzana para Nicolas", "Ilustradores": "", "Largura (Cm)": "16.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.20", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (480288, 2, NULL, 2, 10, '{"Ano": "2014", "Mês": "", "País": "", "Idioma": "", "Autores": "Chapman, Gary", "Edição": "1", "Páginas": "256", "Coleção": "", "Peso (Kg)": "0.208", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.00 ", "Complemento": "", "Descrição": "O Amor Como Estilo de Vida", "Ilustradores": "", "Largura (Cm)": "14.00 ", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.30", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (513863, 2, NULL, 3, 13, '{"Ano": "2008", "Mês": "", "País": "", "Idioma": "", "Autores": "Clavell, James", "Edição": "1", "Páginas": "1040", "Coleção": "", "Peso (Kg)": "1.3", "Subtitulo": "", "Tradutores": "Bernardes, Jaime", "Altura (Cm)": "23.00", "Complemento": "", "Descrição": "Xógum", "Ilustradores": "", "Largura (Cm)": "16.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "4.60", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (613203, 2, NULL, 2, 3, '{"Ano": "2013", "Mês": "", "País": "", "Idioma": "", "Autores": "Ramal, Andrea", "Edição": "1", "Páginas": "192", "Coleção": "", "Peso (Kg)": "0.290", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.00 ", "Complemento": "", "Descrição": "Filhos bem-sucedidos", "Ilustradores": "", "Largura (Cm)": "14.00 ", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (613859, 2, NULL, 3, 3, '{"Ano": "2013", "Mês": "", "País": "", "Idioma": "", "Autores": "Carrasco, Walcyr", "Edição": "1", "Páginas": "208", "Coleção": "", "Peso (Kg)": "0.260", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "23.00", "Complemento": "", "Descrição": "Juntos para sempre", "Ilustradores": "", "Largura (Cm)": "16.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (706421, 2, NULL, 3, 8, '{"Ano": "2013", "Mês": "", "País": "", "Idioma": "", "Autores": "Sparks, Nicholas", "Edição": "1", "Páginas": "368", "Coleção": "", "Peso (Kg)": "0.430", "Subtitulo": "", "Tradutores": "Biase, Maria Clara de", "Altura (Cm)": "23.00", "Complemento": "", "Descrição": "Uma longa jornada", "Ilustradores": "", "Largura (Cm)": "16.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (740554, 2, NULL, 2, 9, '{"Ano": "2015", "Mês": "", "País": "", "Idioma": "", "Autores": "Marotta, Millie", "Edição": "1", "Páginas": "96", "Coleção": "", "Peso (Kg)": "0.27 ", "Subtitulo": "", "Tradutores": "Til, Sheila", "Altura (Cm)": "25.00 ", "Complemento": "", "Descrição": "Reino Animal", "Ilustradores": "", "Largura (Cm)": "25.00 ", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (757408, 2, NULL, 2, 19, '{"Ano": "2015", "Mês": "", "País": "", "Idioma": "", "Autores": "Marotta, Millie", "Edição": "1", "Páginas": "96", "Coleção": "", "Peso (Kg)": "0.32 ", "Subtitulo": "", "Tradutores": "Dib, Renata", "Altura (Cm)": "25.00 ", "Complemento": "", "Descrição": "Paraíso Tropical", "Ilustradores": "", "Largura (Cm)": "25.00 ", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "0.9", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Artes Plásticas", "2": "Pintura", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (768562, 3, NULL, 2, 13, '{"Ano": "2016", "Mês": "", "País": "", "Idioma": "", "Autores": "Holtz, Samanta", "Edição": "1", "Páginas": "304", "Coleção": "", "Peso (Kg)": "", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "", "Complemento": "", "Descrição": "Quando o amor bater à sua porta", "Ilustradores": "", "Largura (Cm)": "", "Organizadores": "", "Encadernação": "", "Comprimento (Cm)": "", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (788070, 4, NULL, 3, 8, '{"Ano": "2018", "Mês": "1", "País": "", "Idioma": "", "Autores": "Abercrombie, Joe", "Edição": "1", "Páginas": "368", "Coleção": "", "Peso (Kg)": "0.41", "Subtitulo": "", "Tradutores": "Calado, Alves", "Altura (Cm)": "23.00", "Complemento": "", "Descrição": "Meia guerra", "Ilustradores": "", "Largura (Cm)": "16.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.80", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Ficção Fantasiosa", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (788072, 4, NULL, 3, 8, '{"Ano": "2003", "Mês": "", "País": "", "Idioma": "", "Autores": "Albom, Mitch", "Edição": "1", "Páginas": "192", "Coleção": "", "Peso (Kg)": "0.3", "Subtitulo": "", "Tradutores": "Jorgensen, Pedro", "Altura (Cm)": "21.00", "Complemento": "", "Descrição": "As cinco pessoas que você encontra no céu", "Ilustradores": "", "Largura (Cm)": "14.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.00", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (428033, 2, NULL, 5, 3, '{"Ano": "2010", "Mês": "", "País": "", "Idioma": "", "Autores": "Autry, James A.", "Edição": "1", "Páginas": "225", "Coleção": "", "Peso (Kg)": "0.290", "Subtitulo": "Como construir um time criativo, desenvolver a motivação e melhorar o desempenho da sua equipe", "Tradutores": "", "Altura (Cm)": "21.0", "Complemento": "", "Descrição": "O líder servidor", "Ilustradores": "", "Largura (Cm)": "14.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.3", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Liderança", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (744090, 2, NULL, 4, 3, '{"Ano": "2015", "Mês": "", "País": "", "Idioma": "", "Autores": "Gomyde, Maurício", "Edição": "1", "Páginas": "272", "Coleção": "", "Peso (Kg)": "0.372", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "23.00", "Complemento": "", "Descrição": "Surpreendente", "Ilustradores": "", "Largura (Cm)": "16.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.60", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (769024, 3, NULL, 5, 18, '{"Ano": "2016", "Mês": "", "País": "", "Idioma": "", "Autores": "Carlan, Audrey", "Edição": "4", "Páginas": "160", "Coleção": "A garota do calendário", "Peso (Kg)": "0.210", "Subtitulo": "", "Tradutores": "Barboza, Andréia", "Altura (Cm)": "21.0", "Complemento": "", "Descrição": "A garota do calendário: Dezembro", "Ilustradores": "", "Largura (Cm)": "14.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.3", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Ficção Erótica", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (779190, 3, NULL, 2, 8, '{"Ano": "2017", "Mês": "10", "País": "", "Idioma": "Português", "Autores": "Correa, Cristiane", "Edição": "1", "Páginas": "192", "Coleção": "", "Peso (Kg)": "0.323", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "23.0", "Complemento": "", "Descrição": "Vicente Falconi", "Ilustradores": "", "Largura (Cm)": "16.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.2", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Empreendedorismo", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (782621, 3, NULL, 2, 18, '{"Ano": "2010", "Mês": "", "País": "", "Idioma": "", "Autores": "Coelho, Paulo", "Edição": "1", "Páginas": "256", "Coleção": "", "Peso (Kg)": "0.32 ", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.00 ", "Complemento": "", "Descrição": "Aleph", "Ilustradores": "", "Largura (Cm)": "14.00 ", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (787802, 3, NULL, 4, 2, '{"Ano": "2017", "Mês": "", "País": "", "Idioma": "", "Autores": "Ferrante, Elena", "Edição": "1", "Páginas": "416", "Coleção": "", "Peso (Kg)": "0.442", "Subtitulo": "", "Tradutores": "Lino, Marcello", "Altura (Cm)": "21.00", "Complemento": "", "Descrição": "Frantumaglia", "Ilustradores": "", "Largura (Cm)": "14.00", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "2.5", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Autobiografia", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (788101, 4, NULL, 4, 8, '{"Ano": "2013", "Mês": "", "País": "", "Idioma": "", "Autores": "Meyer, Stephenie", "Edição": "1", "Páginas": "464", "Coleção": "Crepúsculo", "Peso (Kg)": "0.457", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.0", "Complemento": "", "Descrição": "Amanhecer - Série branca", "Ilustradores": "", "Largura (Cm)": "14.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "2.6", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "Ficção Fantasiosa", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (788102, 4, NULL, 4, 8, '{"Ano": "2013", "Mês": "", "País": "", "Idioma": "", "Autores": "Meyer, Stephenie", "Edição": "1", "Páginas": "320", "Coleção": "Crepúsculo", "Peso (Kg)": "0.323", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.0", "Complemento": "", "Descrição": "Lua Nova - Série Branca", "Ilustradores": "", "Largura (Cm)": "14.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.8", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "Ficção Fantasiosa", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (788103, 4, NULL, 4, 8, '{"Ano": "2013", "Mês": "", "País": "", "Idioma": "", "Autores": "Meyer, Stephenie", "Edição": "1", "Páginas": "288", "Coleção": "Crepúsculo", "Peso (Kg)": "0.293", "Subtitulo": "", "Tradutores": "Vinagre, Ryta", "Altura (Cm)": "21.0", "Complemento": "", "Descrição": "Crepúsculo - Série Branca", "Ilustradores": "", "Largura (Cm)": "14.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.6", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "Ficção Fantasiosa", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (788104, 4, NULL, 4, 8, '{"Ano": "2003", "Mês": "", "País": "", "Idioma": "", "Autores": "Pille, Lolita", "Edição": "1", "Páginas": "208", "Coleção": "", "Peso (Kg)": "0.26", "Subtitulo": "", "Tradutores": "Bandeira, Julio", "Altura (Cm)": "21.0", "Complemento": "", "Descrição": "Hell - Paris-75016", "Ilustradores": "", "Largura (Cm)": "14.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.2", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (788105, 4, NULL, 4, 8, '{"Ano": "2004", "Mês": "", "País": "", "Idioma": "", "Autores": "Pille, Lolita", "Edição": "1", "Páginas": "272", "Coleção": "", "Peso (Kg)": "0.34", "Subtitulo": "", "Tradutores": "Bandeira, Julio", "Altura (Cm)": "21.0", "Complemento": "", "Descrição": "Bubble Gum", "Ilustradores": "", "Largura (Cm)": "14.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.5", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (779150, 3, NULL, 5, 19, '{"Ano": "2006", "Mês": "", "País": "", "Idioma": "", "Autores": "Pierce, Gregory F. A.", "Edição": "1", "Páginas": "170", "Coleção": "", "Peso (Kg)": "0.220", "Subtitulo": "10 maneiras de equilibrar sua vida profissional", "Tradutores": "", "Altura (Cm)": "21.0", "Complemento": "", "Descrição": "Espiritualidade no trabalho", "Ilustradores": "", "Largura (Cm)": "14.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "0.9", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Desenvolvimento Profissional", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (428034, 2, NULL, 5, 4, '{"Ano": "2011", "Mês": "", "País": "", "Idioma": "", "Autores": "Bracken, Peg", "Edição": "1", "Páginas": "220", "Coleção": "", "Peso (Kg)": "0.280", "Subtitulo": "Receitas fáceis para quem tem mais o que fazer", "Tradutores": "Ferreira, Cínara C. Mendonça", "Altura (Cm)": "21.0", "Complemento": "", "Descrição": "Eu odeio cozinhar - Receitas fáceis para quem tem mais o que fazer", "Ilustradores": "", "Largura (Cm)": "14.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.3", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (482959, 2, NULL, 5, 13, '{"Ano": "2010", "Mês": "", "País": "", "Idioma": "", "Autores": "Alves, Rubem", "Edição": "4", "Páginas": "158", "Coleção": "", "Peso (Kg)": "0.220", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.0", "Complemento": "", "Descrição": "O Deus que conheço", "Ilustradores": "", "Largura (Cm)": "14.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "0.9", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (528486, 2, NULL, 5, 8, '{"Ano": "2012", "Mês": "", "País": "", "Idioma": "", "Autores": "Tamaro, Susanna", "Edição": "1", "Páginas": "192", "Coleção": "", "Peso (Kg)": "0.260", "Subtitulo": "", "Tradutores": "Fondelli, Mario", "Altura (Cm)": "21.0", "Complemento": "", "Descrição": "Para sempre", "Ilustradores": "", "Largura (Cm)": "14.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.4", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (713913, 2, NULL, 5, 6, '{"Ano": "2013", "Mês": "", "País": "", "Idioma": "", "Autores": "Barboza, Patrícia", "Edição": "3", "Páginas": "160", "Coleção": "As mais", "Peso (Kg)": "0.296", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "23.0", "Complemento": "", "Descrição": "As Mais 3: Andando nas nuvens", "Ilustradores": "", "Largura (Cm)": "16.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.0", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Literatura Nacional", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (713915, 2, NULL, 5, 10, '{"Ano": "2013", "Mês": "", "País": "", "Idioma": "", "Autores": "Pourrat, Paulo; Giolo, Luiz Fernando; Baroni, Ivan", "Edição": "1", "Páginas": "144", "Coleção": "", "Peso (Kg)": "0.220", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.0", "Complemento": "", "Descrição": "Piadas Nerds: As melhores cantadas nerds", "Ilustradores": "", "Largura (Cm)": "14.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "0.9", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (737273, 2, NULL, 5, 7, '{"Ano": "2015", "Mês": "", "País": "", "Idioma": "", "Autores": "Rissi, Carina", "Edição": "6", "Páginas": "476", "Coleção": "", "Peso (Kg)": "0.620", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "23.0", "Complemento": "", "Descrição": "No mundo da Luna", "Ilustradores": "", "Largura (Cm)": "16.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "2.7", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (739560, 2, NULL, 5, 6, '{"Ano": "2015", "Mês": "", "País": "", "Idioma": "", "Autores": "Briones, Bianca", "Edição": "2", "Páginas": "406", "Coleção": "Batidas perdidas", "Peso (Kg)": "0.520", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "23.0", "Complemento": "", "Descrição": "O descompasso infinito do coração", "Ilustradores": "", "Largura (Cm)": "16.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "2.3", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (771498, 3, NULL, 5, 6, '{"Ano": "2016", "Mês": "", "País": "", "Idioma": "", "Autores": "Brandão, Ana Beatriz", "Edição": "5", "Páginas": "294", "Coleção": "", "Peso (Kg)": "0.390", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "23.0", "Complemento": "", "Descrição": "O garoto do cachecol vermelho", "Ilustradores": "", "Largura (Cm)": "16.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.7", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Literatura Nacional", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (779131, 3, NULL, 5, 6, '{"Ano": "2005", "Mês": "", "País": "", "Idioma": "", "Autores": "Alves, Rubem", "Edição": "2", "Páginas": "154", "Coleção": "", "Peso (Kg)": "0.30 ", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.00 ", "Complemento": "", "Descrição": "Um céu numa flor silvestre", "Ilustradores": "", "Largura (Cm)": "14.00 ", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Contos e Crônicas", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (614598, 2, NULL, 5, 8, '{"Ano": "2012", "Mês": "", "País": "", "Idioma": "", "Autores": "Pourrat, Paulo; Giolo, Luiz Fernando; Baroni, Ivan", "Edição": "1", "Páginas": "104", "Coleção": "", "Peso (Kg)": "0.128", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "18.00 ", "Complemento": "", "Descrição": "Piadas Nerds: As melhores piadas para o pai nerd", "Ilustradores": "", "Largura (Cm)": "12.00 ", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "0.7", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (195752, 1, NULL, 1, 1, '{"Peso": "", "Autor": "NA", "Formato": "NI", "Edição": "NA", "Cor/Sabor": "NI", "Descrição": "Mix Crem Ioio 180 g", "Linha/Versão": "Mix Crem", "_Visualizações": {"04039770000107": {"": "", "_Hierarquia": {}}}, "Nome da Coleção": "NA", "Tipo de Embalagem": "Pote", "Unidade de Medida": "gr", "Ano de Lançamento": "NA", "Data de Lançamento": "", "Ingrediente/Material": "NI", "Medida do Fabricante": "180", "Unidades na Embalagem": "1", "Quantidade de Páginas": ""}', '{}');
INSERT INTO public.produto_yandeh VALUES (428030, 2, NULL, 5, 2, '{"Ano": "2009", "Mês": "", "País": "", "Idioma": "", "Autores": "Coussinoux, Sandrine; Imbert, Dominique; Q., Natacha", "Edição": "1", "Páginas": "111", "Coleção": "", "Peso (Kg)": "0.150", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.0", "Complemento": "", "Descrição": "Você tem boa memória? Testes e exercícios para desenvolver a capacidade de memorização", "Ilustradores": "", "Largura (Cm)": "14.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "0.6", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (528322, 2, NULL, 5, 10, '{"Ano": "2012", "Mês": "", "País": "", "Idioma": "", "Autores": "Russell, Rachel Renée", "Edição": "1", "Páginas": "872", "Coleção": "", "Peso (Kg)": "1.50 ", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "23.40 ", "Complemento": "", "Descrição": "Diário de uma garota nada popular - Box", "Ilustradores": "", "Largura (Cm)": "15.00 ", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Literatura internacional", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (707175, 2, NULL, 5, 2, '{"Ano": "2013", "Mês": "", "País": "", "Idioma": "", "Autores": "McGuire, Jamie", "Edição": "14", "Páginas": "406", "Coleção": "Belo desastre", "Peso (Kg)": "0.535", "Subtitulo": "", "Tradutores": "Duarte, Ana Death", "Altura (Cm)": "23.0", "Complemento": "", "Descrição": "Desastre Iminente", "Ilustradores": "", "Largura (Cm)": "16.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "2.3", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (708378, 2, NULL, 5, 3, '{"Ano": "2012", "Mês": "", "País": "", "Idioma": "", "Autores": "Hipolito, Elaine", "Edição": "1", "Páginas": "188", "Coleção": "Guia para toda hora", "Peso (Kg)": "0.118", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "12.0", "Complemento": "", "Descrição": "Pequeno livro de decoração: Guia para toda hora", "Ilustradores": "", "Largura (Cm)": "10.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.2", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Decoração", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (708379, 2, NULL, 5, 9, '{"Ano": "2010", "Mês": "", "País": "", "Idioma": "", "Autores": "Markert, Tom", "Edição": "1", "Páginas": "147", "Coleção": "", "Peso (Kg)": "0.190", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.0", "Complemento": "", "Descrição": "102 regras para ser um profissional de sucesso", "Ilustradores": "", "Largura (Cm)": "14.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "0.8", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Desenvolvimento Profissional", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (738077, 2, NULL, 2, 5, '{"Ano": "2015", "Mês": "", "País": "", "Idioma": "", "Autores": "Lewis, Sarah", "Edição": "1", "Páginas": "256", "Coleção": "", "Peso (Kg)": "0.14 ", "Subtitulo": "", "Tradutores": "Cunha, Alfonso da", "Altura (Cm)": "23.00 ", "Complemento": "", "Descrição": "O Poder Do Fracasso", "Ilustradores": "", "Largura (Cm)": "16.00 ", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.5", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (749382, 2, NULL, 5, 8, '{"Ano": "2015", "Mês": "", "País": "", "Idioma": "", "Autores": "Webber, Tammara", "Edição": "2", "Páginas": "322", "Coleção": "Contornos do coração", "Peso (Kg)": "0.420", "Subtitulo": "", "Tradutores": "Isidoro, Débora", "Altura (Cm)": "23.0", "Complemento": "", "Descrição": "Sweet", "Ilustradores": "", "Largura (Cm)": "16.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.9", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Romance", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (758868, 2, NULL, 5, 18, '{"Ano": "2016", "Mês": "", "País": "", "Idioma": "", "Autores": "Ee, Susan", "Edição": "1", "Páginas": "280", "Coleção": "Fim dos dias", "Peso (Kg)": "0.380", "Subtitulo": "", "Tradutores": "D''''Orazio, Monique", "Altura (Cm)": "23.0", "Complemento": "", "Descrição": "A queda dos anjos", "Ilustradores": "", "Largura (Cm)": "16.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "1.6", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Ficção Fantasiosa", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (768289, 2, NULL, 2, 19, '{"Ano": "2016", "Mês": "", "País": "", "Idioma": "", "Autores": "Basford, Johanna", "Edição": "1", "Páginas": "88", "Coleção": "", "Peso (Kg)": "0.304", "Subtitulo": "", "Tradutores": "Dib, Renata", "Altura (Cm)": "25.00 ", "Complemento": "", "Descrição": "Selva Mágica", "Ilustradores": "", "Largura (Cm)": "25.00 ", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "0.80", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Artes Plásticas", "2": "", "3": ""}}}}', '{}');
INSERT INTO public.produto_yandeh VALUES (779136, 3, NULL, 5, 2, '{"Ano": "2005", "Mês": "", "País": "", "Idioma": "", "Autores": "Alves, Rubem", "Edição": "10", "Páginas": "128", "Coleção": "", "Peso (Kg)": "0.190", "Subtitulo": "", "Tradutores": "", "Altura (Cm)": "21.0", "Complemento": "", "Descrição": "Educação dos sentidos e mais...", "Ilustradores": "", "Largura (Cm)": "14.0", "Organizadores": "", "Encadernação": "Brochura", "Comprimento (Cm)": "0.8", "_Visualizações": {"04039770000107": {"_Hierarquia": {"1": "Contos e Crônicas", "2": "", "3": ""}}}}', '{}');

SELECT pg_catalog.setval('public.produto_yandeh_id_seq', 788105, true);

INSERT INTO public.sku_produto VALUES ('9788543100456', 720298);
INSERT INTO public.sku_produto VALUES ('9788575427514', 510953);
INSERT INTO public.sku_produto VALUES ('9788575425718', 480405);
INSERT INTO public.sku_produto VALUES ('9788575427095', 480778);
INSERT INTO public.sku_produto VALUES ('9788543102092', 740243);
INSERT INTO public.sku_produto VALUES ('9788575421864', 787749);
INSERT INTO public.sku_produto VALUES ('7898292884070', 195752);
INSERT INTO public.sku_produto VALUES ('9788543105659', 788058);
INSERT INTO public.sku_produto VALUES ('9788599296448', 479923);
INSERT INTO public.sku_produto VALUES ('9788580412734', 722426);
INSERT INTO public.sku_produto VALUES ('9788580410044', 480064);
INSERT INTO public.sku_produto VALUES ('9788580410020', 479849);
INSERT INTO public.sku_produto VALUES ('9788575424926', 480700);
INSERT INTO public.sku_produto VALUES ('9788543101859', 738077);
INSERT INTO public.sku_produto VALUES ('9788575425077', 480288);
INSERT INTO public.sku_produto VALUES ('9788575421420', 788072);
INSERT INTO public.sku_produto VALUES ('9788580417425', 788070);
INSERT INTO public.sku_produto VALUES ('9788599296509', 479855);
INSERT INTO public.sku_produto VALUES ('9788580410273', 480081);
INSERT INTO public.sku_produto VALUES ('9788580415988', 768562);
INSERT INTO public.sku_produto VALUES ('9788580411355', 613859);
INSERT INTO public.sku_produto VALUES ('9788580411959', 706421);
INSERT INTO public.sku_produto VALUES ('9788599296332', 513863);
INSERT INTO public.sku_produto VALUES ('9788543102221', 740554);
INSERT INTO public.sku_produto VALUES ('9788543103204', 757408);
INSERT INTO public.sku_produto VALUES ('9788575428931', 613203);
INSERT INTO public.sku_produto VALUES ('9788575425770', 782621);
INSERT INTO public.sku_produto VALUES ('9788543103822', 768289);
INSERT INTO public.sku_produto VALUES ('9788551002261', 787802);
INSERT INTO public.sku_produto VALUES ('9788580578089', 744090);
INSERT INTO public.sku_produto VALUES ('9788568377161', 779190);
INSERT INTO public.sku_produto VALUES ('9788580573657', 788101);
INSERT INTO public.sku_produto VALUES ('9788580573671', 788103);
INSERT INTO public.sku_produto VALUES ('9788580573664', 788102);
INSERT INTO public.sku_produto VALUES ('9788598078045', 788105);
INSERT INTO public.sku_produto VALUES ('9788598078014', 788104);
INSERT INTO public.sku_produto VALUES ('9788576865339', 769024);
INSERT INTO public.sku_produto VALUES ('9788576860921', 428033);
INSERT INTO public.sku_produto VALUES ('9788576861454', 428034);
INSERT INTO public.sku_produto VALUES ('9788576860679', 482959);
INSERT INTO public.sku_produto VALUES ('9788576862246', 713913);
INSERT INTO public.sku_produto VALUES ('9788576863021', 737273);
INSERT INTO public.sku_produto VALUES ('9788576861577', 528486);
INSERT INTO public.sku_produto VALUES ('9788576864042', 739560);
INSERT INTO public.sku_produto VALUES ('9788587795991', 779150);
INSERT INTO public.sku_produto VALUES ('9788576865353', 771498);
INSERT INTO public.sku_produto VALUES ('9788587795687', 779131);
INSERT INTO public.sku_produto VALUES ('9788576862505', 713915);
INSERT INTO public.sku_produto VALUES ('9788576861898', 614598);
INSERT INTO public.sku_produto VALUES ('9788576862550', 707175);
INSERT INTO public.sku_produto VALUES ('9788576863786', 758868);
INSERT INTO public.sku_produto VALUES ('9788576864721', 749382);
INSERT INTO public.sku_produto VALUES ('9788576860587', 428030);
INSERT INTO public.sku_produto VALUES ('9788587795779', 779136);
INSERT INTO public.sku_produto VALUES ('9788576861867', 708378);
INSERT INTO public.sku_produto VALUES ('9788501300287', 528322);
INSERT INTO public.sku_produto VALUES ('9788576860730', 708379);

INSERT INTO public.tipo_produto_yandeh VALUES (1, 'Livros', '{"ano": 0, "mes": ["jan", "fev", "mar", "abr", "mai", "jun", "jul", "ago", "set", "out", "nov", "dez"], "edicao": 0, "idioma": ["Português", "Ingles", "Espanhol"], "encadernacao": ["Brochura", "Canoa", "Esprial"]}');
INSERT INTO public.tipo_produto_yandeh VALUES (2, 'Livro impresso', '{"ano": 0, "mes": ["jan", "fev", "mar", "abr", "mai", "jun", "jul", "ago", "set", "out", "nov", "dez"], "edicao": 0, "idioma": ["Português", "Ingles", "Espanhol"], "encadernacao": ["Brochura", "Canoa", "Esprial"]}');
INSERT INTO public.tipo_produto_yandeh VALUES (3, 'E-Book', '{"ano": 0, "mes": ["jan", "fev", "mar", "abr", "mai", "jun", "jul", "ago", "set", "out", "nov", "dez"], "edicao": 0, "idioma": ["Português", "Ingles", "Espanhol"], "encadernacao": ["Brochura", "Canoa", "Esprial"]}');
INSERT INTO public.tipo_produto_yandeh VALUES (4, 'Livros Infantis', '{"ano": 0, "mes": ["jan", "fev", "mar", "abr", "mai", "jun", "jul", "ago", "set", "out", "nov", "dez"], "edicao": 0, "idioma": ["Português", "Ingles", "Espanhol"], "encadernacao": ["Brochura", "Canoa", "Esprial"]}');

SELECT pg_catalog.setval('public.tipo_produto_yandeh_id_seq', 4, true);

ALTER TABLE ONLY public.estrutura_mercadologica
    ADD CONSTRAINT pk_estrutura_mercadologica PRIMARY KEY (id);

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT pk_fabricante_id PRIMARY KEY (id);

ALTER TABLE ONLY public.produto_yandeh
    ADD CONSTRAINT pk_produto_yandeh_id PRIMARY KEY (id);

ALTER TABLE ONLY public.sku_produto
    ADD CONSTRAINT pk_sku_produto_id PRIMARY KEY (id);

ALTER TABLE ONLY public.tipo_produto_yandeh
    ADD CONSTRAINT pk_tipo_produto_id PRIMARY KEY (id);

ALTER TABLE ONLY public.estrutura_mercadologica
    ADD CONSTRAINT uq_estrutura_mercadologica_mercado_categoria_subcategoria UNIQUE (segmento, categoria, subcategoria);
    
CREATE INDEX idx_produto_yandeh_id_estrutura_mercadologica ON public.produto_yandeh USING btree (id_estrutura_mercadologica);

CREATE INDEX idx_produto_yandeh_id_marca ON public.produto_yandeh USING btree (id_marca);

CREATE INDEX idx_produto_yandeh_tipo_produto_yandeh ON public.produto_yandeh USING btree (id_tipo_produto_yandeh);

CREATE INDEX idx_sku_produto_id_produto_yandeh ON public.sku_produto USING btree (id_produto_yandeh);

ALTER TABLE ONLY public.produto_yandeh
    ADD CONSTRAINT fk_produto_yandeh_estrutura_mercadologica FOREIGN KEY (id_estrutura_mercadologica) REFERENCES public.estrutura_mercadologica(id);

ALTER TABLE ONLY public.produto_yandeh
    ADD CONSTRAINT fk_produto_yandeh_marca FOREIGN KEY (id_marca) REFERENCES public.marca(id);

ALTER TABLE ONLY public.produto_yandeh
    ADD CONSTRAINT fk_produto_yandeh_tipo_produto FOREIGN KEY (id_tipo_produto_yandeh) REFERENCES public.tipo_produto_yandeh(id);

ALTER TABLE ONLY public.sku_produto
    ADD CONSTRAINT fk_sku_produto_produto_yandeh FOREIGN KEY (id_produto_yandeh) REFERENCES public.produto_yandeh(id);