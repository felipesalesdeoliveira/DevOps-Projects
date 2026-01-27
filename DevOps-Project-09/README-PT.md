# DevSecOps : Clone da Netflix com CI/CD e Monitoramento | Email

![devsecops](https://imgur.com/vORuBnK.png)

## Link do Blog do Projeto

* [https://harshhaa.hashnode.dev/devsecops-netflix-clone-ci-cd-with-monitoring-email](https://harshhaa.hashnode.dev/devsecops-netflix-clone-ci-cd-with-monitoring-email)

## Visão Geral do Projeto

* ***Neste projeto, iremos realizar o deploy de um clone da Netflix. Utilizaremos o Jenkins como ferramenta de CI/CD, faremos o deploy da aplicação em containers Docker e em um cluster Kubernetes, e monitoraremos métricas do Jenkins e do Kubernetes utilizando Grafana, Prometheus e Node Exporter. Espero que este blog detalhado seja útil.***

## Etapas do Projeto

* **Etapa 1** — Lançar uma instância Ubuntu (22.04) T2 Large
* **Etapa 2** — Instalar Jenkins, Docker e Trivy. Criar um container SonarQube usando Docker
* **Etapa 3** — Criar uma chave de API do TMDB
* **Etapa 4** — Instalar Prometheus e Grafana no novo servidor
* **Etapa 5** — Instalar o plugin Prometheus e integrá-lo ao servidor Prometheus
* **Etapa 6** — Integração de e-mail com Jenkins e configuração do plugin
* **Etapa 7** — Instalar plugins como JDK, SonarQube Scanner, NodeJS e OWASP Dependency Check
* **Etapa 8** — Criar um projeto Pipeline no Jenkins usando Declarative Pipeline
* **Etapa 9** — Instalar o plugin OWASP Dependency Check
* **Etapa 10** — Build e push da imagem Docker
* **Etapa 11** — Deploy da imagem usando Docker
* **Etapa 12** — Configuração do Kubernetes master e worker no Ubuntu (20.04)
* **Etapa 13** — Acessar a aplicação Netflix no navegador
* **Etapa 14** — Encerrar as instâncias AWS EC2

---

## Etapa 1: Lançar uma instância Ubuntu (22.04) T2 Large

* Crie uma instância EC2 T2 Large com Ubuntu 22.04
* Crie ou utilize um par de chaves existente
* No Security Group, libere as portas HTTP, HTTPS e todas as portas (não recomendado para produção, apenas para fins de estudo)

---

## Etapa 2: Instalar Jenkins, Docker e Trivy. Criar container SonarQube

### 2A — Instalar Jenkins

Crie o script abaixo e execute como root ou via userdata:

```bash
vi jenkins.sh
```

```bash
#!/bin/bash
sudo apt update -y
wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc
echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
sudo apt update -y
sudo apt install temurin-17-jdk -y
java --version
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl start jenkins
```

```bash
chmod 777 jenkins.sh
./jenkins.sh
```

Acesse o Jenkins em:

```
http://<IP_PUBLICO_EC2>:8080
```

Senha inicial:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

### 2B — Instalar Docker

```bash
sudo apt update
sudo apt install docker.io -y
sudo usermod -aG docker $USER
newgrp docker
sudo chmod 777 /var/run/docker.sock
```

Criar container do SonarQube (porta 9000 aberta):

```bash
docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
```

### 2C — Instalar Trivy

```bash
sudo apt-get install wget apt-transport-https gnupg lsb-release -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/trivy.list
sudo apt update
sudo apt install trivy -y
```

---

## Etapa 3: Criar uma chave de API do TMDB

* Acesse [https://www.themoviedb.org](https://www.themoviedb.org)
* Crie uma conta ou faça login
* Vá em **Settings → API → Create**
* Aceite os termos, preencha os dados e gere sua API Key

---

## Etapa 4: Instalar Prometheus e Grafana

Criação de usuário do sistema para Prometheus:

```bash
sudo useradd --system --no-create-home --shell /bin/false prometheus
```

Download e instalação do Prometheus, configuração de diretórios, permissões e criação do serviço systemd, conforme descrito no laboratório original.

Acesse o Prometheus:

```
http://<IP_PUBLICO>:9090
```

Instale e configure o Node Exporter (porta 9100) e adicione como target no Prometheus.

Instale o Grafana e acesse:

```
http://<IP_PUBLICO>:3000
```

Credenciais padrão:

```
admin / admin
```

Configure Prometheus como Data Source e importe o Dashboard **1860**.

---

## Etapa 5: Monitorar Jenkins com Prometheus

* Instale o plugin Prometheus no Jenkins
* Configure o endpoint `/prometheus`
* Adicione o Jenkins como target no Prometheus:

```yaml
- job_name: 'jenkins'
  metrics_path: '/prometheus'
  static_configs:
    - targets: ['<IP_JENKINS>:8080']
```

Importe o Dashboard **9964** no Grafana.

---

## Etapa 6: Integração de E-mail no Jenkins

* Instale o plugin **Email Extension**
* Gere App Password no Gmail (2FA obrigatório)
* Configure SMTP e credenciais no Jenkins
* Adicione o bloco `emailext` no pipeline para notificações automáticas

---

## Etapa 7: Instalar Plugins Essenciais

* Eclipse Temurin Installer
* SonarQube Scanner
* NodeJS Plugin
* OWASP Dependency Check

Configure JDK 17 e NodeJS 16 em **Global Tool Configuration**.

---

## Etapa 8: Criar Pipeline Declarativo no Jenkins

* Configure credenciais do SonarQube
* Crie Webhook para Quality Gate
* Utilize pipeline declarativo com análise SonarQube, Quality Gate e build NodeJS

---

## Etapa 9: OWASP Dependency Check e Trivy FS Scan

Adicione stages para análise de dependências e scan de filesystem com Trivy.

---

## Etapa 10: Build e Push da Imagem Docker

* Instale plugins Docker no Jenkins
* Configure credenciais DockerHub
* Build, tag e push da imagem
* Scan da imagem com Trivy

---

## Etapa 11: Deploy com Docker e Kubernetes

* Execute o container Docker localmente
* Configure cluster Kubernetes (Master + Worker)
* Configure kubeconfig no Jenkins
* Deploy da aplicação via manifests Kubernetes

---

## Etapa 12: Kubernetes Master e Worker

* Verifique serviços e pods
* Acesse via NodePort ou LoadBalancer

---

## Etapa 13: Acessar o Clone da Netflix

Acesse a aplicação pelo navegador utilizando o IP público e a porta configurada no serviço Kubernetes.

---

## Etapa 14: Encerrar Instâncias

* Finalize as instâncias EC2 para evitar custos desnecessários

---

## 🛠️ Autor & Comunidade

Projeto criado por **Harshhaa**.

* GitHub: [https://github.com/NotHarshhaa](https://github.com/NotHarshhaa)
* Blog: [https://blog.prodevopsguytech.com](https://blog.prodevopsguytech.com)
* Telegram: [https://t.me/prodevopsguy](https://t.me/prodevopsguy)
* LinkedIn: [https://www.linkedin.com/in/harshhaa-vardhan-reddy/](https://www.linkedin.com/in/harshhaa-vardhan-reddy/)

---

## ⭐ Apoie o Projeto

Se este material te ajudou, deixe uma ⭐ no repositório e compartilhe 🚀
