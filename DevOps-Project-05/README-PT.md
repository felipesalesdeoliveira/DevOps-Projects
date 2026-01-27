# Deploy do seu código em um Container Docker usando Jenkins na AWS

![AWS](https://imgur.com/Hk28ffE.png)

**Neste blog, vamos fazer o deploy de uma aplicação Web Java em um Container Docker executando em uma instância EC2, utilizando o Jenkins.**

---

## Agenda

* Configurar o Jenkins
* Configurar e integrar Maven e Git
* Integrar GitHub e Maven com Jenkins
* Configurar o Docker Host
* Integrar Docker com Jenkins
* Automatizar o processo de Build e Deploy usando Jenkins
* Testar o deploy

---

## Pré-requisitos

* Conta na AWS
* Conta no Git/GitHub com o código-fonte
* Máquina local com acesso à CLI
* Familiaridade com Docker e Git

---

## Etapa 1: Configurar o Servidor Jenkins em uma Instância EC2 na AWS

* Criar uma instância EC2 Linux
* Instalar Java
* Instalar Jenkins
* Iniciar o Jenkins
* Acessar a interface Web pela porta 8080

Entre no console da AWS, abra o painel do EC2 e clique em **Launch Instance**.

Defina o nome da instância, escolha o tipo **t2.micro** (elegível ao free tier), selecione um par de chaves existente (ou crie um novo) e configure a rede utilizando a VPC padrão com IP público habilitado.

Crie um novo **Security Group**, permitindo:

* SSH (porta 22)
* TCP personalizado na porta 8080 (Jenkins)

Finalize clicando em **Launch Instance**.

Após a criação, conecte-se à instância via SSH usando o comando fornecido pela AWS.

---

### Instalação do Jenkins

Siga as instruções oficiais do Jenkins para Amazon Linux:
[https://pkg.jenkins.io/redhat-stable/](https://pkg.jenkins.io/redhat-stable/)

```bash
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
```

Instale os pacotes necessários:

```bash
sudo yum install epel-release -y
sudo yum install java-11-openjdk -y
sudo yum install jenkins -y
```

Inicie e habilite o Jenkins:

```bash
sudo systemctl enable jenkins
sudo systemctl start jenkins
```

Acesse o Jenkins via navegador:

```
http://<IP_PUBLICO_EC2>:8080
```

Para desbloquear o Jenkins:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Instale os plugins sugeridos e crie o usuário administrador.

---

## Etapa 2: Integrar GitHub com Jenkins

* Instalar Git na instância do Jenkins
* Instalar o plugin GitHub no Jenkins
* Configurar o Git no Jenkins

Instale o Git:

```bash
sudo yum install git -y
git --version
```

No Jenkins:

* **Manage Jenkins** → **Manage Plugins**
* Aba **Available** → procure por **GitHub Integration Plugin**
* Instale sem reiniciar

Configure o Git:

* **Manage Jenkins** → **Global Tool Configuration**
* Em **Git installations**, informe o nome `Git`
* Salve

---

## Etapa 3: Integrar Maven com Jenkins

* Instalar Maven no servidor Jenkins
* Configurar variáveis de ambiente
* Instalar plugin do Maven
* Configurar Java e Maven no Jenkins

Baixe e extraia o Maven:

```bash
cd /opt
sudo wget https://downloads.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
sudo tar -xvzf apache-maven-3.9.6-bin.tar.gz
```

Configure variáveis no `.bash_profile`:

```bash
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export M2_HOME=/opt/apache-maven-3.9.6
export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin
```

Valide:

```bash
source ~/.bash_profile
mvn -version
```

No Jenkins:

* Instale o **Maven Integration Plugin**
* Configure Java e Maven em **Global Tool Configuration**

---

## Etapa 4: Configurar um Docker Host

Crie uma nova instância EC2 Linux para o Docker.

Instale o Docker:

```bash
sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker
docker --version
```

### Criar Container Docker com Tomcat

```bash
docker pull tomcat
docker run -d --name tomcat-container -p 8081:8080 tomcat
```

Libere a porta 8081 no Security Group.

Se aparecer erro 404, execute dentro do container:

```bash
cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
```

### Criar Dockerfile customizado

```Dockerfile
FROM tomcat:latest
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
```

Build da imagem:

```bash
docker build -t tomcatserver .
docker run -d --name tomcat-server -p 8085:8080 tomcatserver
```

---

## Etapa 5: Integrar Docker com Jenkins

* Criar usuário `dockeradmin`
* Adicionar ao grupo docker
* Habilitar autenticação por senha no SSH
* Instalar plugin **Publish Over SSH**

```bash
usermod -aG docker dockeradmin
```

No Jenkins:

* **Manage Jenkins** → **Configure System**
* Configure **Publish over SSH** apontando para o Docker Host

---

## Etapa 6: Criar Job no Jenkins para Copiar Artefatos

* Clone um job existente
* Configure **Send files or execute commands over SSH**
* Copie o arquivo `.war` para o Docker Host

Após o build, valide a presença do `.war` no servidor Docker.

---

## Etapa 7: Atualizar Dockerfile para Copiar Artefatos

Crie o diretório:

```bash
mkdir /opt/docker
chown -R dockeradmin:dockeradmin /opt/docker
```

Dockerfile atualizado:

```Dockerfile
FROM tomcat:latest
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
COPY ./*.war /usr/local/tomcat/webapps
```

Build e execução:

```bash
docker build -t tomcat:v1 .
docker run -d --name tomcatv1 -p 8086:8080 tomcat:v1
```

---

## Etapa 8: Automatizar Build e Deploy

No Jenkins, configure comandos remotos:

```bash
cd /opt/docker
docker build -t regapp:v1 .
docker run -d --name registerapp -p 8087:8080 regapp:v1
```

Ao commitar no GitHub, o Jenkins irá:

* Buildar
* Gerar artefato
* Criar imagem Docker
* Subir container automaticamente

---

## Conclusão

**Neste laboratório, automatizamos todo o processo de build e deploy utilizando GitHub, Jenkins, Docker e AWS EC2.**

**Bons estudos! 🚀**

---

## 🛠️ Autor & Comunidade

Projeto criado por **Harshhaa**.

* GitHub: [https://github.com/NotHarshhaa](https://github.com/NotHarshhaa)
* Blog: [https://blog.prodevopsguytech.com](https://blog.prodevopsguytech.com)
* Telegram: [https://t.me/prodevopsguy](https://t.me/prodevopsguy)
* LinkedIn: Harshhaa Vardhan Reddy

---

## ⭐ Apoie o Projeto

Se este material foi útil, considere deixar uma ⭐ no repositório e compartilhar com sua rede.
