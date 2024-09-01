# Serve Rest

O ServeRest é uma API REST gratuita que simula uma loja virtual com intuito de servir de material de estudos de testes de API.

## Estrutura do projeto

```
-| resources
--| api
--| Hooks
---| _index.resource
--| json
--| Pages
---| _index.resource
--| Variables
---| _index.resource
--| Base.resource
--| tests
```

# 💬 Sobre o projeto

O projeto consiste e criação de testes E2E para o Web do <a href="https://front.serverest.dev/login" target="_blank">ServeRest</a>, realizando testes para finalidade de estudos sobre o <a href="https://robotframework.org/" target="_blank">Robot Framework</a>, com a biblioteca **Browser**, na qual funciona com o <a href="https://playwright.dev/" target="_blank">Playwright</a>

# 💻 Preparando o ambiente

Para o correto funcionamento é necessário ter instalado

* <a href="https://www.python.org/downloads/" target="_blank">Python</a>
* <a href="https://robotframework.org/" target="_blank">Robot Framework</a>

Depois no próprio site do **Robot Framework** instalar a biblioteca **browser**

```python
pip install --upgrade robotframework-browser
```

E realizar a inicialização da biblioteca no qual irá realizar downloads de alguns arquivos

```python
rfbrowser init
```

Também é necessário ter a biblioteca **Robot Framework Requests** instalado

```python
pip install --upgrade robotframework-requests
```

📁 Clonando o projeto

Outra forma é clonando o projeto

```bash
git clone https://github.com/CristianoSFMothe/serverest.git
```

 É executando o comando:

```python
pip install -r requirements.txt    
```

✔️ Executando os Testes

- [x] Cadastro de usuário com perfil administrador
- [x] Cadastro de usuário com perfil comum
- [x] Tentativa de cadastro de usuário com perfil comum
  - [x] Usuário com e-mail já existente
  - [x] Campo nome vazio
  - [x] Campo e-mail vazio
  - [x] Campo senha vazio
  - [x] Todos os campos vazios
- [x] Login com usuário perfil administrador
- [x] Login com usuário perfil comum
  - [x] Tentativa de login com e-mail incorreto
  - [x] Tentativa de login com senha incorreto
  - [x] Tentativa de login com e-mail vazio
  - [x] Tentativa de login com senha vazio
  - [x] Tentativa de login com ambos vazios
