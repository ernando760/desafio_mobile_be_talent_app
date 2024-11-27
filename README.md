# Desafio Prático - Be Talent

Este projeto foi desenvolvido como parte do processo seletivo para a vaga de **Jr Mobile Flutter ou React Native (Remoto)** na **Be Talent**. O objetivo deste desafio é criar um aplicativo com funcionalidades específicas, como uma tabela de dados com filtros de pesquisa e integração com APIs.

Para usar a API simulada do desafio, acesse o [repositório do desafio](https://github.com/BeMobile/desafio-mobile/tree/main?tab=readme-ov-file) e siga as instruções para configurar o ambiente corretamente.

---

## 🛠 Pré-requisitos

Antes de começar, certifique-se de ter os seguintes itens instalados na sua máquina:

- **Flutter**: Versão 3.x ou superior  
  [Guia de instalação do Flutter](https://docs.flutter.dev/get-started/install)
- **Dart**: Compatível com o Flutter 3.x
- **Android Studio** ou **VSCode**: Para rodar o emulador ou depurar a aplicação.
- **Git**: Para clonar o repositório  
  `sudo apt install git` (Linux) ou [Download Git](https://git-scm.com/downloads)

---

## 🚀 Como rodar o projeto

Para rodar a aplicação localmente, siga as etapas abaixo:

1. **Clone o repositório**:

   ```bash
   git clone https://github.com/ernando760/desafio_mobile_be_talent_app.git
   ```

2. **Navegue até o diretório do projeto**:

   ```bash
   cd desafio_mobile_be_talent_app
   ```

3. **Instale as dependências**:

   ```bash
   flutter pub get
   ```

4. **Crie ou configure o arquivo `launch.json`** (opcional):  
   Para rodar o projeto, você pode configurar um arquivo `launch.json` no seu editor (VSCode, por exemplo) com o seguinte conteúdo:

   ```json
   {
     "name": "desafio_mobile_be_talent_app",
     "request": "launch",
     "type": "dart",
     "args": ["--dart-define=API_URL=${API_URL}"]
   }
   ```

5. **Alternativamente, rode o projeto com o comando**:
   Caso prefira, você pode rodar o projeto diretamente com o comando no terminal:

   ```bash
   flutter run --dart-define=API_URL=${API_URL}
   ```

---

## ✨ Funcionalidades

O projeto atende aos seguintes requisitos:

- **Tabela de Dados**: Exibe as informações de usuários com as seguintes colunas:

  - Imagem (thumb do/a usuário/a)
  - Nome
  - Cargo
  - Data de admissão
  - Telefone

- **Pesquisa na Tabela**:  
  A tabela possui um campo de pesquisa que permite filtrar os dados por **cargo**, **nome** e **telefone**.

---

## 📌 Tecnologias e Pacotes Utilizados

Este projeto utiliza as seguintes tecnologias e pacotes externos:

- **flutter_modular**: Para gerenciamento de rotas e modularização do código.
- **dio**: Para realizar requisições HTTP.
- **result_dart**: Para um gerenciamento mais robusto de resultados de requisições.
- **equatable**: Para comparar objetos de forma mais eficiente.
- **flutter_svg**: Para renderizar imagens SVG.
- **mocktail**: Para facilitar a criação de mocks nos testes.

---

## 📋 Observações

- **API_URL**: A URL da API é configurada através do parâmetro `--dart-define`, como mostrado acima.
- Certifique-se de que todos os pacotes estão corretamente instalados antes de rodar o projeto.
