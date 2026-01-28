# Implantando uma aplicação no AKS usando Azure DevOps & Azure Cloud Shell

## Pré-requisitos

1. Acesso a uma conta Azure

2. Acesso ao Azure DevOps e um token PAT (Personal Access Token)

3. Acesso a uma conta GitHub

4. Criar uma organização no Azure DevOps. Acesse [aqui](https://aex.dev.azure.com/) e clique no botão **“Create a new organization”**.

5. Todos os comandos a seguir devem ser executados no **Azure Cloud Shell**. Acesse o shell [aqui](https://shell.azure.com/) a partir de qualquer navegador e faça login na sua conta Azure.

Você pode usar a tela do PowerShell, mas neste walkthrough será utilizado **Bash**. Digite `bash` no terminal para alternar para comandos bash.

---

## Arquitetura Geral

[![Arquitetura Geral](https://res.cloudinary.com/practicaldev/image/fetch/s--aST7vxoo--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/9yjcvrdm1uibekjf354m.PNG)](https://res.cloudinary.com/practicaldev/image/fetch/s--aST7vxoo--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/9yjcvrdm1uibekjf354m.PNG)

*O diagrama acima foi criado usando o Cloud Skew. Recomendo fortemente que você dê uma olhada (é GRATUITO).*

* **Azure DevOps & GitHub** são excelentes produtos SaaS, fáceis de usar. O GitHub e o Azure Pipelines ajudam a atender às necessidades de controle de código-fonte e CI/CD. O código-fonte fica em um repositório Git no GitHub (aplicação, infraestrutura e código de pipeline), e o pipeline de CI/CD é definido como um pipeline YAML no Azure.

* **Azure Container Registry (ACR)** é um registry de containers nativo do Azure, semelhante ao Docker Hub, porém totalmente integrado ao ecossistema Azure e ao Azure Active Directory, oferecendo maior segurança. O pipeline do Azure neste demo constrói e envia a imagem Docker para o ACR (uma nova versão da imagem é criada a cada execução bem-sucedida do pipeline).

* **Azure Kubernetes Service (AKS)** é um serviço gerenciado e serverless de orquestração de containers. O AKS roda diretamente no Azure como um serviço PaaS e fornece um ambiente Kubernetes para implantar e gerenciar aplicações Docker containerizadas. Esse ambiente Kubernetes gerenciado é onde os recursos Kubernetes deste demo são executados.

* **Azure Active Directory (Azure AD)** é a solução nativa de gerenciamento de identidades do Azure. Neste demo, ele é essencial porque você precisa de um **Service Principal** (uma identidade baseada em um App Registration do Azure AD). Esse Service Principal é usado para criar uma conexão segura e autenticada (Service Connection com o Azure Resource Manager), permitindo implantar recursos com as permissões corretas na assinatura Azure correta.

---

## Configuração Inicial

* Adicionar a extensão do Azure DevOps à sessão do Cloud Shell:

```bash
az extension add --name azure-devops
```

* Adicionar o contexto da organização do Azure DevOps ao shell:

```bash
az devops configure --defaults organization=https://dev.azure.com/insertorgnamehere/
```

* Definir a variável de ambiente **AZURE_DEVOPS_EXT_PAT** no nível do processo, permitindo executar comandos sem login explícito:

```bash
export AZURE_DEVOPS_EXT_PAT=insertyourpattokenhere
```

* Criar um novo projeto no Azure DevOps:

```bash
az devops project create --name k8s-project
```

* Definir o projeto padrão:

```bash
az devops configure --defaults project=k8s-project
```

---

## Implantando a Infraestrutura

* Criar um Resource Group para organizar logicamente os recursos do Azure:

```bash
az group create --location westeurope --resource-group my-aks-rg
```

* Criar um Service Principal. O cluster AKS usará esse Service Principal para acessar o Azure Container Registry e fazer pull das imagens.

**IMPORTANTE: Copie a saída do comando abaixo, pois ela será usada posteriormente:**

```bash
az ad sp create-for-rbac --skip-assignment
```

* Criar um cluster AKS para implantar a aplicação (utilizando a saída do comando anterior).

**IMPORTANTE: Às vezes ocorre o erro "400 Client Error: Bad Request for url". Este é um problema conhecido e normalmente executar o comando novamente resolve.**

```bash
az aks create -g my-aks-rg -n myakscluster -c 1 --generate-ssh-keys --service-principal "insertappidhere" --client-secret "insertpasswordhere"
```

* Criar um Azure Container Registry (ACR), que será o repositório das imagens utilizadas pelo AKS:

```bash
az acr create -g my-aks-rg -n insertuniqueacrnamehere --sku Basic --admin-enabled true
```

* Permitir que o AKS faça pull das imagens do ACR configurando as permissões RBAC:

```bash
ACR_ID=$(az acr show --name ghostauacr --resource-group my-aks-rg --query "id" --output tsv)

CLIENT_ID=$(az aks show -g my-aks-rg -n myakscluster --query "servicePrincipalProfile.clientId" --output tsv)

az role assignment create --assignee $CLIENT_ID --role acrpull --scope $ACR_ID
```

---

## Implantando a Aplicação

* Faça um fork do repositório GitHub:

[ghostinthewires / **k8s-application**](https://github.com/ghostinthewires/k8s-application)

* Clone o repositório no Cloud Shell:

```bash
git clone https://github.com/<seu-usuario-github>/k8s-application.git

cd k8s-application
```

* Criar um pipeline no Azure DevOps:

```bash
az pipelines create --name "k8s-application-pipeline"
```

* Siga os prompts no terminal para configurar o pipeline:

1. Informe seu usuário do GitHub
2. Informe sua senha do GitHub
3. Confirme a senha
4. (Se habilitado) Informe o código de autenticação em dois fatores
5. Informe um nome para a service connection (ex: k8sapplicationpipeline)
6. Escolha a opção **[3]** para implantar no Azure Kubernetes Service
7. Selecione o cluster AKS criado
8. Escolha **[2]** para o namespace Kubernetes `default`
9. Selecione o ACR criado
10. Informe o nome da imagem (ou pressione Enter para usar o padrão)
11. Informe a porta do serviço (ou pressione Enter para usar o padrão)
12. Para habilitar review app em pull requests, pressione Enter sem informar valor
13. Escolha **[1]** para continuar com o YAML gerado
14. Escolha **[1]** para commitar diretamente na branch `master`

---

## 🎉 Parabéns!

Você criou com sucesso um projeto no Azure DevOps. Aguarde alguns minutos enquanto a imagem é construída, enviada ao ACR e implantada no AKS.

* Obter as credenciais do kubeconfig para acessar o cluster AKS:

```bash
az aks get-credentials --resource-group my-aks-rg --name myakscluster
```

* Visualizar os recursos Kubernetes criados:

```bash
kubectl get all
```

* Copie o IP externo do serviço (campo **External IP**) e abra em uma nova aba do navegador adicionando `:8888` ao final.

---

## Resultado Final

[![Resultado Final](https://res.cloudinary.com/practicaldev/image/fetch/s--IlcXQ_4m--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/rak18btkdex17vlu4my7.PNG)](https://res.cloudinary.com/practicaldev/image/fetch/s--IlcXQ_4m--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/rak18btkdex17vlu4my7.PNG)

---

## Resumo

Em um curto período de tempo, você criou um novo projeto no Azure DevOps, configurou um pipeline de CI/CD, construiu sua aplicação em um container, enviou a imagem para o Azure Container Registry e implantou a aplicação no Azure Kubernetes Service. Como resultado, sua aplicação web está rodando no AKS e acessível via um serviço Kubernetes.

**IMPORTANTE:** Verifique o arquivo `azure-pipelines.yml` no seu repositório. A linha `trigger: - master` indica que toda alteração na branch `master` dispara automaticamente um novo build.

Agora que você tem uma aplicação totalmente funcional rodando no AKS, é hora de explorar como tudo isso funciona nos bastidores.

---

## 🛠️ Autor & Comunidade

Este projeto foi criado por **[Harshhaa](https://github.com/NotHarshhaa)** 💡.

📧 **Conecte-se comigo:**

* **GitHub**: [@NotHarshhaa](https://github.com/NotHarshhaa)
* **Blog**: [ProDevOpsGuy](https://blog.prodevopsguytech.com)
* **Telegram**: [Comunidade](https://t.me/prodevopsguy)

---

## ⭐ Apoie o Projeto

Se este material foi útil para você, considere dar uma ⭐ no repositório e compartilhar com sua rede! 🚀

![Follow Me](https://imgur.com/2j7GSPs.png)
