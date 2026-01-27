# Diversão com Linux para Engenheiros Cloud & DevOps

![linux](https://imgur.com/VpPW8PM.png)

***Novo em Linux? A atividade abaixo cobre todos os fundamentos necessários de Linux para que você se familiarize como um engenheiro DevOps.***

![Linux](https://imgur.com/xedzuwy.png)

## Habilidades

As habilidades abaixo são necessárias para concluir as etapas do laboratório:

* Gerenciamento de Usuários no Linux
* Permissões
* Estrutura de Diretórios
* Sistemas de Arquivos
* Gerenciamento de Arquivos

## Pré-requisitos

Faça login na AWS e crie uma instância EC2 baseada em Linux para concluir o laboratório abaixo.

## Execução do Laboratório

1. Faça login no servidor como superusuário (root) e execute o seguinte:

   1. Crie usuários e defina senhas – user1, user2, user3
   2. Crie os grupos – devops, aws
   3. Altere o grupo primário dos usuários user2 e user3 para o grupo “devops”
   4. Adicione o grupo “aws” como grupo secundário do usuário “user1”
   5. Crie a estrutura de arquivos e diretórios conforme mostrado no diagrama acima
   6. Altere o grupo de /dir1, /dir7/dir10, /f2 para o grupo “devops”
   7. Altere o proprietário de /dir1, /dir7/dir10, /f2 para o usuário “user1”

2. Faça login como user1 e execute o seguinte:

   1. Crie usuários e defina senhas – user4, user5
   2. Crie os grupos – app, database

3. Faça login como “user4” e execute o seguinte:

   1. Crie o diretório – /dir6/dir4
   2. Crie o arquivo – /f3
   3. Mova o arquivo de “/dir1/f1” para “/dir2/dir1/dir2”
   4. Renomeie o arquivo “/f2” para “/f4”

4. Faça login como “user1” e execute o seguinte:

   1. Crie o diretório – “/home/user2/dir1”
   2. Acesse o diretório “/dir2/dir1/dir2/dir10” e crie o arquivo “/opt/dir14/dir10/f1” utilizando caminho relativo
   3. Mova o arquivo de “/opt/dir14/dir10/f1” para o diretório home do user1
   4. Delete recursivamente o diretório “/dir4”
   5. Delete todos os arquivos e diretórios filhos em “/opt/dir14” usando um único comando
   6. Escreva o texto “Linux assessment for an DevOps Engineer!! Learn with Fun!!” no arquivo /f3 e salve

5. Faça login como “user2” e execute o seguinte:

   1. Crie o arquivo “/dir1/f2”
   2. Delete /dir6
   3. Delete /dir8
   4. Substitua o texto “DevOps” por “devops” no arquivo /f3 sem utilizar editor
   5. Utilizando o editor Vi, copie a linha 1 e cole 10 vezes no arquivo /f3
   6. Procure pelo padrão “Engineer” e substitua por “engineer” no arquivo /f3 usando um único comando
   7. Delete /f3

6. Faça login como usuário “root” e execute o seguinte:

   1. Procure pelo arquivo chamado “f3” no servidor e liste todos os caminhos absolutos onde o arquivo for encontrado
   2. Mostre a contagem do número de arquivos no diretório “/”
   3. Imprima a última linha do arquivo “/etc/passwd”

7. Faça login na AWS e crie um volume EBS de 5GB na mesma AZ da instância EC2 e anexe o volume à instância

8. Faça login como usuário “root” e execute o seguinte:

   1. Crie um sistema de arquivos no novo volume EBS anexado na etapa anterior
   2. Monte o sistema de arquivos no diretório /data
   3. Verifique a utilização do sistema de arquivos usando o comando “df -h” – este comando deve mostrar o sistema de arquivos /data
   4. Crie o arquivo “f1” no sistema de arquivos /data

9. Faça login como “user5” e execute o seguinte:

   1. Delete /dir1
   2. Delete /dir2
   3. Delete /dir3
   4. Delete /dir5
   5. Delete /dir7
   6. Delete /f1 e /f4
   7. Delete /opt/dir14

10. Faça login como usuário “root” e execute o seguinte:

11. Delete os usuários – user1, user2, user3, user4, user5

12. Delete os grupos – app, aws, database, devops

13. Delete os diretórios home de todos os usuários – user1, user2, user3, user4, user5 (se ainda existirem)

14. Desmonte o sistema de arquivos /data

15. Delete o diretório /data

16. Faça login na AWS, desanexe o volume EBS da instância EC2, delete o volume e, em seguida, finalize a instância EC2

Terminou tudo? Ainda não está confiante? Repita os passos!

**Bons Estudos!**

---

## 🛠️ Autor & Comunidade

Este projeto foi criado por **[Harshhaa](https://github.com/NotHarshhaa)** 💡.
Adoraria receber seu feedback! Fique à vontade para compartilhar suas opiniões.

📧 **Conecte-se comigo:**

* **GitHub**: [@NotHarshhaa](https://github.com/NotHarshhaa)
* **Blog**: [ProDevOpsGuy](https://blog.prodevopsguytech.com)
* **Comunidade no Telegram**: [Entre aqui](https://t.me/prodevopsguy)
* **LinkedIn**: [Harshhaa Vardhan Reddy](https://www.linkedin.com/in/harshhaa-vardhan-reddy/)

---

## ⭐ Apoie o Projeto

Se você achou este conteúdo útil, considere dar uma **estrela** ⭐ no repositório e compartilhar com sua rede! 🚀

### 📢 Fique Conectado

![Follow Me](https://imgur.com/2j7GSPs.png)
