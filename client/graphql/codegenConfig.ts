import type { CodegenConfig } from "@graphql-codegen/cli";

const config: CodegenConfig = {
  schema: "http://localhost:4000/graphql",
  documents: ["./graphql/queries/**/*.{gql,graphql}"],
  generates: {
    "./app/utils/graphqlCodegen.ts": {
      plugins: ["typescript", "typescript-operations", "typescript-vue-apollo"]
    }
  },
  config: {
    // Will use import type {} rather than import {} when importing only types.
    // This gives compatibility with TypeScript's "importsNotUsedAsValues":
    // "error" option
    useTypeImports: true,
    // This will cause the generator to avoid using TypeScript optionals (?) on
    // types, so the following definition: type A { myField: String } will
    // output myField: Maybe<string> instead of myField?: Maybe<string>.
    avoidOptionals: true,
    // If scalars are found in the schema that are not defined in scalars an
    // error will be thrown during codegen.
    strictScalars: true,
    // Define custom scalars which would be found in the schema so they're
    // output as the correct types
    scalars: {
      ISO8601DateTime: "string"
    },
    // This is all for typescript-vue-apollo plugin. The main concern is to
    // configure the plugin to import from the correct places for Vue 3, which
    // it does not do by default.
    vueCompositionApiImportFrom: "vue",
    withCompositionFunctions: true,
    addDocBlocks: true
  }
};

export default config;
