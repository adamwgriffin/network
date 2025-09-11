# Network

A LinkedIn-style social media network service written with Ruby on Rails and GraphQL with Nuxt for the frontend.

## Installation

Requirements:

- Ruby >= 3.4
- Bundler >= 2.7
- Node.js >= 20

### Server

Run `bundle` to install dependencies.

Run `bin/rails db:setup` to create the database and seed it with dev data.

### Client

Change directory to `client`.

Copy the `env.example` file as `.env` for Nuxt.

Run `npm install`.

## Dev

Start client and server using Overmind with `bin/dev`.

Run tests with `bin/rspec`

## Codegen

Any time the GraphQL schema changes, or new queries are added/updated on the frontend, you can automatically generate types, queries and composables for the client by running `cd client && npm run codegen`. This makes use of GraphQL Code Generator. The GraphQL server must be running in order for the generator to read the schmea, so make sure Rails is running on port 4000. The config file for GraphQL Code Generator can be found at `client/graphql/codegenConfig.ts`

The queries that are used for frontend GraphQL API requests are stored under `client/graphql/queries/`. Adding or updating queries in this directory and running codegen will automatically generate the frontend code to use them. The automatically generated code is outputed to `client/app/utils/graphqlCodegen.ts` so that Nuxt will autoload it.
