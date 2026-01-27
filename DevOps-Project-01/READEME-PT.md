# Deploy de Aplicação Java na AWS com Arquitetura 3-Tier

![Arquitetura AWS](https://imgur.com/b9iHwVc.png)

## Sumário

1. [Visão Geral do Projeto](#visão-geral-do-projeto)
2. [Visão Geral da Arquitetura](#visão-geral-da-arquitetura)
3. [Pré-Requisitos](#pré-requisitos)
4. [Configuração da Infraestrutura](#configuração-da-infraestrutura)

   * [VPC e Rede](#vpc-e-rede)
   * [Configuração de Segurança](#configuração-de-segurança)
   * [Camada de Banco de Dados](#camada-de-banco-de-dados)
5. [Configuração da Aplicação](#configuração-da-aplicação)

   * [Ambiente de Build](#ambiente-de-build)
   * [Deploy da Aplicação](#deploy-da-aplicação)
   * [Balanceamento de Carga e Auto Scaling](#balanceamento-de-carga-e-auto-scaling)
6. [Monitoramento e Manutenção](#monitoramento-e-manutenção)
7. [Boas Práticas de Segurança](#boas-práticas-de-segurança)
8. [Guia de Troubleshooting](#guia-de-troubleshooting)
9. [Contribuição](#contribuição)

---

![Diagrama Arquitetura 3-Tier](https://imgur.com/3XF0tlJ.png)

---

# Visão Geral do Projeto

## Introdução

Este projeto demonstra o deploy de uma aplicação web Java em nível de produção utilizando a arquitetura 3-tier da AWS. A implementação segue boas práticas cloud-native, garantindo alta disponibilidade, escalabilidade e segurança em todas as camadas da aplicação.

### Principais Características

* **Alta Disponibilidade**: Deploy Multi-AZ com failover automático
* **Auto Scaling**: Alocação dinâmica de recursos conforme a demanda
* **Segurança**: Estratégia de defesa em profundidade com múltiplas camadas
* **Monitoramento**: Logging e monitoramento completos
* **Otimização de Custos**: Uso eficiente e controlado dos recursos

## Visão Geral da Arquitetura

### Componentes da Infraestrutura

1. **Camada de Apresentação (Frontend)**

   * Servidores Nginx em Auto Scaling Group
   * Network Load Balancer público
   * Distribuição CloudFront para conteúdo estático

2. **Camada de Aplicação (Backend)**

   * Servidores Apache Tomcat em Auto Scaling Group
   * Network Load Balancer interno
   * Gerenciamento de sessão com Amazon ElastiCache

3. **Camada de Dados**

   * Amazon RDS MySQL em configuração Multi-AZ
   * Backups automáticos e recuperação point-in-time
   * Read replicas para cargas intensivas de leitura

### Arquitetura de Rede

* **Design de VPC**

  * Duas VPCs separadas (192.168.0.0/16 e 172.32.0.0/16)
  * Subnets públicas e privadas em múltiplas AZs
  * Transit Gateway para comunicação entre VPCs

# Pré-Requisitos

## Contas e Ferramentas Necessárias

### 1. Configuração da Conta AWS

* Criar uma conta no [AWS Free Tier](https://aws.amazon.com/free/)
* Instalar o AWS CLI v2

### 2. Ferramentas de Desenvolvimento

* **Git** para controle de versão

### 3. Integração CI/CD

* **SonarCloud**

  * Conta criada e token configurado
  * Parâmetros adicionados ao `pom.xml`

* **JFrog Artifactory**

  * Repositório Maven configurado
  * Autenticação via variáveis de ambiente

# Configuração da Infraestrutura

## VPC e Rede

### Criação das VPCs

* VPC primária: `192.168.0.0/16`
* VPC secundária: `172.32.0.0/16`

### Subnets

* Subnets públicas para Load Balancers e NAT Gateway
* Subnets privadas para aplicação e banco de dados

### Gateways

* Internet Gateway para acesso público
* NAT Gateway para saída segura das subnets privadas

## Configuração de Segurança

### Security Groups

* Frontend: portas 80 e 443 liberadas para internet
* Backend e Banco: acesso restrito apenas às camadas necessárias

### IAM

* Roles e policies para acesso controlado a S3, CloudWatch e outros serviços

## Camada de Banco de Dados

* Amazon RDS MySQL
* Configuração Multi-AZ
* Subnet Group dedicado
* Banco inicializado com schema da aplicação

# Configuração da Aplicação

## Ambiente de Build

* Java 11
* Maven
* Spring Boot

### Processo de Build

* `mvn clean package`
* Execução de testes
* Deploy de artefatos no JFrog

## Deploy da Aplicação

### Apache Tomcat

* Serviço gerenciado via systemd
* Configuração de memória e JVM
* Execução como usuário dedicado

### Nginx

* Proxy reverso para o backend
* Integração com CloudFront para conteúdo estático

## Balanceamento de Carga e Auto Scaling

* Launch Templates para EC2
* Auto Scaling Groups com mínimo e máximo definidos
* Health checks integrados ao Load Balancer

# Monitoramento e Manutenção

## CloudWatch

* Métricas customizadas (uso de memória)
* Logs do Tomcat enviados ao CloudWatch Logs
* Coleta automática via CloudWatch Agent

# Boas Práticas de Segurança

## Segurança de Rede

* NACLs configuradas
* VPC Flow Logs habilitados
* AWS WAF e Shield

## Segurança da Aplicação

* Atualizações regulares
* Secrets Manager para credenciais
* GuardDuty habilitado

## Segurança dos Dados

* Criptografia em repouso
* TLS em trânsito
* Estratégia de backups e auditorias

# Guia de Troubleshooting

## Problemas Comuns

### Conectividade

* Verificar Security Groups
* Testar conectividade com banco
* Validar health checks do Load Balancer

### Performance

* Monitorar CPU, memória e disco
* Avaliar threads do Tomcat

# Contribuição

## Como Contribuir

1. Fork do repositório
2. Criar branch de feature
3. Commit das alterações
4. Push para o repositório
5. Abrir Pull Request

## Setup de Desenvolvimento

* Clone do repositório
* Instalação das dependências
* Execução de testes

---

## 🛠️ Autor & Comunidade

Projeto mantido por **[Harshhaa](https://github.com/NotHarshhaa)** 💡

* **GitHub**: @NotHarshhaa
* **Blog**: ProDevOpsGuy
* **Telegram**: ProDevOpsGuy Community
* **LinkedIn**: Harshhaa Vardhan Reddy

---

## ⭐ Apoie o Projeto

Se este projeto foi útil:

* Dê uma ⭐ no repositório
* Compartilhe com sua rede
* Contribua com melhorias

> ⚠️ Esta documentação está em constante evolução. Consulte o repositório para versões atualizadas.
