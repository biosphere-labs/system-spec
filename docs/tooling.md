# Tools for each layer

Rule (decision 0013): where two formats cover a layer equally, the one with tools wins. Where the most complete format
has weak tools, its tools are listed here with what they do not do. Entries marked *unverified* have not been tried by
the maintainers yet; corrections are welcome.

| Layer | Format | Validate | Render for review | Use from JS / Java | Qualifications |
|---|---|---|---|---|---|
| Roles | Cedar | `cedar validate` against the schema (Cedar CLI); policy analysis | generate a role × action table | `@cedar-policy/cedar-wasm` / `cedar-java` | Analysis tooling is newer than the validator |
| Use cases | schema/use-case.schema.json | any JSON Schema validator | generated Markdown document | Ajv / networknt json-schema-validator | Format defined here, not an external standard |
| Examples | Gherkin | `@cucumber/gherkin` parser; gherkin-lint | as is | Cucumber.js / Cucumber-JVM | none |
| Data | JSON Schema 2020-12 | Ajv, networknt | json-schema-for-humans *(unverified)* | Ajv / networknt | none |
| Rules | Alloy 6 | Alloy Analyzer (consistency, counterexamples) | invariants listed from comments | none / Alloy API (Java) | Java only; command-line use *unverified* |
| Screens | IFML 1.0 (XMI) | Eclipse IFML editor; IFMLEdit.org (web) *(unverified)* | generated flow diagrams (Mermaid) | none maintained | **Weakest tooling of any layer.** Old, academic tools; a JSON serialisation of the IFML metamodel may be needed (SPEC.md Annex B) |
| Style | W3C design tokens | Style Dictionary, Terrazzo | swatch pages | Style Dictionary / none | Format is a community-group draft |
| HTTP | OpenAPI 3.1 | Spectral, Redocly CLI | Redoc, Swagger UI | many | none |
| Messages | AsyncAPI 3 | AsyncAPI CLI (`asyncapi validate`) | AsyncAPI Studio, generator | parser-js / asyncapi-java tools | Java tooling thinner than JS |
| Lifecycles | SCXML | XML Schema validation (W3C XSD) | generated state diagrams (Mermaid) | XState (via conversion) *(unverified)* / Apache Commons SCXML | Commons SCXML is little maintained |
| Quality | schema/quality-scenario.schema.json | JSON Schema validator | generated table per ISO 25010 characteristic | Ajv / networknt | ISO 25010 itself is a paywalled checklist; only its characteristic names are used |
| Runtime targets | OpenSLO | `oslo validate` | as is | none / none | Go CLI |
| Safety profile | ASVS 5, WCAG 2.2 IDs | IDs checked against OWASP's and W3C's published machine-readable lists *(unverified)* | generated checklist | — | none |
| Threat model | Open Threat Model | OTM JSON Schema | Threat Dragon / IriusRisk import *(unverified)* | Ajv / networknt; StartLeft (Python) | Few editors write OTM directly |
| Outside systems | C4 in Structurizr DSL | Structurizr CLI | Structurizr Lite, exported diagrams | none / Structurizr (Java) | none |
| Decisions | MADR 4 | markdownlint; front-matter check | Log4brains | adr-tools, Log4brains | none |
| Bundle | schema/manifest.schema.json + readiness rules | JSON Schema validator for the manifest; **readiness validator planned** | coverage report (planned) | planned for both | The main missing tool. Contributions welcome |
