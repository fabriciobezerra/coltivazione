![Coltivazione Home](https://i.imgur.com/wuD3FNy.png)

# Coltivazione
Por [Fabricio Bezerra](https://github.com/fabriciobezerra)

[![Build Status](https://semaphoreci.com/api/v1/fabriciobezerra/coltivazione/branches/master/badge.svg)](https://semaphoreci.com/fabriciobezerra/coltivazione)
[![Maintainability](https://api.codeclimate.com/v1/badges/e324cb795b3fc35debc5/maintainability)](https://codeclimate.com/github/fabriciobezerra/coltivazione/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/e324cb795b3fc35debc5/test_coverage)](https://codeclimate.com/github/fabriciobezerra/coltivazione/test_coverage)

## Sumário do conteúdo

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 orderedList:0 -->

- [Sobre o Coltivazione](#sobre-o-coltivazione)
- [Instalando o Coltivazione](#instalando-o-coltivazione)
    - [Instalando manualmente](#instalando-manualmente)
    - [Instalando via docker](#instalando-via-docker)
- [Contribuindo](#contribuindo)

## Sobre o Coltivazione
Coltivazione em seu conceito é um meio de se administrar agronegócios dinamicamente, com o objetivo de se facilitar a comunicação entre quem está diretamente no campo ou em um escritório na cidade, via internet.

A grande motivação desse projeto é a modernização tecnológica do campo e o investimento atual que está tendo nele, com isso a área de tecnologia da informação tem uma meio para se introduzir nesta área da indústria, principalmente com novos meios de se ajudar na administração.

## Instalando o Coltivazione
### Instalando manualmente

#### Requerimentos:
- [Ruby 2.5.1](https://www.ruby-lang.org/pt/)
- [Rails 5.2.0](https://rubyonrails.org/)
- [Bundler](https://bundler.io/)
- [Node JS](https://nodejs.org/en/)
- [Postrgres 10](https://www.postgresql.org/)

#### Instalação
- Dentro da pasta do projeto:

```SHELL
## Faz as instalações necessarias automaticamente

$ bin/setup
```

- Em config/database.yml

```YAML
## Substituir pelas autenticações configuradas no postgres

default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  timeout: 5000
  username: "usuario_postgres"
  password: "senha_postgres"
  host: "host_postgres"
```

- Para executar os testes:

```SHELL
## Na raiz do projeto

$ rspec
```

- Para subir a aplicação

```SHELL
## Na raiz do projeto, estará disponivel em localhost:3000

$ rails s -b 0.0.0.0 -p3000
```

### Instalando via docker
#### Requerimentos
- [Docker](https://www.docker.com/community-edition)
- [Docker Compose](https://docs.docker.com/compose/)

#### Instalação

- Na pasta do projeto

```SHELL
$ cp .env.docker.yml .env.docker
$ docker-compose build
```

- Para realizar os testes

```
$ docker-compose run web bash bin/setup
$ docker-compose run web bash rspec
```

- Para subir a aplicação

```
$ docker-compose up
```

## Contribuindo
1. Clone o projeto!
2. Crie sua feature branch: `git checkout -b <sua-feature>`
3. Commit suas mudanças: `git commit -am 'Minha super feature'`
4. Envie seu branch para o repositório: `git push origin <sua-feature>`
5. Envie um Pull Request :D
