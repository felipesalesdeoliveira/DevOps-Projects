# 🚀 Kubernetes End-to-End Project on Amazon EKS

![EKS](https://imgur.com/oADneqS.png)

Este repositório demonstra um **projeto End-to-End (E2E) em Kubernetes**, onde a aplicação do jogo **2048** é containerizada, implantada e exposta utilizando **Amazon Elastic Kubernetes Service (EKS)**.

O objetivo é servir como **laboratório prático e material de estudo** para profissionais e estudantes de **DevOps / Cloud / Kubernetes**.

---

## 📌 Visão Geral do Projeto

* Containerização da aplicação com Docker
* Criação e configuração de um cluster EKS
* Configuração de IAM Roles e Node Groups
* Deploy da aplicação usando Kubernetes
* Exposição da aplicação via Service LoadBalancer
* Validação do acesso externo

---

## 🧰 Tecnologias Utilizadas

* **AWS EKS**
* **Kubernetes**
* **Docker**
* **AWS IAM**
* **AWS EC2 & ELB**
* **kubectl**
* **AWS CLI**

---

## 📋 Pré-requisitos

Antes de iniciar, certifique-se de ter:

* Conta ativa na AWS
* **AWS CLI** configurada (`aws configure`)
* **kubectl** instalado
* **eksctl** instalado
* Permissões para criar recursos EKS, EC2, IAM e ELB

---

## 🏗️ Arquitetura

* Cluster Kubernetes gerenciado pelo Amazon EKS
* Worker Nodes em EC2 (Amazon Linux 2)
* Service do tipo LoadBalancer para exposição da aplicação

---

## 🪜 Passo a Passo do Laboratório

### 1️⃣ Criar o Cluster EKS

* Criar um cluster EKS usando o console AWS
* Utilizar VPC padrão
* Habilitar acesso público ao endpoint do cluster

---

### 2️⃣ Configurar IAM Roles

#### Role do Cluster

* Nome: `eks-cluster-role`
* Policy:

  * `AmazonEKSClusterPolicy`

#### Role do Node Group

* Nome: `eks-node-grp-role`
* Policies:

  * `AmazonEKSWorkerNodePolicy`
  * `AmazonEC2ContainerRegistryReadOnly`
  * `AmazonEKS_CNI_Policy`

---

### 3️⃣ Criar Node Group

* AMI: Amazon Linux 2
* Desired / Min / Max: 1
* Security Group com portas:

  * 22
  * 80
  * 8080

---

### 4️⃣ Autenticar no Cluster

```bash
aws eks update-kubeconfig --region us-east-1 --name <nome-do-cluster>

kubectl get nodes
```

---

### 5️⃣ Criar Pod do Jogo 2048

Arquivo `2048-pod.yaml`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: 2048-pod
  labels:
    app: 2048-ws
spec:
  containers:
    - name: 2048-container
      image: blackicebird/2048
      ports:
        - containerPort: 80
```

Aplicar:

```bash
kubectl apply -f 2048-pod.yaml
kubectl get pods
```

---

### 6️⃣ Criar Service LoadBalancer

Arquivo `mygame-svc.yaml`:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: mygame-svc
spec:
  selector:
    app: 2048-ws
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: LoadBalancer
```

Aplicar:

```bash
kubectl apply -f mygame-svc.yaml
kubectl describe svc mygame-svc
```

---

### 7️⃣ Acessar a Aplicação

* Copie o DNS do LoadBalancer no console EC2
* Cole no navegador
* Aguarde alguns minutos até o serviço ficar ativo

🎮 **Pronto! O jogo 2048 estará disponível para jogar**

---

## 📂 Estrutura do Repositório

```text
.
├── 2048-pod.yaml
├── mygame-svc.yaml
└── README.md
```

---

## 🛠️ Autor & Comunidade

Projeto criado por **Harshhaa**

* GitHub: [https://github.com/NotHarshhaa](https://github.com/NotHarshhaa)
* Blog: [https://blog.prodevopsguytech.com](https://blog.prodevopsguytech.com)
* Telegram: [https://t.me/prodevopsguy](https://t.me/prodevopsguy)
* LinkedIn: [https://www.linkedin.com/in/harshhaa-vardhan-reddy/](https://www.linkedin.com/in/harshhaa-vardhan-reddy/)

---

## ⭐ Apoie o Projeto

Se este repositório foi útil:

* ⭐ Dê uma estrela no GitHub
* 🔁 Compartilhe com sua rede

Bons estudos e bons deploys 🚀
