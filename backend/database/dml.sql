-- Script DML para inserção de dados de teste
USE task_manager;

-- Inserção de usuários (30 registros)
INSERT INTO `Users` (`googleId`, `email`, `name`, `avatar`, `createdAt`, `updatedAt`) VALUES
('g10001', 'joao.silva@example.com', 'João Silva', 'https://ui-avatars.com/api/?name=João+Silva', NOW(), NOW()),
('g10002', 'maria.oliveira@example.com', 'Maria Oliveira', 'https://ui-avatars.com/api/?name=Maria+Oliveira', NOW(), NOW()),
('g10003', 'pedro.santos@example.com', 'Pedro Santos', 'https://ui-avatars.com/api/?name=Pedro+Santos', NOW(), NOW()),
('g10004', 'ana.souza@example.com', 'Ana Souza', 'https://ui-avatars.com/api/?name=Ana+Souza', NOW(), NOW()),
('g10005', 'carlos.ferreira@example.com', 'Carlos Ferreira', 'https://ui-avatars.com/api/?name=Carlos+Ferreira', NOW(), NOW()),
('g10006', 'juliana.lima@example.com', 'Juliana Lima', 'https://ui-avatars.com/api/?name=Juliana+Lima', NOW(), NOW()),
('g10007', 'rafael.costa@example.com', 'Rafael Costa', 'https://ui-avatars.com/api/?name=Rafael+Costa', NOW(), NOW()),
('g10008', 'fernanda.almeida@example.com', 'Fernanda Almeida', 'https://ui-avatars.com/api/?name=Fernanda+Almeida', NOW(), NOW()),
('g10009', 'gustavo.martins@example.com', 'Gustavo Martins', 'https://ui-avatars.com/api/?name=Gustavo+Martins', NOW(), NOW()),
('g10010', 'paula.rodrigues@example.com', 'Paula Rodrigues', 'https://ui-avatars.com/api/?name=Paula+Rodrigues', NOW(), NOW()),
('g10011', 'lucas.pereira@example.com', 'Lucas Pereira', 'https://ui-avatars.com/api/?name=Lucas+Pereira', NOW(), NOW()),
('g10012', 'camila.santos@example.com', 'Camila Santos', 'https://ui-avatars.com/api/?name=Camila+Santos', NOW(), NOW()),
('g10013', 'thiago.oliveira@example.com', 'Thiago Oliveira', 'https://ui-avatars.com/api/?name=Thiago+Oliveira', NOW(), NOW()),
('g10014', 'natalia.costa@example.com', 'Natália Costa', 'https://ui-avatars.com/api/?name=Natália+Costa', NOW(), NOW()),
('g10015', 'bruno.alves@example.com', 'Bruno Alves', 'https://ui-avatars.com/api/?name=Bruno+Alves', NOW(), NOW()),
('g10016', 'amanda.silva@example.com', 'Amanda Silva', 'https://ui-avatars.com/api/?name=Amanda+Silva', NOW(), NOW()),
('g10017', 'marcelo.lima@example.com', 'Marcelo Lima', 'https://ui-avatars.com/api/?name=Marcelo+Lima', NOW(), NOW()),
('g10018', 'patricia.ferreira@example.com', 'Patrícia Ferreira', 'https://ui-avatars.com/api/?name=Patrícia+Ferreira', NOW(), NOW()),
('g10019', 'felipe.souza@example.com', 'Felipe Souza', 'https://ui-avatars.com/api/?name=Felipe+Souza', NOW(), NOW()),
('g10020', 'cristina.martins@example.com', 'Cristina Martins', 'https://ui-avatars.com/api/?name=Cristina+Martins', NOW(), NOW()),
('g10021', 'roberto.almeida@example.com', 'Roberto Almeida', 'https://ui-avatars.com/api/?name=Roberto+Almeida', NOW(), NOW()),
('g10022', 'daniela.gomes@example.com', 'Daniela Gomes', 'https://ui-avatars.com/api/?name=Daniela+Gomes', NOW(), NOW()),
('g10023', 'eduardo.santos@example.com', 'Eduardo Santos', 'https://ui-avatars.com/api/?name=Eduardo+Santos', NOW(), NOW()),
('g10024', 'beatriz.lima@example.com', 'Beatriz Lima', 'https://ui-avatars.com/api/?name=Beatriz+Lima', NOW(), NOW()),
('g10025', 'leonardo.costa@example.com', 'Leonardo Costa', 'https://ui-avatars.com/api/?name=Leonardo+Costa', NOW(), NOW()),
('g10026', 'renata.oliveira@example.com', 'Renata Oliveira', 'https://ui-avatars.com/api/?name=Renata+Oliveira', NOW(), NOW()),
('g10027', 'guilherme.ferreira@example.com', 'Guilherme Ferreira', 'https://ui-avatars.com/api/?name=Guilherme+Ferreira', NOW(), NOW()),
('g10028', 'carolina.silva@example.com', 'Carolina Silva', 'https://ui-avatars.com/api/?name=Carolina+Silva', NOW(), NOW()),
('g10029', 'alexandre.souza@example.com', 'Alexandre Souza', 'https://ui-avatars.com/api/?name=Alexandre+Souza', NOW(), NOW()),
('g10030', 'mariana.santos@example.com', 'Mariana Santos', 'https://ui-avatars.com/api/?name=Mariana+Santos', NOW(), NOW());

-- Inserção de categorias (30 registros)
INSERT INTO `Categories` (`name`, `color`, `description`, `userId`, `createdAt`, `updatedAt`) VALUES
('Desenvolvimento', '#4A90E2', 'Projetos de desenvolvimento de software', 1, NOW(), NOW()),
('Design', '#50E3C2', 'Projetos de design gráfico e UI/UX', 1, NOW(), NOW()),
('Marketing', '#F5A623', 'Campanhas e estratégias de marketing', 1, NOW(), NOW()),
('Planejamento', '#9013FE', 'Estratégia e planejamento', 2, NOW(), NOW()),
('Finanças', '#417505', 'Controle financeiro e orçamentos', 2, NOW(), NOW()),
('Recursos Humanos', '#BD10E0', 'Gestão de pessoas e recrutamento', 3, NOW(), NOW()),
('Pesquisa', '#7ED321', 'Pesquisas de mercado e análises', 3, NOW(), NOW()),
('Inovação', '#F8E71C', 'Projetos inovadores e disruptivos', 4, NOW(), NOW()),
('Produto', '#B8E986', 'Desenvolvimento de produtos', 4, NOW(), NOW()),
('Documentação', '#9B9B9B', 'Elaboração de documentação técnica', 5, NOW(), NOW()),
('Testes', '#D0021B', 'Testes e garantia de qualidade', 5, NOW(), NOW()),
('Implementação', '#4A4A4A', 'Implementação e implantação de soluções', 6, NOW(), NOW()),
('Manutenção', '#8B572A', 'Manutenção de sistemas e infraestrutura', 6, NOW(), NOW()),
('Suporte', '#417505', 'Suporte técnico e atendimento', 7, NOW(), NOW()),
('Análise', '#BD10E0', 'Análise de dados e business intelligence', 7, NOW(), NOW()),
('Operações', '#9013FE', 'Operações diárias e logística', 8, NOW(), NOW()),
('Administração', '#F5A623', 'Gestão administrativa', 8, NOW(), NOW()),
('Estratégia', '#4A90E2', 'Planejamento estratégico', 9, NOW(), NOW()),
('Vendas', '#50E3C2', 'Estratégias e processos de vendas', 9, NOW(), NOW()),
('Legal', '#D0021B', 'Questões jurídicas e compliance', 10, NOW(), NOW()),
('Comunicação', '#7ED321', 'Comunicação interna e externa', 10, NOW(), NOW()),
('Evento', '#F8E71C', 'Organização e planejamento de eventos', 11, NOW(), NOW()),
('Infraestrutura', '#9B9B9B', 'Gestão de infraestrutura de TI', 11, NOW(), NOW()),
('Segurança', '#8B572A', 'Segurança da informação', 12, NOW(), NOW()),
('Qualidade', '#B8E986', 'Garantia e controle de qualidade', 12, NOW(), NOW()),
('Frontend', '#4A4A4A', 'Desenvolvimento frontend', 13, NOW(), NOW()),
('Backend', '#417505', 'Desenvolvimento backend', 13, NOW(), NOW()),
('Mobile', '#BD10E0', 'Desenvolvimento mobile', 14, NOW(), NOW()),
('DevOps', '#9013FE', 'Práticas e ferramentas DevOps', 14, NOW(), NOW()),
('UI/UX', '#F5A623', 'Design de interfaces e experiência do usuário', 15, NOW(), NOW());

-- Inserção de projetos (5 projetos para os primeiros 15 usuários = 75 projetos)
-- Projetos para usuário 1
INSERT INTO `Projects` (`name`, `description`, `userId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('Website Corporativo', 'Desenvolvimento do novo website da empresa', 1, 1, NOW(), NOW()),
('Redesign do App', 'Atualização da interface do aplicativo mobile', 1, 2, NOW(), NOW()),
('Campanha de Lançamento', 'Planejamento da campanha para o novo produto', 1, 3, NOW(), NOW()),
('Sistema de CRM', 'Implementação do novo sistema de relacionamento com clientes', 1, 1, NOW(), NOW()),
('Portal Intranet', 'Desenvolvimento do portal interno da empresa', 1, 1, NOW(), NOW());

-- Projetos para usuário 2
INSERT INTO `Projects` (`name`, `description`, `userId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('Planejamento Estratégico 2025', 'Definição dos objetivos e metas para o próximo ano', 2, 4, NOW(), NOW()),
('Orçamento Departamental', 'Elaboração do orçamento para cada departamento', 2, 5, NOW(), NOW()),
('Análise de Viabilidade', 'Estudo de viabilidade para expansão do negócio', 2, 4, NOW(), NOW()),
('Relatórios Financeiros', 'Preparação dos relatórios do trimestre', 2, 5, NOW(), NOW()),
('Plano de Investimentos', 'Elaboração do plano de investimentos para o próximo ano', 2, 5, NOW(), NOW());

-- Projetos para usuário 3
INSERT INTO `Projects` (`name`, `description`, `userId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('Programa de Treinamento', 'Desenvolvimento de programa de capacitação para equipes', 3, 6, NOW(), NOW()),
('Pesquisa de Clima', 'Realização de pesquisa de clima organizacional', 3, 6, NOW(), NOW()),
('Estudo de Mercado', 'Análise do mercado e concorrentes', 3, 7, NOW(), NOW()),
('Processo de Recrutamento', 'Reformulação do processo de seleção de candidatos', 3, 6, NOW(), NOW()),
('Análise de Tendências', 'Estudo de tendências do setor para os próximos anos', 3, 7, NOW(), NOW());

-- Projetos para usuário 4
INSERT INTO `Projects` (`name`, `description`, `userId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('Projeto Inovação Aberta', 'Programa de inovação com startups parceiras', 4, 8, NOW(), NOW()),
('Novo Produto X', 'Desenvolvimento do produto X para o mercado corporativo', 4, 9, NOW(), NOW()),
('Hackathon Interno', 'Organização de maratona de programação para colaboradores', 4, 8, NOW(), NOW()),
('MVP Aplicativo', 'Desenvolvimento do MVP para o novo aplicativo', 4, 9, NOW(), NOW()),
('Pesquisa de Usuários', 'Coleta de feedback dos usuários sobre produtos existentes', 4, 9, NOW(), NOW());

-- Projetos para usuário 5
INSERT INTO `Projects` (`name`, `description`, `userId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('Manual do Usuário', 'Elaboração do manual para o sistema ERP', 5, 10, NOW(), NOW()),
('Testes de Integração', 'Realização de testes entre sistemas', 5, 11, NOW(), NOW()),
('Documentação da API', 'Documentação completa da API RESTful', 5, 10, NOW(), NOW()),
('Testes de Usabilidade', 'Realização de testes de usabilidade do novo portal', 5, 11, NOW(), NOW()),
('Guia de Boas Práticas', 'Elaboração de guia de boas práticas de desenvolvimento', 5, 10, NOW(), NOW());

-- Adicionar mais projetos para usuários 6-15
-- [Truncado para brevidade, mas você deve adicionar até completar 75 projetos]

-- Inserção de tarefas para os projetos (4 tarefas para cada projeto do usuário 1 = 20 tarefas)
-- Tarefas para o projeto 1 (Website Corporativo)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Design da Homepage', 'Criar mockup da página inicial', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 1, NOW(), NOW()),
('Implementação Frontend', 'Desenvolvimento HTML/CSS/JS', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 20 DAY), 1, NOW(), NOW()),
('Desenvolvimento Backend', 'Implementar API e banco de dados', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 1, NOW(), NOW()),
('Testes e Deployment', 'Realizar testes e lançar site', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 40 DAY), 1, NOW(), NOW());

-- Tarefas para o projeto 2 (Redesign do App)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Análise do App Atual', 'Identificar pontos de melhoria na interface existente', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 5 DAY), 2, NOW(), NOW()),
('Wireframes', 'Criar wireframes para as novas telas', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 15 DAY), 2, NOW(), NOW()),
('Design Visual', 'Desenvolver o design visual das telas', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 25 DAY), 2, NOW(), NOW()),
('Validação com Usuários', 'Testar protótipos com usuários reais', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 35 DAY), 2, NOW(), NOW());

-- Tarefas para o projeto 3 (Campanha de Lançamento)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Definição do Público-Alvo', 'Identificar e segmentar o público da campanha', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 7 DAY), 3, NOW(), NOW()),
('Criação do Conceito', 'Desenvolver o conceito criativo da campanha', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 14 DAY), 3, NOW(), NOW()),
('Produção de Materiais', 'Criar peças gráficas e conteúdos', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 21 DAY), 3, NOW(), NOW()),
('Planejamento de Mídia', 'Definir canais e cronograma de veiculação', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 28 DAY), 3, NOW(), NOW());

-- Tarefas para o projeto 4 (Sistema de CRM)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Levantamento de Requisitos', 'Identificar necessidades dos usuários e departamentos', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 4, NOW(), NOW()),
('Seleção da Plataforma', 'Avaliar e escolher a melhor solução de CRM', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 20 DAY), 4, NOW(), NOW()),
('Customização', 'Adaptar o sistema às necessidades da empresa', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 40 DAY), 4, NOW(), NOW()),
('Treinamento', 'Capacitar os usuários para utilização do sistema', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 60 DAY), 4, NOW(), NOW());

-- Tarefas para o projeto 5 (Portal Intranet)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Arquitetura da Informação', 'Definir estrutura e organização do conteúdo', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 15 DAY), 5, NOW(), NOW()),
('Design de Interface', 'Criar mockups das principais páginas', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 5, NOW(), NOW()),
('Desenvolvimento', 'Implementar o portal com base no design aprovado', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 60 DAY), 5, NOW(), NOW()),
('Migração de Conteúdo', 'Transferir conteúdo da intranet atual para a nova', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 75 DAY), 5, NOW(), NOW());

-- Projetos para usuário 6
INSERT INTO `Projects` (`name`, `description`, `userId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('Migração de Sistemas', 'Implementação da nova plataforma de gestão', 6, 12, NOW(), NOW()),
('Implantação ERP', 'Implantação do sistema ERP nos departamentos', 6, 12, NOW(), NOW()),
('Atualização de Infraestrutura', 'Modernização dos servidores e equipamentos', 6, 13, NOW(), NOW()),
('Manutenção Preventiva', 'Programa de manutenção preventiva de sistemas', 6, 13, NOW(), NOW()),
('Otimização de Processos', 'Análise e melhoria dos processos internos', 6, 12, NOW(), NOW());

-- Projetos para usuário 7
INSERT INTO `Projects` (`name`, `description`, `userId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('Central de Atendimento', 'Implementação da nova central de suporte ao cliente', 7, 14, NOW(), NOW()),
('Dashboard Analítico', 'Desenvolvimento de painel de métricas de negócio', 7, 15, NOW(), NOW()),
('Automação de Relatórios', 'Sistema de geração automática de relatórios', 7, 15, NOW(), NOW()),
('Base de Conhecimento', 'Criação de base de conhecimento para o suporte', 7, 14, NOW(), NOW()),
('Análise Preditiva', 'Implementação de modelo de análise preditiva de vendas', 7, 15, NOW(), NOW());

-- Projetos para usuário 8
INSERT INTO `Projects` (`name`, `description`, `userId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('Otimização Logística', 'Melhoria dos processos logísticos da empresa', 8, 16, NOW(), NOW()),
('Gestão de Fornecedores', 'Implementação de sistema de gestão de fornecedores', 8, 17, NOW(), NOW()),
('Controle de Estoque', 'Atualização do sistema de controle de estoque', 8, 16, NOW(), NOW()),
('Processos Administrativos', 'Documentação e otimização de processos administrativos', 8, 17, NOW(), NOW()),
('Fluxo de Aprovações', 'Implementação de sistema de aprovações digitais', 8, 17, NOW(), NOW());

-- Projetos para usuário 9
INSERT INTO `Projects` (`name`, `description`, `userId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('Planejamento 5 Anos', 'Desenvolvimento do plano estratégico de longo prazo', 9, 18, NOW(), NOW()),
('Estratégia de Vendas Q4', 'Planejamento da estratégia comercial para o último trimestre', 9, 19, NOW(), NOW()),
('Expansão Regional', 'Estratégia para expansão em novos mercados regionais', 9, 18, NOW(), NOW()),
('Capacitação Comercial', 'Programa de treinamento para equipe de vendas', 9, 19, NOW(), NOW()),
('Análise Competitiva', 'Estudo detalhado dos concorrentes e posicionamento', 9, 18, NOW(), NOW());

-- Projetos para usuário 10
INSERT INTO `Projects` (`name`, `description`, `userId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('Conformidade LGPD', 'Adequação da empresa às normas de proteção de dados', 10, 20, NOW(), NOW()),
('Campanha Interna', 'Campanha de comunicação para colaboradores', 10, 21, NOW(), NOW()),
('Revisão Contratual', 'Atualização dos modelos de contratos da empresa', 10, 20, NOW(), NOW()),
('Estratégia de Comunicação', 'Desenvolvimento do plano de comunicação anual', 10, 21, NOW(), NOW()),
('Gestão de Crise', 'Elaboração do manual de gestão de crise comunicacional', 10, 21, NOW(), NOW());

-- Projetos para usuário 11
INSERT INTO `Projects` (`name`, `description`, `userId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('Conferência Anual', 'Organização da conferência anual da empresa', 11, 22, NOW(), NOW()),
('Atualização do Datacenter', 'Modernização da infraestrutura do datacenter', 11, 23, NOW(), NOW()),
('Workshop de Inovação', 'Organização de workshop para equipes de produto', 11, 22, NOW(), NOW()),
('Migração para Cloud', 'Migração dos sistemas para ambiente em nuvem', 11, 23, NOW(), NOW()),
('Evento de Lançamento', 'Organização do evento de lançamento do novo produto', 11, 22, NOW(), NOW());

-- Projetos para usuário 12
INSERT INTO `Projects` (`name`, `description`, `userId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('Auditoria de Segurança', 'Realização de auditoria completa de segurança', 12, 24, NOW(), NOW()),
('Programa de Qualidade', 'Implementação de programa de qualidade total', 12, 25, NOW(), NOW()),
('Política de Senhas', 'Atualização da política de senhas corporativas', 12, 24, NOW(), NOW()),
('Certificação ISO', 'Preparação para certificação ISO 9001', 12, 25, NOW(), NOW()),
('Gestão de Vulnerabilidades', 'Implementação de processo de gestão de vulnerabilidades', 12, 24, NOW(), NOW());

-- Projetos para usuário 13
INSERT INTO `Projects` (`name`, `description`, `userId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('Refatoração Frontend', 'Refatoração do código frontend do sistema principal', 13, 26, NOW(), NOW()),
('API RESTful', 'Desenvolvimento de nova API RESTful', 13, 27, NOW(), NOW()),
('Componentes Reutilizáveis', 'Criação de biblioteca de componentes frontend', 13, 26, NOW(), NOW()),
('Arquitetura Microserviços', 'Migração para arquitetura de microserviços', 13, 27, NOW(), NOW()),
('Performance Backend', 'Otimização de performance do backend', 13, 27, NOW(), NOW());

-- Projetos para usuário 14
INSERT INTO `Projects` (`name`, `description`, `userId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('App Android', 'Desenvolvimento de aplicativo para Android', 14, 28, NOW(), NOW()),
('App iOS', 'Desenvolvimento de aplicativo para iOS', 14, 28, NOW(), NOW()),
('Pipeline de Entrega', 'Implementação de pipeline de entrega contínua', 14, 29, NOW(), NOW()),
('Framework de Testes', 'Desenvolvimento de framework de testes automatizados', 14, 29, NOW(), NOW()),
('App Offline-First', 'Implementação de funcionalidades offline no app', 14, 28, NOW(), NOW());

-- Projetos para usuário 15
INSERT INTO `Projects` (`name`, `description`, `userId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('Redesign do Produto', 'Reformulação completa da interface do produto', 15, 30, NOW(), NOW()),
('Pesquisa com Usuários', 'Condução de pesquisas de usabilidade', 15, 30, NOW(), NOW()),
('Design System', 'Criação de sistema de design unificado', 15, 30, NOW(), NOW()),
('Testes A/B', 'Realização de testes A/B para novas funcionalidades', 15, 30, NOW(), NOW()),
('Jornada do Usuário', 'Mapeamento da jornada do usuário nos produtos', 15, 30, NOW(), NOW());

-- Adicionando mais tarefas para atingir pelo menos 30 por projeto
-- Mais tarefas para o projeto 1 (Website Corporativo)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('SEO Otimização', 'Implementar estratégias de SEO no website', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 25 DAY), 1, NOW(), NOW()),
('Integração de Analytics', 'Configurar Google Analytics e eventos de rastreamento', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 15 DAY), 1, NOW(), NOW()),
('Formulários de Contato', 'Desenvolver e testar formulários de contato', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 22 DAY), 1, NOW(), NOW()),
('Otimização de Imagens', 'Redimensionar e comprimir imagens para melhor performance', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 18 DAY), 1, NOW(), NOW()),
('Testes de Navegadores', 'Testar compatibilidade com diferentes navegadores', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 35 DAY), 1, NOW(), NOW()),
('Implementação de Blog', 'Criar seção de blog com sistema de gerenciamento de conteúdo', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 45 DAY), 1, NOW(), NOW()),
('Área de Clientes', 'Desenvolver área restrita para clientes', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 50 DAY), 1, NOW(), NOW()),
('Multilingue', 'Implementar suporte para múltiplos idiomas', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 55 DAY), 1, NOW(), NOW()),
('Integrações de Mídia Social', 'Adicionar botões de compartilhamento e feeds sociais', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 30 DAY), 1, NOW(), NOW()),
('Mapa do Site', 'Criar mapa do site e arquivo sitemap.xml', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 28 DAY), 1, NOW(), NOW()),
('FAQ Dinâmico', 'Implementar seção de perguntas frequentes', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 32 DAY), 1, NOW(), NOW()),
('Carreiras', 'Desenvolver página de carreiras com listagem de vagas', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 38 DAY), 1, NOW(), NOW()),
('Newsletter', 'Implementar sistema de inscrição em newsletter', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 42 DAY), 1, NOW(), NOW()),
('Página de Equipe', 'Criar página com perfis da equipe', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 36 DAY), 1, NOW(), NOW()),
('Galeria de Projetos', 'Desenvolver galeria de projetos e casos de sucesso', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 48 DAY), 1, NOW(), NOW()),
('Depoimentos', 'Criar seção para depoimentos de clientes', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 40 DAY), 1, NOW(), NOW()),
('Segurança', 'Implementar HTTPS e certificados SSL', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 12 DAY), 1, NOW(), NOW()),
('Cache e Performance', 'Configurar sistemas de cache para otimização', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 45 DAY), 1, NOW(), NOW()),
('Responsividade', 'Testar e ajustar para todos os tamanhos de tela', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 25 DAY), 1, NOW(), NOW()),
('Acessibilidade', 'Implementar recursos de acessibilidade', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 38 DAY), 1, NOW(), NOW()),
('Chatbot', 'Integrar chatbot para atendimento', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 60 DAY), 1, NOW(), NOW()),
('Pesquisa Interna', 'Implementar sistema de busca no site', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 47 DAY), 1, NOW(), NOW()),
('Integração CRM', 'Conectar formulários com sistema de CRM', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 52 DAY), 1, NOW(), NOW()),
('Políticas e Termos', 'Criar páginas de políticas de privacidade e termos de uso', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 20 DAY), 1, NOW(), NOW()),
('Breadcrumbs', 'Implementar navegação por breadcrumbs', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 28 DAY), 1, NOW(), NOW()),
('Rich Snippets', 'Adicionar marcação Schema.org para rich snippets', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 33 DAY), 1, NOW(), NOW());

-- Mais tarefas para o projeto 2 (Redesign do App)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Pesquisa de Concorrentes', 'Analisar apps similares no mercado', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 3 DAY), 2, NOW(), NOW()),
('Definição de Personas', 'Criar personas para orientar o design', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 8 DAY), 2, NOW(), NOW()),
('Mapa de Navegação', 'Desenvolver mapa de fluxo de navegação', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 12 DAY), 2, NOW(), NOW()),
('Protótipo Interativo', 'Criar protótipo interativo de alta fidelidade', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 20 DAY), 2, NOW(), NOW()),
('Teste de Usabilidade Remoto', 'Conduzir testes remotos com usuários', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 30 DAY), 2, NOW(), NOW()),
('Design de Ícones', 'Criar conjunto de ícones personalizado', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 18 DAY), 2, NOW(), NOW()),
('Sistema de Design', 'Desenvolver biblioteca de componentes reutilizáveis', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 22 DAY), 2, NOW(), NOW()),
('Animações de Transição', 'Definir e prototipar animações', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 28 DAY), 2, NOW(), NOW()),
('Modo Escuro', 'Criar versão dark mode da interface', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 32 DAY), 2, NOW(), NOW()),
('Adaptação para Tablets', 'Adaptar design para telas maiores', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 36 DAY), 2, NOW(), NOW()),
('Guia de Estilo', 'Documentar guidelines de design', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 40 DAY), 2, NOW(), NOW()),
('Roadmap de Implementação', 'Definir cronograma faseado para implementação', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 2, NOW(), NOW()),
('Design de Notificações', 'Criar sistema de notificações push', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 26 DAY), 2, NOW(), NOW()),
('Onboarding', 'Redesenhar fluxo de onboarding', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 24 DAY), 2, NOW(), NOW()),
('Acessibilidade', 'Garantir conformidade com diretrizes de acessibilidade', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 27 DAY), 2, NOW(), NOW()),
('Feedback Háptico', 'Definir sistema de feedback háptico', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 34 DAY), 2, NOW(), NOW()),
('Componentes de Formulário', 'Redesenhar campos de entrada e forms', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 23 DAY), 2, NOW(), NOW()),
('Tema Personalizável', 'Implementar sistema de temas personalizáveis', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 38 DAY), 2, NOW(), NOW()),
('Design Responsivo', 'Testar em diferentes resoluções de tela', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 29 DAY), 2, NOW(), NOW()),
('Design de Empty States', 'Criar telas para estados vazios', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 33 DAY), 2, NOW(), NOW()),
('Design de Erros', 'Criar telas para estados de erro', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 31 DAY), 2, NOW(), NOW()),
('Micro-interações', 'Definir micro-interações para melhorar UX', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 37 DAY), 2, NOW(), NOW()),
('Análise de Métricas', 'Definir KPIs para avaliar novo design', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 9 DAY), 2, NOW(), NOW()),
('Design para Gestos', 'Otimizar interface para interações por gestos', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 21 DAY), 2, NOW(), NOW()),
('Pesquisa de Satisfação', 'Preparar pesquisa pós-implementação', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 39 DAY), 2, NOW(), NOW()),
('Documentação Técnica', 'Documentar especificações para desenvolvimento', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 19 DAY), 2, NOW(), NOW());

-- Tarefas para o projeto 3 (Campanha de Lançamento)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
-- Adicionando às 4 tarefas já existentes
('Pesquisa de Mercado', 'Realizar pesquisa para validar posicionamento do produto', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 5 DAY), 3, NOW(), NOW()),
('Naming e Tagline', 'Desenvolver nome e slogan para a campanha', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 9 DAY), 3, NOW(), NOW()),
('Identidade Visual', 'Criar identidade visual da campanha', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 12 DAY), 3, NOW(), NOW()),
('Plano de Marketing Digital', 'Desenvolver estratégia para canais digitais', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 15 DAY), 3, NOW(), NOW()),
('Criação de Landing Page', 'Desenvolver página específica para a campanha', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 18 DAY), 3, NOW(), NOW()),
('Produção de Vídeo', 'Criar vídeo promocional do produto', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 25 DAY), 3, NOW(), NOW()),
('Conteúdo para Redes Sociais', 'Desenvolver calendário de conteúdo', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 20 DAY), 3, NOW(), NOW()),
('Email Marketing', 'Preparar campanha de email marketing', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 22 DAY), 3, NOW(), NOW()),
('Assessoria de Imprensa', 'Desenvolver press kit e contatar veículos', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 19 DAY), 3, NOW(), NOW()),
('Influenciadores', 'Identificar e contatar influenciadores relevantes', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 17 DAY), 3, NOW(), NOW()),
('Kit de Vendas', 'Desenvolver material de apoio para equipe comercial', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 24 DAY), 3, NOW(), NOW()),
('Evento de Lançamento', 'Planejar evento físico ou virtual', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 3, NOW(), NOW()),
('Mídia Paga', 'Planejar investimentos em mídia digital', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 16 DAY), 3, NOW(), NOW()),
('Métricas e KPIs', 'Definir indicadores de sucesso da campanha', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 3, NOW(), NOW()),
('Análise de Concorrentes', 'Estudar campanhas similares no mercado', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 8 DAY), 3, NOW(), NOW()),
('Orçamento Detalhado', 'Detalhar custos de cada ação da campanha', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 11 DAY), 3, NOW(), NOW()),
('Cronograma de Execução', 'Estabelecer linha do tempo para todas as ações', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 6 DAY), 3, NOW(), NOW()),
('Material Promocional', 'Desenvolver brindes e material promocional', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 26 DAY), 3, NOW(), NOW()),
('FAQ do Produto', 'Elaborar perguntas e respostas frequentes', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 23 DAY), 3, NOW(), NOW()),
('Treinamento da Equipe', 'Capacitar equipe sobre o novo produto', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 27 DAY), 3, NOW(), NOW()),
('Pesquisa Pós-Lançamento', 'Preparar pesquisa para avaliar resultado', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 35 DAY), 3, NOW(), NOW()),
('Plano de Contingência', 'Elaborar estratégias para possíveis problemas', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 13 DAY), 3, NOW(), NOW()),
('Análise de ROI', 'Definir metodologia para calcular retorno', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 14 DAY), 3, NOW(), NOW()),
('Integração com CRM', 'Configurar tracking de leads da campanha', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 29 DAY), 3, NOW(), NOW()),
('Relatórios de Performance', 'Criar templates para relatórios de resultados', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 32 DAY), 3, NOW(), NOW()),
('Marketing de Conteúdo', 'Desenvolver estratégia de blog e materiais ricos', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 18 DAY), 3, NOW(), NOW());

-- Tarefas para o projeto 4 (Sistema de CRM)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
-- Adicionando às 4 tarefas já existentes
('Mapeamento de Processos', 'Documentar fluxos de trabalho atuais', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 5 DAY), 4, NOW(), NOW()),
('Definição de Requisitos Técnicos', 'Documentar requisitos técnicos e de infraestrutura', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 15 DAY), 4, NOW(), NOW()),
('Avaliação de Fornecedores', 'Pesquisar e avaliar fornecedores de CRM', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 25 DAY), 4, NOW(), NOW()),
('Prova de Conceito', 'Realizar teste com solução escolhida', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 4, NOW(), NOW()),
('Negociação de Contrato', 'Negociar termos e valores com fornecedor', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 35 DAY), 4, NOW(), NOW()),
('Desenho da Arquitetura', 'Definir arquitetura de integração com sistemas existentes', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 38 DAY), 4, NOW(), NOW()),
('Plano de Migração de Dados', 'Desenvolver estratégia para migração', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 42 DAY), 4, NOW(), NOW()),
('Configuração de Ambientes', 'Preparar ambientes de desenvolvimento, teste e produção', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 45 DAY), 4, NOW(), NOW()),
('Desenvolvimento de Integrações', 'Implementar integrações com sistemas existentes', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 50 DAY), 4, NOW(), NOW()),
('Testes de Integração', 'Testar fluxos entre sistemas', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 55 DAY), 4, NOW(), NOW()),
('Testes de Aceitação', 'Validar sistema com usuários-chave', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 65 DAY), 4, NOW(), NOW()),
('Criação de Painéis', 'Configurar dashboards e relatórios', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 70 DAY), 4, NOW(), NOW()),
('Preparação de Material de Treinamento', 'Criar guias e tutoriais', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 75 DAY), 4, NOW(), NOW()),
('Plano de Comunicação', 'Desenvolver estratégia para informar usuários', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 48 DAY), 4, NOW(), NOW()),
('Plano de Suporte', 'Definir estrutura de suporte pós-implantação', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 52 DAY), 4, NOW(), NOW()),
('Política de Acesso', 'Definir perfis e permissões de usuários', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 43 DAY), 4, NOW(), NOW()),
('Configuração de Workflow', 'Implementar fluxos de trabalho automatizados', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 58 DAY), 4, NOW(), NOW()),
('Customização de Campos', 'Adaptar campos e formulários às necessidades', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 53 DAY), 4, NOW(), NOW()),
('Regras de Negócio', 'Implementar regras de validação e automação', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 56 DAY), 4, NOW(), NOW()),
('Testes de Performance', 'Avaliar desempenho sob diferentes cargas', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 62 DAY), 4, NOW(), NOW()),
('Monitoramento', 'Configurar sistema de monitoramento', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 63 DAY), 4, NOW(), NOW()),
('Plano de Rollback', 'Preparar estratégia de reversão em caso de problemas', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 45 DAY), 4, NOW(), NOW()),
('Documentação Técnica', 'Elaborar documentação da implementação', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 67 DAY), 4, NOW(), NOW()),
('Manual do Administrador', 'Criar documento para administradores do sistema', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 72 DAY), 4, NOW(), NOW()),
('Go Live', 'Colocar sistema em produção', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 80 DAY), 4, NOW(), NOW()),
('Acompanhamento Pós-implantação', 'Monitorar uso e resolver problemas iniciais', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 90 DAY), 4, NOW(), NOW());

-- Tarefas para o projeto 5 (Portal Intranet)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
-- Adicionando às 4 tarefas já existentes
('Pesquisa com Usuários', 'Realizar entrevistas com usuários-chave', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 5 DAY), 5, NOW(), NOW()),
('Benchmark', 'Analisar portais de intranet de referência', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 8 DAY), 5, NOW(), NOW()),
('Definição de Requisitos', 'Documentar funcionalidades necessárias', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 12 DAY), 5, NOW(), NOW()),
('Escolha da Plataforma', 'Selecionar tecnologia para desenvolvimento', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 20 DAY), 5, NOW(), NOW()),
('Taxonomia e Metadados', 'Definir estrutura de categorização de conteúdo', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 25 DAY), 5, NOW(), NOW()),
('Protótipo de Baixa Fidelidade', 'Criar wireframes das principais telas', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 22 DAY), 5, NOW(), NOW()),
('Teste de Usabilidade Inicial', 'Validar wireframes com usuários', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 28 DAY), 5, NOW(), NOW()),
('Design Visual', 'Desenvolver identidade visual do portal', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 35 DAY), 5, NOW(), NOW()),
('Mapa do Site', 'Definir estrutura de navegação', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 18 DAY), 5, NOW(), NOW()),
('Implementação de Frontend', 'Desenvolver interface do usuário', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 40 DAY), 5, NOW(), NOW()),
('Implementação de Backend', 'Desenvolver funcionalidades e integrações', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 50 DAY), 5, NOW(), NOW()),
('Sistema de Busca', 'Implementar mecanismo de busca eficiente', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 55 DAY), 5, NOW(), NOW()),
('Autenticação e Permissões', 'Configurar níveis de acesso e permissões', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 45 DAY), 5, NOW(), NOW()),
('Área de Notícias', 'Implementar sistema de publicação de notícias', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 52 DAY), 5, NOW(), NOW()),
('Diretório de Funcionários', 'Criar lista de contatos com busca', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 58 DAY), 5, NOW(), NOW()),
('Documentos Corporativos', 'Implementar repositório de documentos', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 60 DAY), 5, NOW(), NOW()),
('Calendário de Eventos', 'Desenvolver calendário compartilhado', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 63 DAY), 5, NOW(), NOW()),
('Sistema de Classificados', 'Criar área para anúncios internos', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 68 DAY), 5, NOW(), NOW()),
('Fórum de Discussão', 'Implementar fórum para comunicação interna', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 70 DAY), 5, NOW(), NOW()),
('FAQ Corporativo', 'Criar base de conhecimento interna', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 65 DAY), 5, NOW(), NOW()),
('Ferramenta de Feedback', 'Implementar sistema para sugestões', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 72 DAY), 5, NOW(), NOW()),
('Integração com Email', 'Configurar notificações por email', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 62 DAY), 5, NOW(), NOW()),
('Versão Mobile', 'Adaptar portal para dispositivos móveis', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 66 DAY), 5, NOW(), NOW()),
('Testes de Segurança', 'Realizar análise de vulnerabilidades', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 69 DAY), 5, NOW(), NOW()),
('Treinamento de Administradores', 'Capacitar equipe que gerenciará o portal', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 73 DAY), 5, NOW(), NOW()),
('Plano de Lançamento', 'Desenvolver estratégia para divulgação', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 76 DAY), 5, NOW(), NOW());

-- Tarefas para o projeto 6 (Migração de Sistemas - Usuário 6)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Levantamento de Sistemas Atuais', 'Documentar todos os sistemas em uso', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 5 DAY), 6, NOW(), NOW()),
('Análise de Requisitos', 'Identificar requisitos para a nova plataforma', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 6, NOW(), NOW()),
('Mapeamento de Integrações', 'Documentar integrações entre sistemas', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 15 DAY), 6, NOW(), NOW()),
('Avaliação de Fornecedores', 'Pesquisar soluções de mercado', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 20 DAY), 6, NOW(), NOW()),
('Prova de Conceito', 'Testar soluções selecionadas', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 6, NOW(), NOW()),
('Desenho da Arquitetura', 'Definir arquitetura da nova plataforma', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 35 DAY), 6, NOW(), NOW()),
('Planejamento de Migração', 'Desenvolver estratégia de migração', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 25 DAY), 6, NOW(), NOW()),
('Análise de Riscos', 'Identificar e mitigar riscos do projeto', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 12 DAY), 6, NOW(), NOW()),
('Orçamento Detalhado', 'Desenvolver orçamento completo do projeto', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 18 DAY), 6, NOW(), NOW()),
('Cronograma de Implementação', 'Criar linha do tempo detalhada', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 22 DAY), 6, NOW(), NOW()),
('Configuração de Ambientes', 'Preparar infraestrutura de desenvolvimento e testes', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 40 DAY), 6, NOW(), NOW()),
('Desenvolvimento de Integrações', 'Implementar conectores com sistemas legados', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 45 DAY), 6, NOW(), NOW()),
('Migração de Dados', 'Transferir dados para a nova plataforma', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 50 DAY), 6, NOW(), NOW()),
('Testes de Integração', 'Validar fluxos de dados entre sistemas', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 55 DAY), 6, NOW(), NOW()),
('Testes de Performance', 'Avaliar desempenho sob carga', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 60 DAY), 6, NOW(), NOW()),
('Testes de Segurança', 'Verificar vulnerabilidades', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 58 DAY), 6, NOW(), NOW()),
('Validação com Usuários', 'Testar com usuários-chave', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 65 DAY), 6, NOW(), NOW()),
('Treinamento de Equipe', 'Capacitar usuários na nova plataforma', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 70 DAY), 6, NOW(), NOW()),
('Documentação Técnica', 'Criar documentação completa', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 75 DAY), 6, NOW(), NOW()),
('Plano de Comunicação', 'Desenvolver estratégia de comunicação com stakeholders', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 28 DAY), 6, NOW(), NOW()),
('Plano de Rollback', 'Preparar estratégia de contingência', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 32 DAY), 6, NOW(), NOW()),
('Go Live', 'Lançar nova plataforma', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 80 DAY), 6, NOW(), NOW()),
('Monitoramento Pós-implementação', 'Acompanhar uso inicial da plataforma', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 85 DAY), 6, NOW(), NOW()),
('Ajustes Finais', 'Realizar correções e melhorias identificadas', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 90 DAY), 6, NOW(), NOW()),
('Relatório de Resultados', 'Documentar resultados e lições aprendidas', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 95 DAY), 6, NOW(), NOW()),
('Planejamento de Melhorias Futuras', 'Identificar próximos passos', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 100 DAY), 6, NOW(), NOW()),
('Auditoria de Sistemas', 'Verificar conformidade com políticas internas', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 105 DAY), 6, NOW(), NOW()),
('Avaliação de ROI', 'Medir retorno sobre investimento', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 110 DAY), 6, NOW(), NOW()),
('Workshop de Encerramento', 'Realizar retrospectiva com equipe', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 115 DAY), 6, NOW(), NOW()),
('Atualização da Documentação', 'Revisar e atualizar documentação', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 120 DAY), 6, NOW(), NOW());

-- Tarefas para o projeto 7 (Implantação ERP - Usuário 6)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Análise de Requisitos', 'Levantar necessidades de todos os departamentos', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 5 DAY), 7, NOW(), NOW()),
('Benchmarking de Soluções', 'Comparar sistemas ERP disponíveis', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 15 DAY), 7, NOW(), NOW()),
('Seleção de Fornecedor', 'Avaliar e selecionar sistema ERP', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 25 DAY), 7, NOW(), NOW()),
('Planejamento do Projeto', 'Desenvolver cronograma detalhado', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 7, NOW(), NOW()),
('Definição de Equipe', 'Formar equipe de implementação', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 10 DAY), 7, NOW(), NOW()),
('Kickoff do Projeto', 'Realizar reunião inicial com stakeholders', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 35 DAY), 7, NOW(), NOW()),
('Mapeamento de Processos', 'Documentar processos atuais', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 40 DAY), 7, NOW(), NOW()),
('Definição de Customizações', 'Identificar adaptações necessárias', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 45 DAY), 7, NOW(), NOW()),
('Configuração do Sistema', 'Parametrizar ERP conforme necessidades', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 55 DAY), 7, NOW(), NOW()),
('Migração de Dados', 'Transferir dados dos sistemas legados', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 65 DAY), 7, NOW(), NOW()),
('Desenvolvimento de Integrações', 'Integrar com sistemas existentes', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 70 DAY), 7, NOW(), NOW()),
('Testes Unitários', 'Testar módulos individualmente', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 75 DAY), 7, NOW(), NOW()),
('Testes Integrados', 'Testar fluxos completos', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 80 DAY), 7, NOW(), NOW()),
('Testes de Aceitação', 'Validar sistema com usuários-chave', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 85 DAY), 7, NOW(), NOW()),
('Treinamento de Administradores', 'Capacitar equipe de suporte', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 90 DAY), 7, NOW(), NOW()),
('Treinamento de Usuários', 'Capacitar usuários finais', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 95 DAY), 7, NOW(), NOW()),
('Preparação para Go Live', 'Finalizar ajustes pré-lançamento', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 100 DAY), 7, NOW(), NOW()),
('Go Live', 'Lançar sistema em produção', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 105 DAY), 7, NOW(), NOW()),
('Suporte Pós-implantação', 'Acompanhar uso inicial', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 110 DAY), 7, NOW(), NOW()),
('Ajustes e Correções', 'Resolver problemas identificados', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 115 DAY), 7, NOW(), NOW()),
('Otimização de Processos', 'Melhorar fluxos implementados', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 120 DAY), 7, NOW(), NOW()),
('Avaliação de Performance', 'Verificar desempenho do sistema', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 125 DAY), 7, NOW(), NOW()),
('Documentação Final', 'Atualizar documentação técnica e de usuário', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 130 DAY), 7, NOW(), NOW()),
('Auditoria de Segurança', 'Verificar controles de acesso e segurança', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 135 DAY), 7, NOW(), NOW()),
('Avaliação de ROI', 'Medir retorno sobre investimento', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 150 DAY), 7, NOW(), NOW()),
('Planejamento de Fase 2', 'Definir próximos módulos a implementar', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 160 DAY), 7, NOW(), NOW()),
('Revisão de Licenças', 'Verificar necessidades de licenciamento', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 170 DAY), 7, NOW(), NOW()),
('Workshop de Lições Aprendidas', 'Documentar experiências do projeto', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 180 DAY), 7, NOW(), NOW()),
('Pesquisa de Satisfação', 'Avaliar satisfação dos usuários', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 190 DAY), 7, NOW(), NOW()),
('Relatório Final', 'Documentar resultados do projeto', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 200 DAY), 7, NOW(), NOW());

-- Tarefas para o projeto 8 (Otimização Logística - Usuário 8)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Mapeamento de Processos', 'Documentar fluxos logísticos atuais', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 8, NOW(), NOW()),
('Análise de Gargalos', 'Identificar pontos de ineficiência', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 20 DAY), 8, NOW(), NOW()),
('Estudo de Tecnologias', 'Pesquisar soluções tecnológicas', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 30 DAY), 8, NOW(), NOW()),
('Redesenho de Processos', 'Criar novos fluxos otimizados', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 40 DAY), 8, NOW(), NOW()),
('Implementação Piloto', 'Testar mudanças em escala reduzida', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 60 DAY), 8, NOW(), NOW()),
('Treinamento de Equipe', 'Capacitar equipe nos novos processos', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 70 DAY), 8, NOW(), NOW()),
('Avaliação de Resultados', 'Medir impacto das melhorias', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 90 DAY), 8, NOW(), NOW());

-- Tarefas para o projeto 9 (Gestão de Fornecedores - Usuário 8)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Levantamento de Fornecedores', 'Catalogar fornecedores atuais', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 5 DAY), 9, NOW(), NOW()),
('Criação de Critérios', 'Definir métricas de avaliação', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 15 DAY), 9, NOW(), NOW()),
('Seleção de Software', 'Escolher sistema de gestão', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 25 DAY), 9, NOW(), NOW()),
('Implementação de Sistema', 'Configurar software escolhido', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 40 DAY), 9, NOW(), NOW()),
('Migração de Dados', 'Transferir informações para sistema', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 50 DAY), 9, NOW(), NOW()),
('Treinamento', 'Capacitar equipe no novo sistema', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 60 DAY), 9, NOW(), NOW()),
('Avaliação Inicial', 'Realizar primeira análise de fornecedores', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 70 DAY), 9, NOW(), NOW());

-- Tarefas para o projeto 10 (Controle de Estoque - Usuário 8)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Inventário Físico', 'Realizar contagem completa de estoque', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 10, NOW(), NOW()),
('Análise de Demanda', 'Estudar padrões de consumo', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 20 DAY), 10, NOW(), NOW()),
('Definição de Políticas', 'Estabelecer níveis de estoque e reposição', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 10, NOW(), NOW()),
('Seleção de Sistema', 'Escolher software de gestão', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 40 DAY), 10, NOW(), NOW()),
('Implementação de Software', 'Configurar sistema de controle', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 50 DAY), 10, NOW(), NOW()),
('Integração com Compras', 'Conectar sistema com processo de compras', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 60 DAY), 10, NOW(), NOW()),
('Treinamento da Equipe', 'Capacitar time no novo sistema', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 70 DAY), 10, NOW(), NOW());

-- Tarefas para o projeto 11 (Conferência Anual - Usuário 11)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Definição de Tema', 'Escolher tema central da conferência', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 5 DAY), 11, NOW(), NOW()),
('Seleção de Local', 'Pesquisar e contratar espaço para o evento', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 15 DAY), 11, NOW(), NOW()),
('Definição de Data', 'Estabelecer data do evento', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 11, NOW(), NOW()),
('Orçamento', 'Desenvolver orçamento detalhado', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 20 DAY), 11, NOW(), NOW()),
('Lista de Palestrantes', 'Identificar e convidar especialistas', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 11, NOW(), NOW()),
('Programação', 'Estruturar programação do evento', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 40 DAY), 11, NOW(), NOW()),
('Marketing do Evento', 'Desenvolver estratégia de divulgação', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 45 DAY), 11, NOW(), NOW()),
('Site do Evento', 'Criar site com informações e inscrições', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 50 DAY), 11, NOW(), NOW()),
('Sistema de Inscrições', 'Implementar plataforma para inscrições', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 55 DAY), 11, NOW(), NOW()),
('Confirmação de Patrocinadores', 'Contatar e confirmar patrocinadores', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 60 DAY), 11, NOW(), NOW()),
('Material Promocional', 'Desenvolver material gráfico e brindes', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 70 DAY), 11, NOW(), NOW()),
('Contratação de Fornecedores', 'Selecionar fornecedores para o evento', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 65 DAY), 11, NOW(), NOW()),
('Logística de Transporte', 'Organizar transporte para palestrantes e equipamentos', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 80 DAY), 11, NOW(), NOW()),
('Hospedagem', 'Reservar hotéis para palestrantes', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 85 DAY), 11, NOW(), NOW()),
('Alimentação', 'Planejar coffee breaks e refeições', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 90 DAY), 11, NOW(), NOW()),
('Equipamentos de Áudio e Vídeo', 'Contratar e testar equipamentos', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 95 DAY), 11, NOW(), NOW()),
('Equipe de Apoio', 'Selecionar e treinar staff do evento', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 100 DAY), 11, NOW(), NOW()),
('Credenciamento', 'Preparar sistema de credenciamento', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 105 DAY), 11, NOW(), NOW()),
('Material para Participantes', 'Preparar kits e materiais', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 110 DAY), 11, NOW(), NOW()),
('Sinalização', 'Desenvolver sinalização do evento', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 115 DAY), 11, NOW(), NOW()),
('Cobertura Fotográfica', 'Contratar serviços de fotografia', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 120 DAY), 11, NOW(), NOW()),
('Assessoria de Imprensa', 'Preparar material para imprensa', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 125 DAY), 11, NOW(), NOW()),
('Check-list Final', 'Verificar todos os detalhes pré-evento', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 130 DAY), 11, NOW(), NOW()),
('Realização do Evento', 'Coordenar a execução da conferência', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 135 DAY), 11, NOW(), NOW()),
('Pesquisa de Satisfação', 'Coletar feedback dos participantes', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 140 DAY), 11, NOW(), NOW()),
('Agradecimentos', 'Enviar agradecimentos a palestrantes e parceiros', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 145 DAY), 11, NOW(), NOW()),
('Relatório Final', 'Documentar resultados e aprendizados', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 150 DAY), 11, NOW(), NOW()),
('Prestação de Contas', 'Finalizar orçamento e despesas', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 155 DAY), 11, NOW(), NOW()),
('Compartilhamento de Conteúdo', 'Disponibilizar materiais e gravações', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 160 DAY), 11, NOW(), NOW()),
('Planejamento para Próxima Edição', 'Iniciar preparativos para o próximo ano', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 180 DAY), 11, NOW(), NOW());

-- Tarefas para o projeto 12 (Programa de Qualidade - Usuário 12)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Definição de Métricas', 'Estabelecer KPIs para qualidade', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 12, NOW(), NOW()),
('Mapeamento de Processos', 'Documentar processos atuais', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 20 DAY), 12, NOW(), NOW()),
('Criação de Checklists', 'Desenvolver listas de verificação de qualidade', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 30 DAY), 12, NOW(), NOW()),
('Treinamento da Equipe', 'Capacitar equipe nos novos padrões', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 40 DAY), 12, NOW(), NOW()),
('Implementação de Auditorias', 'Estabelecer rotina de auditorias internas', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 50 DAY), 12, NOW(), NOW()),
('Criação de Documentação', 'Documentar procedimentos de qualidade', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 60 DAY), 12, NOW(), NOW()),
('Avaliação de Resultados', 'Medir impacto das ações implementadas', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 90 DAY), 12, NOW(), NOW());

-- Tarefas para o projeto 13 (Política de Senhas - Usuário 12)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Análise de Vulnerabilidades', 'Identificar falhas na política atual', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 5 DAY), 13, NOW(), NOW()),
('Benchmarking', 'Pesquisar melhores práticas do mercado', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 15 DAY), 13, NOW(), NOW()),
('Definição de Nova Política', 'Desenvolver política de senhas atualizada', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 25 DAY), 13, NOW(), NOW()),
('Configuração de Sistemas', 'Implementar regras nos sistemas', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 35 DAY), 13, NOW(), NOW()),
('Comunicação aos Usuários', 'Informar sobre nova política', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 45 DAY), 13, NOW(), NOW()),
('Treinamento de Conscientização', 'Realizar sessões de segurança', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 55 DAY), 13, NOW(), NOW()),
('Monitoramento de Conformidade', 'Verificar adesão à nova política', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 65 DAY), 13, NOW(), NOW());

-- Tarefas para o projeto 14 (Certificação ISO - Usuário 12)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Análise de Gaps', 'Identificar lacunas para certificação', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 14, NOW(), NOW()),
('Desenvolvimento de Documentação', 'Criar documentação necessária', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 14, NOW(), NOW()),
('Treinamento da Equipe', 'Capacitar equipe nos padrões ISO', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 50 DAY), 14, NOW(), NOW()),
('Implementação de Processos', 'Ajustar processos conforme norma', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 70 DAY), 14, NOW(), NOW()),
('Auditoria Interna', 'Realizar auditoria pré-certificação', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 90 DAY), 14, NOW(), NOW()),
('Correção de Não-Conformidades', 'Ajustar pontos identificados', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 110 DAY), 14, NOW(), NOW()),
('Auditoria de Certificação', 'Acompanhar auditoria oficial', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 130 DAY), 14, NOW(), NOW());

-- Tarefas para o projeto 15 (Gestão de Vulnerabilidades - Usuário 12)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Seleção de Ferramentas', 'Escolher soluções para scan de vulnerabilidades', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 15 DAY), 15, NOW(), NOW()),
('Mapeamento de Ativos', 'Inventariar sistemas para monitoramento', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 25 DAY), 15, NOW(), NOW()),
('Implementação de Scans', 'Configurar varreduras automáticas', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 35 DAY), 15, NOW(), NOW()),
('Definição de SLAs', 'Estabelecer prazos para remediação', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 45 DAY), 15, NOW(), NOW()),
('Criação de Workflow', 'Desenvolver fluxo de tratamento', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 55 DAY), 15, NOW(), NOW()),
('Treinamento das Equipes', 'Capacitar times na remediação', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 65 DAY), 15, NOW(), NOW()),
('Dashboard de Monitoramento', 'Implementar painel de controle', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 75 DAY), 15, NOW(), NOW());

-- Tarefas para o projeto 17 (API RESTful - Usuário 13)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Definição de Endpoints', 'Mapear todos os endpoints necessários', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 17, NOW(), NOW()),
('Documentação OpenAPI', 'Criar especificação Swagger', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 20 DAY), 17, NOW(), NOW()),
('Implementação de Autenticação', 'Desenvolver sistema de autenticação', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 17, NOW(), NOW()),
('Desenvolvimento dos Endpoints', 'Codificar os endpoints da API', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 40 DAY), 17, NOW(), NOW()),
('Testes Automatizados', 'Criar suíte de testes', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 50 DAY), 17, NOW(), NOW()),
('Implementação de Cache', 'Otimizar performance com cache', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 60 DAY), 17, NOW(), NOW()),
('Deployment', 'Publicar API em ambiente de produção', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 70 DAY), 17, NOW(), NOW());

-- Tarefas para o projeto 18 (Componentes Reutilizáveis - Usuário 13)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Análise de Necessidades', 'Identificar componentes necessários', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 5 DAY), 18, NOW(), NOW()),
('Design dos Componentes', 'Criar design visual dos componentes', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 15 DAY), 18, NOW(), NOW()),
('Implementação Base', 'Desenvolver versão inicial dos componentes', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 25 DAY), 18, NOW(), NOW()),
('Documentação', 'Criar documentação de uso', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 35 DAY), 18, NOW(), NOW()),
('Testes de Acessibilidade', 'Garantir conformidade com WCAG', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 45 DAY), 18, NOW(), NOW()),
('Testes de Usabilidade', 'Validar componentes com usuários', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 55 DAY), 18, NOW(), NOW()),
('Publicação da Biblioteca', 'Disponibilizar para uso nas aplicações', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 65 DAY), 18, NOW(), NOW());

-- Tarefas para o projeto 19 (Arquitetura Microserviços - Usuário 13)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Design da Arquitetura', 'Definir divisão de serviços', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 19, NOW(), NOW()),
('Prova de Conceito', 'Implementar microserviço piloto', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 19, NOW(), NOW()),
('Configuração de CI/CD', 'Preparar pipeline de integração/entrega', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 50 DAY), 19, NOW(), NOW()),
('Implementação de API Gateway', 'Desenvolver gateway para serviços', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 70 DAY), 19, NOW(), NOW()),
('Monitoramento e Logging', 'Configurar sistema de observabilidade', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 90 DAY), 19, NOW(), NOW()),
('Implementação de Serviços', 'Desenvolver microserviços prioritários', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 110 DAY), 19, NOW(), NOW()),
('Testes de Integração', 'Testar comunicação entre serviços', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 130 DAY), 19, NOW(), NOW());

-- Tarefas para o projeto 20 (Performance Backend - Usuário 13)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Análise de Gargalos', 'Identificar problemas de performance', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 5 DAY), 20, NOW(), NOW()),
('Otimização de Queries', 'Melhorar consultas ao banco de dados', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 15 DAY), 20, NOW(), NOW()),
('Implementação de Cache', 'Configurar camada de cache', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 25 DAY), 20, NOW(), NOW()),
('Refatoração de Código', 'Otimizar trechos críticos', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 35 DAY), 20, NOW(), NOW()),
('Testes de Carga', 'Avaliar performance sob stress', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 45 DAY), 20, NOW(), NOW()),
('Ajustes de Infraestrutura', 'Otimizar configurações de servidores', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 55 DAY), 20, NOW(), NOW()),
('Documentação', 'Registrar otimizações realizadas', 'pending', 'low', DATE_ADD(NOW(), INTERVAL 65 DAY), 20, NOW(), NOW());

-- Tarefas para o projeto 22 (App Android - Usuário 14)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Definição de Requisitos', 'Documentar funcionalidades necessárias', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 22, NOW(), NOW()),
('Design de Interface', 'Criar wireframes e mockups', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 20 DAY), 22, NOW(), NOW()),
('Arquitetura do App', 'Definir estrutura técnica', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 22, NOW(), NOW()),
('Desenvolvimento Core', 'Implementar funcionalidades principais', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 60 DAY), 22, NOW(), NOW()),
('Testes Automatizados', 'Criar testes unitários e de interface', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 80 DAY), 22, NOW(), NOW()),
('Publicação na Play Store', 'Preparar e enviar para publicação', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 100 DAY), 22, NOW(), NOW()),
('Análise de Feedback', 'Coletar e analisar feedback de usuários', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 120 DAY), 22, NOW(), NOW());

-- Tarefas para o projeto 23 (App iOS - Usuário 14)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Definição de Requisitos', 'Documentar funcionalidades necessárias', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 23, NOW(), NOW()),
('Design de Interface', 'Criar wireframes e mockups', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 20 DAY), 23, NOW(), NOW()),
('Arquitetura do App', 'Definir estrutura técnica', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 23, NOW(), NOW()),
('Desenvolvimento Core', 'Implementar funcionalidades principais', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 60 DAY), 23, NOW(), NOW()),
('Testes Automatizados', 'Criar testes unitários e de interface', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 80 DAY), 23, NOW(), NOW()),
('Publicação na App Store', 'Preparar e enviar para publicação', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 100 DAY), 23, NOW(), NOW()),
('Análise de Feedback', 'Coletar e analisar feedback de usuários', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 120 DAY), 23, NOW(), NOW());

-- Tarefas para o projeto 24 (Pipeline de Entrega - Usuário 14)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Análise de Requisitos', 'Definir necessidades do pipeline', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 5 DAY), 24, NOW(), NOW()),
('Seleção de Ferramentas', 'Escolher plataformas e tecnologias', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 15 DAY), 24, NOW(), NOW()),
('Configuração de CI', 'Implementar integração contínua', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 25 DAY), 24, NOW(), NOW()),
('Configuração de CD', 'Implementar entrega contínua', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 35 DAY), 24, NOW(), NOW()),
('Testes Automatizados', 'Integrar testes ao pipeline', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 45 DAY), 24, NOW(), NOW()),
('Monitoramento', 'Configurar alertas e métricas', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 55 DAY), 24, NOW(), NOW()),
('Documentação', 'Criar documentação do pipeline', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 65 DAY), 24, NOW(), NOW());

-- Tarefas para o projeto 25 (Framework de Testes - Usuário 14)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Análise de Requisitos', 'Definir necessidades de testes', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 25, NOW(), NOW()),
('Seleção de Ferramentas', 'Escolher frameworks e bibliotecas', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 20 DAY), 25, NOW(), NOW()),
('Arquitetura de Testes', 'Definir estrutura e organização', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 25, NOW(), NOW()),
('Implementação Base', 'Desenvolver estrutura inicial', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 40 DAY), 25, NOW(), NOW()),
('Integração com CI/CD', 'Conectar com pipeline de entrega', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 50 DAY), 25, NOW(), NOW()),
('Documentação', 'Criar guias e tutoriais', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 60 DAY), 25, NOW(), NOW()),
('Treinamento', 'Capacitar equipe no framework', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 70 DAY), 25, NOW(), NOW());

-- Tarefas para o projeto 26 (Redesign do Produto - Usuário 15)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Pesquisa com Usuários', 'Coletar feedback sobre produto atual', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 26, NOW(), NOW()),
('Análise de Concorrência', 'Pesquisar soluções similares', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 20 DAY), 26, NOW(), NOW()),
('Wireframes', 'Criar estrutura básica das telas', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 26, NOW(), NOW()),
('Design Visual', 'Desenvolver interface completa', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 45 DAY), 26, NOW(), NOW()),
('Protótipo Interativo', 'Criar protótipo para testes', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 60 DAY), 26, NOW(), NOW()),
('Testes com Usuários', 'Validar design com usuários reais', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 75 DAY), 26, NOW(), NOW()),
('Documentação de Design', 'Criar especificações para desenvolvimento', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 90 DAY), 26, NOW(), NOW());

-- Tarefas para o projeto 27 (Design System - Usuário 15)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Auditoria de Design', 'Analisar elementos visuais atuais', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 5 DAY), 27, NOW(), NOW()),
('Definição de Princípios', 'Estabelecer princípios de design', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 15 DAY), 27, NOW(), NOW()),
('Criação de Componentes', 'Desenhar componentes básicos', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 27, NOW(), NOW()),
('Sistema de Cores e Tipografia', 'Definir paletas e fontes', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 20 DAY), 27, NOW(), NOW()),
('Documentação', 'Criar guia de uso do design system', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 45 DAY), 27, NOW(), NOW()),
('Implementação Técnica', 'Desenvolver componentes em código', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 60 DAY), 27, NOW(), NOW()),
('Treinamento', 'Capacitar equipes no uso do design system', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 75 DAY), 27, NOW(), NOW());

-- Tarefas para o projeto 28 (Testes A/B - Usuário 15)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Definição de Hipóteses', 'Estabelecer hipóteses para testes', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 5 DAY), 28, NOW(), NOW()),
('Seleção de Ferramentas', 'Escolher plataforma para testes A/B', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 10 DAY), 28, NOW(), NOW()),
('Design de Variações', 'Criar versões alternativas para teste', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 20 DAY), 28, NOW(), NOW()),
('Implementação Técnica', 'Configurar testes na plataforma', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 28, NOW(), NOW()),
('Execução de Testes', 'Lançar testes para usuários', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 40 DAY), 28, NOW(), NOW()),
('Análise de Resultados', 'Avaliar métricas e resultados', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 60 DAY), 28, NOW(), NOW()),
('Implementação de Vencedores', 'Adotar variações bem-sucedidas', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 70 DAY), 28, NOW(), NOW());

-- Tarefas para o projeto 29 (Jornada do Usuário - Usuário 15)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Pesquisa com Usuários', 'Entrevistar usuários sobre experiência', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 10 DAY), 29, NOW(), NOW()),
('Criação de Personas', 'Desenvolver perfis de usuários', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 20 DAY), 29, NOW(), NOW()),
('Mapeamento de Jornadas Atuais', 'Documentar fluxos existentes', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 30 DAY), 29, NOW(), NOW()),
('Identificação de Dores', 'Analisar pontos de frustração', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 40 DAY), 29, NOW(), NOW()),
('Design de Jornadas Ideais', 'Criar fluxos otimizados', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 50 DAY), 29, NOW(), NOW()),
('Validação com Stakeholders', 'Apresentar jornadas para aprovação', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 60 DAY), 29, NOW(), NOW()),
('Documentação Final', 'Finalizar mapas de jornada', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 70 DAY), 29, NOW(), NOW());

-- Tarefas para o projeto 30 (App Offline-First - Usuário 14)
INSERT INTO `Tasks` (`title`, `description`, `status`, `priority`, `dueDate`, `projectId`, `createdAt`, `updatedAt`) VALUES
('Análise de Requisitos', 'Definir necessidades offline', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 5 DAY), 30, NOW(), NOW()),
('Arquitetura de Dados', 'Projetar estrutura para sincronização', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 15 DAY), 30, NOW(), NOW()),
('Implementação de Cache', 'Desenvolver armazenamento local', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 25 DAY), 30, NOW(), NOW()),
('Sistema de Sincronização', 'Criar mecanismo de sincronização', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 35 DAY), 30, NOW(), NOW()),
('Tratamento de Conflitos', 'Implementar resolução de conflitos', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 45 DAY), 30, NOW(), NOW()),
('Testes em Cenários Offline', 'Validar funcionamento sem conexão', 'pending', 'high', DATE_ADD(NOW(), INTERVAL 55 DAY), 30, NOW(), NOW()),
('Documentação para Usuários', 'Criar guia de uso offline', 'pending', 'medium', DATE_ADD(NOW(), INTERVAL 65 DAY), 30, NOW(), NOW());