# DevOps-Journey-Using-Azure-DevOps

![Azure-DevOps](https://imgur.com/J2F5qPP.png)

Este tutorial/laboratório irá conduzir você por uma jornada DevOps utilizando o **Azure DevOps**. Desde a configuração do pipeline até o deploy de uma aplicação em um cluster **Azure Kubernetes Service (AKS)**!

---

## 📘 O que você irá aprender

Neste tutorial/laboratório, você aprenderá:

- Configuração inicial do Azure DevOps para começar a realizar deploys no Azure utilizando **Pipelines como código**
- Provisionar recursos Azure utilizando **módulos Terraform**
- Realizar o deploy de uma aplicação de teste no **Azure Kubernetes Service (AKS)**
- Compreender **CI/CD** com deploys automatizados de aplicações
- Testar os recursos Azure implantados utilizando **testes automatizados**
- Revisar **monitoramento e alertas** utilizando **Application Insights** e **Container Insights**

Este setup é baseado em um cenário **próximo da vida real**, refletindo uma arquitetura e fluxo utilizados em ambientes produtivos!

---

## 🧪 Formato dos Tutoriais/Laboratórios

Antes de iniciar os laboratórios, revise os **[Pré-requisitos](prerequisites.md)**.

Os laboratórios estão disponíveis **[aqui](labs/)**. Complete cada um **na ordem numérica**: 1 → 2 → 3 → etc.

---

### 1️⃣ [Configuração Inicial](labs/1-Initial-Setup)

Este laboratório inicia a jornada com as seguintes configurações:

- **[Configuração do Azure DevOps](labs/1-Initial-Setup/1-Azure-DevOps-Setup.md)**
  - Criação da Organização no Azure DevOps
  - Criação de Projeto no Azure DevOps
  - Criação de Service Principal no Azure

- **[Configuração do Terraform no Azure](labs/1-Initial-Setup/2-Azure-Terraform-Remote-Storage.md)**
  - Criação de Blob Storage para armazenar o arquivo de estado do Terraform (Terraform State)

- **[Criação de Grupo Azure AD para Administradores do AKS](labs/1-Initial-Setup/3-Create-Azure-AD-AKS-Admins.md)**
  - Criação de Grupo de Administradores do AKS no Azure Active Directory

---

### 2️⃣ [Configurar Pipeline no Azure DevOps](labs/2-AzureDevOps-Terraform-Pipeline)

O objetivo deste laboratório é criar todos os serviços de nuvem Azure necessários, do ponto de vista de **infraestrutura/ambiente**, para executar a aplicação de teste.

- **[Configuração do Pipeline](labs/2-AzureDevOps-Terraform-Pipeline/1-Setup-AzureDevOps-Pipeline.md)**
  - Configuração do Pipeline no Azure DevOps

---

### 3️⃣ [Deploy da Aplicação no Azure Container Registry](labs/3-Deploy-App-to-ACR)

Deploy de uma aplicação de exemplo no **Azure Container Registry (ACR)**.

- **[Deploy da Aplicação no Azure Container Registry](labs/3-Deploy-App-to-ACR/1-Deploy-App-to-ACR.md)**
  - Build da imagem Docker localmente
  - Execução da imagem Docker localmente
  - Deploy da aplicação de exemplo no Container Registry

---

### 4️⃣ [Deploy da Aplicação no Azure Kubernetes Service (AKS)](labs/4-Deploy-App-AKS)

- **[Adicionar Role Assignment entre AKS e ACR](labs/4-Deploy-App-AKS/1-Add-AKS-ACR-Role-Assignment.md)**
  - Uso do Terraform para adicionar permissão para a identidade gerenciada do AKS acessar o ACR

- **[Adicionar Application Insights no Terraform](labs/4-Deploy-App-AKS/2-Add-Application-Insights.md)**
  - O Application Insights será utilizado para monitorar a aplicação após o deploy

- **[Adicionar Azure Key Vault no Terraform](labs/4-Deploy-App-AKS/3-Add-KeyVault-to-Terraform.md)**
  - O Azure Key Vault será utilizado para armazenar segredos usados nos **Variable Groups** do Azure DevOps

- **[Atualizar Pipeline para Deploy da Aplicação no AKS](labs/4-Deploy-App-AKS/4-Update-Pipeline-Deploy-App-AKS.md)**
  - Atualização do pipeline para realizar o deploy da aplicação ASP.NET no AKS

---

### 5️⃣ [Introdução ao CI/CD](labs/5-CICD)

- **[Introduzindo CI/CD no Pipeline](labs/5-CICD/1-Introduce-CI-CD-to-your-Pipeline.md)**
  - Início do CI/CD com triggers automáticos no pipeline

- **[Deploy Automatizado da Aplicação no AKS](labs/5-CICD/2-Automated-Deployment-AKS-Application.md)**
  - Nos laboratórios anteriores, o build tag da aplicação era configurado manualmente  
  - Com CI/CD, isso passa a ser automatizado e a aplicação no cluster AKS será atualizada a cada execução do pipeline

---

### 6️⃣ [Testando a Infraestrutura Azure Implantada](labs/6-Testing-Infrastructure)

- **[Testando Infraestrutura com Inspec](labs/6-Testing-Infrastructure/1-Testing-Infrastructure-using-Inspec.md)**
  - Uso do Inspec-Azure para validar recursos Azure

- **[Testes Inspec utilizando Azure DevOps Pipeline](labs/6-Testing-Infrastructure/2-Run-Inspec-Tests-Using-Azure-DevOps.md)**
  - Execução dos testes Inspec via Azure DevOps
  - Visualização dos relatórios Inspec no Azure DevOps

---

### 7️⃣ [Monitoramento e Alertas](labs/7-Monitoring-and-Alerting)

- **[Azure Application Insights](labs/7-Monitoring-and-Alerting/1-Application-Insights.md)**
  - Uso do Application Insights para visualizar dados de telemetria

- **[Testes de Disponibilidade com Application Insights](labs/7-Monitoring-and-Alerting/2-Application-Insights-Configure-Availability-Test.md)**
  - Configuração de testes de disponibilidade

- **[Log Analytics & Container Insights](labs/7-Monitoring-and-Alerting/3-Log-Analytics-Container-Insights.md)**
  - Análise de métricas e logs utilizando Container Insights

---

## 🔄 CI/CD

Você aprenderá como configurar e estruturar um pipeline completo de **CI/CD**.

![](images/cicdimage.png)

1. O desenvolvedor realiza alterações no código da aplicação.
2. O código é commitado no repositório Azure Repos.
3. O processo de **Integração Contínua (CI)** é acionado automaticamente.
4. O pipeline de **Deploy Contínuo (CD)** executa o deploy automatizado com variáveis específicas por ambiente.
5. A aplicação atualizada é implantada no cluster Kubernetes correspondente ao ambiente.
6. O Application Insights coleta e analisa dados de saúde, performance e uso.
7. O Azure Monitor coleta e analisa métricas e logs da infraestrutura.

---

## 🛠️ Autor & Comunidade

Este projeto foi criado por **[Harshhaa](https://github.com/NotHarshhaa)** 💡  
Feedbacks são sempre bem-vindos!

📧 **Conecte-se comigo:**

- **GitHub**: [@NotHarshhaa](https://github.com/NotHarshhaa)  
- **Blog**: [ProDevOpsGuy](https://blog.prodevopsguytech.com)  
- **Comunidade no Telegram**: [Entre aqui](https://t.me/prodevopsguy)  
- **LinkedIn**: [Harshhaa Vardhan Reddy](https://www.linkedin.com/in/harshhaa-vardhan-reddy/)

---

## ⭐ Apoie o Projeto

Se este material foi útil para você, considere deixar uma **estrela ⭐ no repositório** e compartilhar com sua rede! 🚀

### 📢 Fique Conectado

![Follow Me](https://imgur.com/2j7GSPs.png)
