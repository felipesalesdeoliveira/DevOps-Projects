# 🚀 End-to-End CI/CD Pipeline para Aplicações Android com GitHub Actions

![GitHub Actions](https://imgur.com/XNUS0pA.png)

## 📌 Visão Geral

Este repositório demonstra a implementação de um **pipeline CI/CD End-to-End** para aplicações Android utilizando **GitHub Actions**, cobrindo desde **build e testes**, passando por **análise de qualidade**, até **deploy automatizado** com integração a ferramentas amplamente usadas no ecossistema DevOps.

O objetivo é servir como **referência prática e educacional**, mostrando como construir um pipeline robusto, seguro e escalável para projetos Android.

---

## 🎯 Objetivos do Projeto

* Automatizar **CI (Continuous Integration)** para apps Android
* Implementar **CD (Continuous Delivery/Deployment)** com controle por branch
* Integrar ferramentas de **qualidade, observabilidade e notificações**
* Demonstrar **casos de uso reais** com GitHub Actions

---

## 🧩 Principais Funcionalidades

* 🔨 **Build automatizado** com Gradle
* 🧪 **Testes e Lint** para qualidade de código
* 📊 **Análise de código com SonarQube** (incluindo cobertura)
* 📦 **Gerenciamento de artifacts (APK)** entre jobs
* ☁️ **Upload de APKs no JFrog Artifactory**
* 🔐 **Controle de acesso dinâmico via Security Groups (AWS EC2)**
* 📣 **Notificações no Microsoft Teams**
* 🧹 **Limpeza automática de caches e artifacts**
* ⏰ **Workflows agendados (cron jobs)**
* 🖥️ **Uso de GitHub-hosted runners e self-hosted runners**

---

## 🏗️ Arquitetura do Pipeline

```text
┌────────────┐
│   Commit   │
└─────┬──────┘
      │
      ▼
┌────────────┐
│  CI Build  │
│ Gradle +  │
│ Lint +    │
│ SonarQube │
└─────┬──────┘
      │ Artifacts (APK)
      ▼
┌────────────┐
│   CD Job   │
│ Deploy &  │
│ Upload    │
│ (JFrog)   │
└─────┬──────┘
      ▼
┌────────────┐
│ Teams Msg │
└────────────┘
```

---

## 🔄 Gatilhos do Workflow

O pipeline é acionado quando ocorre:

* `push` nas branches:

  * `main`
  * `qa`
  * `develop`
* `pull_request` para:

  * `main`
  * `qa`

Além disso, workflows auxiliares são acionados por:

* `workflow_run`
* `schedule (cron)`

---

## 🌍 Variáveis de Ambiente

As variáveis de ambiente podem ser definidas em diferentes níveis:

* Workflow inteiro
* Job específico
* Step específico

Exemplo:

```yaml
env:
  AWS_DEFAULT_REGION: ap-south-1
```

---

## 🔐 Secrets Utilizados

Este projeto utiliza **GitHub Secrets** para armazenar informações sensíveis:

* `SONAR_TOKEN`
* `SONAR_HOST_URL`
* `JF_URL`
* `JF_USER`
* `JF_PASSWORD`
* `TEAMS_WEBHOOK_URL`
* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`

Configuração:

```
Settings → Secrets → Actions
```

---

## 🧪 Etapas de CI (Build Job)

* Checkout do código
* Setup do Java (Temurin JDK 11)
* Permissão de execução do Gradle Wrapper
* `gradlew clean`
* `gradlew lint`
* `gradlew build`
* `gradlew jacocoTest`
* Análise de qualidade com SonarQube
* Geração dinâmica de timestamp
* Organização dos APKs (debug / release)
* Upload de artifacts

---

## 📦 Estrutura dos Artifacts

```text
apk-files/
 ├── qa/
 │   ├── debug/
 │   └── release/
 └── master/
     ├── debug/
     └── release/
```

Cada arquivo APK contém timestamp para rastreabilidade.

---

## 🚀 Etapas de CD (Deploy Job)

* Executa somente após sucesso do job `build`
* Condicional por branch (`qa` ou `master`)
* Download dos artifacts
* Identificação do IP público do runner
* Liberação temporária de acesso no Security Group (AWS)
* Upload dos APKs para o **JFrog Artifactory**
* Remoção do IP do Security Group (cleanup)
* Notificação final no Microsoft Teams

---

## 🧹 Limpeza Automática

### 🔁 Limpeza de Cache

* Workflow acionado via `workflow_run`
* Remove caches criados pelo GitHub Actions
* Permissões elevadas com `GITHUB_TOKEN`

### ⏰ Limpeza de Artifacts

* Workflow com `cron job` (executa a cada hora)
* Remove artifacts antigos automaticamente

---

## 🖥️ Self-Hosted Runner

O projeto também demonstra como:

* Criar um **self-hosted runner**
* Registrar o runner no repositório
* Executar o runner como **serviço no Linux**

Comandos principais:

```bash
./run.sh
sudo ./svc.sh install
sudo ./svc.sh start
sudo ./svc.sh status
```

---

## 📚 Casos de Uso Demonstrados

* Encadeamento de workflows
* Compartilhamento de dados entre jobs
* Segurança dinâmica em cloud
* Integração CI/CD + Mobile
* Automação avançada com GitHub Actions

---

## 🛠️ Tecnologias Utilizadas

* GitHub Actions
* Android / Gradle
* SonarQube
* JFrog Artifactory
* AWS EC2 / Security Groups
* Microsoft Teams
* Linux

---

## 👤 Autor & Créditos

Projeto criado por **Harshhaa**
🔗 GitHub: [https://github.com/NotHarshhaa](https://github.com/NotHarshhaa)
📝 Blog: [https://blog.prodevopsguytech.com](https://blog.prodevopsguytech.com)

---

## ⭐ Apoie o Projeto

Se este repositório foi útil para você:

* ⭐ Dê uma estrela no GitHub
* 🔄 Compartilhe com sua rede
* ☕ Buy me a coffee 😉

---

## 📢 Observação Final

Este repositório é ideal para **estudo, labs DevOps, entrevistas técnicas e referência prática** para pipelines CI/CD modernos focados em aplicações Android.
