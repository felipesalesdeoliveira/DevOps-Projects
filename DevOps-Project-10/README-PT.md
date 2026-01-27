# 🚀 CI/CD Pipeline para .NET com Azure DevOps Starter

![devops](https://imgur.com/gBofYCl.png)

## 📌 Visão Geral

Este repositório demonstra como criar rapidamente um pipeline completo de **Integração Contínua (CI)** e **Entrega Contínua (CD)** para aplicações **.NET** utilizando o **DevOps Starter Project** no **Azure DevOps**.

O DevOps Starter automatiza toda a configuração inicial, incluindo:

* Criação do repositório Git
* Configuração dos pipelines de CI/CD
* Provisionamento da infraestrutura no Azure
* Monitoramento com **Azure Application Insights**
* Dashboard centralizado no portal Azure

O resultado é uma aplicação **ASP.NET Core MVC** totalmente integrada a um fluxo CI/CD pronto para produção.

---

## 🎯 O que você vai aprender

Neste laboratório prático, você irá:

* Criar um projeto ASP.NET usando o **DevOps Starter**
* Explorar pipelines de **Build** e **Release** no Azure DevOps
* Executar commits e disparar o CI/CD automaticamente
* Configurar e visualizar métricas no **Application Insights**

---

## 🧰 Pré-requisitos

Antes de começar, certifique-se de ter:

### ☁️ Conta Microsoft Azure

* Uma conta Azure ativa
* Caso não possua, crie uma gratuitamente: [https://azure.microsoft.com/free](https://azure.microsoft.com/free)

💡 *Assinantes do Visual Studio têm créditos mensais entre US$ 50 e US$ 150.*

### 🔧 Conta Azure DevOps

* Crie gratuitamente em: [https://azure.microsoft.com/services/devops/](https://azure.microsoft.com/services/devops/)

---

## 🧪 Exercício 1: Criar um projeto ASP.NET com DevOps Starter

1. Acesse o **Azure Portal**
2. Pesquise por **DevOps Starter**
3. Clique em **Create DevOps Starter**
4. Altere o repositório para **Azure DevOps**
5. Escolha a aplicação **.NET Core (ASP.NET Core MVC)**
6. Ative a opção **Add a database**
7. Selecione **Web App on Windows** como destino
8. Defina o nome do projeto e da aplicação
9. Clique em **Review + Create**

Após o deployment, o Azure irá:

* Criar o repositório Git
* Criar pipelines de Build e Release
* Provisionar Web App e Azure SQL Database

---

## 🧩 Exercício 2: Analisar os Pipelines de CI/CD

### 🔨 Build Pipeline

O pipeline de build executa automaticamente:

* Checkout do código
* Restore de dependências
* Build da aplicação
* Execução de testes
* Publicação de artefatos

Cada commit no repositório dispara um novo build automaticamente.

### 🚢 Release Pipeline

O pipeline de release:

* Provisiona recursos no Azure (ARM)
* Publica a aplicação no App Service
* Executa migrações no Azure SQL
* Roda testes pós-deployment

O **Continuous Deployment (CD)** é acionado a cada novo artefato gerado.

---

## 🔁 Exercício 3: Commit de Código e Execução do CI/CD

1. Acesse **Repos** no Azure DevOps
2. Edite o arquivo:

```
Application/aspnet-core-dotnet-core/Pages/Index.cshtml
```

3. Altere o conteúdo do `<h2>`
4. Faça o **Commit** diretamente pela interface web
5. Acompanhe o Build em **Pipelines > Pipelines**
6. Após o Release, acesse a aplicação atualizada pelo botão **Browse**

---

## 📊 Monitoramento com Application Insights

O projeto já vem integrado com **Azure Application Insights**, permitindo:

* Visualização de métricas de performance
* Monitoramento de erros e exceções
* Análise de requisições e dependências

---

## 📁 Estrutura do Repositório

```
.
├── Application/
│   └── aspnet-core-dotnet-core/
├── azure-pipelines.yml
├── README.md
```

---

## 🛠️ Autor & Comunidade

Projeto criado por **[Harshhaa](https://github.com/NotHarshhaa)** 💡

🔗 Conecte-se:

* GitHub: [https://github.com/NotHarshhaa](https://github.com/NotHarshhaa)
* Blog: [https://blog.prodevopsguytech.com](https://blog.prodevopsguytech.com)
* Telegram: [https://t.me/prodevopsguy](https://t.me/prodevopsguy)
* LinkedIn: [https://www.linkedin.com/in/harshhaa-vardhan-reddy/](https://www.linkedin.com/in/harshhaa-vardhan-reddy/)

---

## ⭐ Apoie o Projeto

Se este repositório foi útil para você:

* ⭐ Dê uma estrela
* 🔄 Compartilhe com sua rede
* 💬 Envie feedbacks

---

🚀 *Happy DevOps!*
