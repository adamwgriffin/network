import type { CodegenConfig } from "@graphql-codegen/cli";

const config: CodegenConfig = {
  schema: "http://localhost:4000/graphql",
  documents: ["queries/**/*.graphql"],
  generates: {
    "./app/utils/graphqlCodegen.ts": {
      plugins: ["typescript", "typescript-operations", "typescript-vue-apollo"]
    }
  }
};

export default config;
