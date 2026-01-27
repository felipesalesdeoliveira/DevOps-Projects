# Deploy de Arquitetura VPC Escalável na AWS Cloud

![AWS-Cloud](https://imgur.com/AXD50yl.png)

### SUMÁRIO

1. [Objetivo](#objetivo)
2. [Pré-requisitos](#pré-requisitos)
3. [Pré-Deploy](#pré-deploy)
4. [Deploy da VPC](#deploy-da-vpc)
5. [Validação](#validação)

## Objetivo

Implantar uma arquitetura de rede virtual modular e escalável utilizando o Amazon VPC.

## Pré-requisitos

1. Você deve possuir uma [conta AWS](https://aws.amazon.com/) para criar recursos de infraestrutura na nuvem AWS.
2. [Código-fonte](https://github.com/NotHarshhaa/DevOps-Projects/blob/master/DevOps-Project-02/html-web-app)

## Pré-Deploy

Customizar as dependências da aplicação mencionadas abaixo em uma instância AWS EC2 e criar a **Golden AMI**.

1. AWS CLI
2. Instalar o Apache Web Server
3. Instalar o Git
4. CloudWatch Agent
5. Enviar métricas customizadas de memória para o CloudWatch
6. AWS SSM Agent

## Deploy da VPC

1. Criar uma VPC (192.168.0.0/16) para o deployment do Bastion Host conforme a arquitetura apresentada acima.
2. Criar uma VPC (172.32.0.0/16) para o deployment de servidores de aplicação altamente disponíveis e com auto scaling conforme a arquitetura apresentada acima.
3. Criar um NAT Gateway na Subnet Pública e atualizar a Route Table associada à Subnet Privada para rotear o tráfego padrão para o NAT Gateway, permitindo acesso de saída à internet.
4. Criar um Transit Gateway e associar ambas as VPCs ao Transit Gateway para comunicação privada.
5. Criar um Internet Gateway para cada VPC e atualizar a Route Table associada às Subnets Públicas para rotear o tráfego padrão para o IGW, permitindo tráfego de entrada e saída da internet.
6. Criar um CloudWatch Log Group com dois Log Streams para armazenar os VPC Flow Logs de ambas as VPCs.
7. Habilitar Flow Logs para ambas as VPCs e enviar os logs para o CloudWatch Log Group, armazenando-os no Log Stream correspondente a cada VPC.
8. Criar um Security Group para o Bastion Host permitindo acesso na porta 22 a partir da internet pública.
9. Implantar uma instância EC2 de Bastion Host na Subnet Pública com um Elastic IP (EIP) associado.
10. Criar um bucket S3 para armazenar configurações específicas da aplicação.
11. Criar uma Launch Configuration com as seguintes configurações:

    1. Golden AMI
    2. Tipo de instância – t2.micro
    3. User Data para fazer o pull do código do repositório Bitbucket para o diretório root do web server e iniciar o serviço httpd.
    4. IAM Role concedendo acesso ao Session Manager e ao bucket S3 criado no passo anterior para obter as configurações. (Não conceder acesso total ao S3)
    5. Security Group permitindo acesso na porta 22 a partir do Bastion Host e na porta 80 a partir da internet pública.
    6. Key Pair
12. Criar um Auto Scaling Group com Min: 2 e Max: 4, associado a duas Subnets Privadas nas zonas de disponibilidade 1a e 1b.
13. Criar um Target Group e associá-lo ao Auto Scaling Group.
14. Criar um Network Load Balancer na Subnet Pública e adicionar o Target Group como destino.
15. Atualizar a hosted zone do Route53 com um registro CNAME roteando o tráfego para o NLB.

## Validação

1. Como engenheiro DevOps, acessar as instâncias privadas via Bastion Host.
2. Acessar o AWS Session Manager e utilizar o shell da EC2 diretamente pelo console.
3. Acessar a aplicação web a partir de um navegador na internet pública usando o nome de domínio e verificar se a página é carregada corretamente.

## 🛠️ Autor & Comunidade

Este projeto foi criado por **[Harshhaa](https://github.com/NotHarshhaa)** 💡.
Seu feedback é muito bem-vindo!

📧 **Conecte-se comigo:**

* **GitHub**: [@NotHarshhaa](https://github.com/NotHarshhaa)
* **Blog**: [ProDevOpsGuy](https://blog.prodevopsguytech.com)
* **Telegram**: [Entrar na Comunidade](https://t.me/prodevopsguy)
* **LinkedIn**: [Harshhaa Vardhan Reddy](https://www.linkedin.com/in/harshhaa-vardhan-reddy/)

---

## ⭐ Apoie o Projeto

Se este conteúdo foi útil para você, considere dar uma **estrela** ⭐ no repositório e compartilhar com sua rede 🚀.

### 📢 Fique Conectado

![Follow Me](https://imgur.com/2j7GSPs.png)
