# 🏗️ Infraestrutura AWS em Dois Níveis com Terraform

![Arquitetura Two-Tier](https://imgur.com/X4dGBg6.gif)

## 📌 Visão Geral

Este projeto demonstra uma **arquitetura Two-Tier na AWS** utilizando **Terraform** para Infraestrutura como Código (IaC). Ele segue uma abordagem modular e reforçada em segurança para criar uma infraestrutura **escalável, segura e de fácil manutenção**.

### ✅ Principais Funcionalidades

* **Arquitetura Modular** – Módulos Terraform reutilizáveis para melhor gerenciamento
* **Infraestrutura como Código (IaC)** – Automação do provisionamento de recursos AWS
* **Boas Práticas de Segurança** – Funções e políticas IAM, além de integração com WAF
* **Escalabilidade e Alta Disponibilidade** – Auto Scaling, Balanceamento de Carga e Route 53
* **Integração com Banco de Dados** – Implantação gerenciada do Amazon RDS
* **SSL e Otimização com CDN** – Conexões seguras e aceleração de conteúdo

---

## 📖 Guia Passo a Passo

📌 **Leia o tutorial completo com capturas de tela**:
[Implantar Arquitetura Two-Tier na AWS usando Terraform](https://blog.prodevopsguytech.com/deploy-two-tier-architecture-on-aws-using-terraform)

---

## 🚀 Primeiros Passos

### 1️⃣ Clonar o Repositório

```bash
git clone https://github.com/NotHarshhaa/DevOps-Projects
cd DevOps-Projects/DevOps-Project-11/
```

### 2️⃣ Inicializar e Aplicar o Terraform

```bash
terraform init
terraform plan -var-file=variables.tfvars
terraform apply -var-file=variables.tfvars --auto-approve
```

### 3️⃣ Limpeza (Destruir a Infraestrutura)

```bash
terraform destroy -var-file=variables.tfvars --auto-approve
```

---

## 🏗️ Destaques da Arquitetura do Projeto

### 🔹 **Rede e Segurança**

✅ **VPC e Sub-redes** – Ambiente isolado e seguro para sua aplicação
✅ **IAM e Controle de Acesso Baseado em Funções** – Permissões de segurança granulares
✅ **AWS WAF** – Proteção contra ameaças comuns da web

### 🔹 **Computação e Escalabilidade**

✅ **Auto Scaling Group** – Escalonamento dinâmico conforme a demanda
✅ **Application Load Balancer (ALB)** – Distribuição eficiente de tráfego
✅ **Instâncias EC2** – Poder computacional confiável

### 🔹 **Armazenamento e Banco de Dados**

✅ **Amazon RDS** – Banco de dados gerenciado com escalabilidade e confiabilidade
✅ **Buckets S3** – Armazenamento seguro para ativos da aplicação

### 🔹 **Rede e Otimização**

✅ **Amazon Route 53** – Sistema de nomes de domínio (DNS) escalável
✅ **Amazon CloudFront (CDN)** – Entrega de conteúdo mais rápida em escala global
✅ **Criptografia SSL/TLS** – Comunicação segura com ACM

---

## 🛠️ Autor e Comunidade

Este projeto foi criado por **[Harshhaa](https://github.com/NotHarshhaa)** 💡.
Feedback é sempre bem-vindo! Fique à vontade para compartilhar suas opiniões.

📧 **Conecte-se comigo:**

* **GitHub**: [@NotHarshhaa](https://github.com/NotHarshhaa)
* **Blog**: [ProDevOpsGuy](https://blog.prodevopsguytech.com)
* **Comunidade no Telegram**: [Entre Aqui](https://t.me/prodevopsguy)
* **LinkedIn**: [Harshhaa Vardhan Reddy](https://www.linkedin.com/in/harshhaa-vardhan-reddy/)

---

## ⭐ Apoie o Projeto

Se este conteúdo foi útil para você, considere **dar uma estrela** ⭐ no repositório e compartilhá-lo com sua rede! 🚀

### 📢 Fique Conectado

![Siga-me](https://imgur.com/2j7GSPs.png)
