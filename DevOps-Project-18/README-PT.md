# Jenkins Pipeline para aplicação Java usando Maven, SonarQube, Argo CD, Helm e Kubernetes

![](https://user-images.githubusercontent.com/43399466/228301952-abc02ca2-9942-4a67-8293-f76647b6f9d8.png)

## 🔗 URL DO BLOG: [https://harshhaa.hashnode.dev/streamlining-cicd-workflow-with-github-jenkins-sonarqube-docker-argocd-and-gitops](https://harshhaa.hashnode.dev/streamlining-cicd-workflow-with-github-jenkins-sonarqube-docker-argocd-and-gitops)

A seguir estão os detalhes **passo a passo** para configurar um **pipeline Jenkins end-to-end para uma aplicação Java utilizando SonarQube, Argo CD, Helm e Kubernetes**:

---

## Pré-requisitos

* Código da aplicação Java hospedado em um repositório Git
* Servidor Jenkins
* Cluster Kubernetes
* Gerenciador de pacotes Helm
* Argo CD

---

## Passos

### 1. Instalar os plugins necessários no Jenkins

* 1.1 Plugin Git
* 1.2 Plugin Maven Integration
* 1.3 Plugin Pipeline
* 1.4 Plugin Kubernetes Continuous Deploy

---

### 2. Criar um novo pipeline no Jenkins

* 2.1 No Jenkins, crie um novo job do tipo *pipeline* e configure-o com a URL do repositório Git da aplicação Java.
* 2.2 Adicione um arquivo **Jenkinsfile** ao repositório Git para definir os estágios do pipeline.

---

### 3. Definir os estágios do pipeline

* **Estágio 1**: Checkout do código-fonte a partir do Git.
* **Estágio 2**: Build da aplicação Java utilizando Maven.
* **Estágio 3**: Execução de testes unitários utilizando JUnit e Mockito.
* **Estágio 4**: Execução da análise do SonarQube para verificar a qualidade do código.
* **Estágio 5**: Empacotamento da aplicação em um arquivo JAR.
* **Estágio 6**: Deploy da aplicação em um ambiente de testes utilizando Helm.
* **Estágio 7**: Execução de testes de aceitação do usuário (UAT) na aplicação implantada.
* **Estágio 8**: Promoção da aplicação para o ambiente de produção utilizando Argo CD.

---

### 4. Configurar os estágios do pipeline no Jenkins

* **Estágio 1**: Utilizar o plugin Git para realizar o checkout do código-fonte.
* **Estágio 2**: Utilizar o plugin Maven Integration para realizar o build da aplicação Java.
* **Estágio 3**: Utilizar os plugins JUnit e Mockito para executar os testes unitários.
* **Estágio 4**: Utilizar o plugin SonarQube para analisar a qualidade do código da aplicação Java.
* **Estágio 5**: Utilizar o plugin Maven Integration para empacotar a aplicação em um arquivo JAR.
* **Estágio 6**: Utilizar o plugin Kubernetes Continuous Deploy para realizar o deploy da aplicação em ambiente de testes usando Helm.
* **Estágio 7**: Utilizar um framework de testes como Selenium para executar os testes de aceitação do usuário.
* **Estágio 8**: Utilizar o Argo CD para promover a aplicação para o ambiente de produção.

---

### 5. Configurar o Argo CD

* Instalar o Argo CD no cluster Kubernetes.
* Configurar um repositório Git para que o Argo CD acompanhe as alterações nos Helm Charts e manifestos Kubernetes.
* Criar um Helm Chart para a aplicação Java contendo os manifestos Kubernetes e os valores do Helm.
* Adicionar o Helm Chart ao repositório Git que o Argo CD está monitorando.

---

### 6. Configurar o pipeline do Jenkins para integração com o Argo CD

* 6.1 Adicionar o token da API do Argo CD nas credenciais do Jenkins.
* 6.2 Atualizar o pipeline Jenkins para incluir o estágio de deploy via Argo CD.

---

### 7. Executar o pipeline do Jenkins

* 7.1 Disparar o pipeline Jenkins para iniciar o processo de CI/CD da aplicação Java.
* 7.2 Monitorar os estágios do pipeline e corrigir quaisquer problemas que surgirem.

---

Este pipeline Jenkins end-to-end automatiza todo o processo de CI/CD de uma aplicação Java — desde o checkout do código até o deploy em produção — utilizando ferramentas amplamente adotadas como **SonarQube, Argo CD, Helm e Kubernetes**.

---

## 🛠️ Autor & Comunidade

Este projeto foi criado por **[Harshhaa](https://github.com/NotHarshhaa)** 💡.
Feedbacks são sempre bem-vindos — fique à vontade para compartilhar suas opiniões!

📧 **Conecte-se comigo:**

* **GitHub**: [@NotHarshhaa](https://github.com/NotHarshhaa)
* **Blog**: [ProDevOpsGuy](https://blog.prodevopsguytech.com)
* **Comunidade no Telegram**: [Entre aqui](https://t.me/prodevopsguy)

---

## ⭐ Apoie o Projeto

Se este conteúdo foi útil para você, considere **dar uma estrela ⭐ no repositório** e compartilhá-lo com sua rede! 🚀

### 📢 Fique Conectado

![Follow Me](https://imgur.com/2j7GSPs.png)
