# 🚀 Implementação Completa de um Pipeline CI/CD Avançado com as Principais Ferramentas DevOps

![DevOps Pipeline](https://imgur.com/WcCpKVU.png)

Um pipeline CI/CD completo de ponta a ponta utilizando **Terraform**, **Ansible**, **Jenkins**, **SonarQube**, **JFrog**, **Docker**, **EKS**, **Prometheus** e **Grafana**.

---

## 🧩 Visão Geral da Arquitetura do Pipeline

> Abaixo está a implementação passo a passo de todo o processo de CI/CD DevOps.

<details>
<summary><strong>🔧 Etapa 1: Provisionamento de Infraestrutura (Terraform)</strong></summary>

- Provisionamento de **VPC**, **Security Groups**, **Controller Ansible**, **Jenkins Master** e **Instâncias Agent** usando Terraform.  
🔗 [Detalhes da Etapa](https://github.com/NotHarshhaa/DevOps-Projects/blob/master/DevOps-Project-06/Steps/step1.md#L1)

</details>

<details>
<summary><strong>🔐 Etapa 2: Configuração de SSH</strong></summary>

- Configuração de autenticação sem senha entre o Controller Ansible e os nós Agent.  
🔗 [Detalhes da Etapa](https://github.com/NotHarshhaa/DevOps-Projects/blob/master/DevOps-Project-06/Steps/step2.md#L1)

</details>

<details>
<summary><strong>⚙️ Etapa 3: Setup do Jenkins (Ansible)</strong></summary>

- Configuração do Jenkins Master e dos nós Agent.  
- Agent configurado como **Servidor de Build Maven**.  
🔗 [Detalhes da Etapa](https://github.com/NotHarshhaa/DevOps-Projects/blob/master/DevOps-Project-06/Steps/step3.md#L1)

</details>

<details>
<summary><strong>🔗 Etapa 4: Integração Jenkins Master-Agent</strong></summary>

- Conexão do Jenkins Master com o Agent utilizando credenciais.  
🔗 [Detalhes da Etapa](https://github.com/NotHarshhaa/DevOps-Projects/blob/master/DevOps-Project-06/Steps/step4.md#L1)

</details>

<details>
<summary><strong>🌐 Etapa 5: Integração com GitHub</strong></summary>

- Adição das credenciais do GitHub.  
- Criação de um **Job Multibranch Pipeline**.  
🔗 [Detalhes da Etapa](https://github.com/NotHarshhaa/DevOps-Projects/blob/master/DevOps-Project-06/Steps/step5.md#L1)

</details>

<details>
<summary><strong>🚨 Etapa 6: Configuração de Trigger via Webhook</strong></summary>

- Configuração do webhook do GitHub usando o plugin **Multibranch Scan Webhook Trigger**.  
🔗 [Detalhes da Etapa](https://github.com/NotHarshhaa/DevOps-Projects/blob/master/DevOps-Project-06/Steps/step6.md#L1)

</details>

<details>
<summary><strong>🧪 Etapa 7: Integração com SonarQube</strong></summary>

- Geração de token de acesso no SonarCloud.  
- Instalação do plugin SonarQube Scanner.  
- Adição do servidor SonarQube e do scanner no Jenkins.  
- Configuração do arquivo `sonar-project.properties`.  
- Inclusão das etapas de **qualidade de código**, **testes unitários** e **build** no `Jenkinsfile`.  
🔗 [Configuração Passo a Passo](https://github.com/NotHarshhaa/DevOps-Projects/blob/master/DevOps-Project-06/Steps/step7.md#L3)

</details>

<details>
<summary><strong>📦 Etapa 8: Integração com JFrog Artifactory</strong></summary>

- Configuração das credenciais do JFrog.  
- Instalação do plugin do Artifactory no Jenkins.  
🔗 [Detalhes](https://github.com/NotHarshhaa/DevOps-Projects/blob/master/DevOps-Project-06/Steps/step8.md#L1)

</details>

<details>
<summary><strong>🐳 Etapa 9: Build da Imagem Docker & Push para o JFrog</strong></summary>

- Criação da imagem Docker a partir do `.jar`.  
- Push da imagem para o JFrog Artifactory usando o **Docker Pipeline Plugin**.  
- Adição da etapa **Docker Build & Publish** no Jenkinsfile.  
🔗 [Detalhes](https://github.com/NotHarshhaa/DevOps-Projects/blob/master/DevOps-Project-06/Steps/step9.md#L1)

</details>

<details>
<summary><strong>☸️ Etapa 10: Setup do Cluster EKS</strong></summary>

- Criação do **cluster EKS** via Terraform.  
- Instalação do `kubectl` e da AWS CLI no Jenkins Agent.  
- Configuração das credenciais do Kubernetes usando:
