# System Spec

**System Spec** is a way to write down everything a piece of software must do, completely enough that whoever builds
it, people or AI agents, never has to stop and guess. It does not invent new formats. It takes the open standards
that already exist for each part of a system and fits them together into one specification, with rules that say when
the specification is complete.

> Status: version 0.1, a first draft for discussion. Feedback and extensions are welcome: see
> [CONTRIBUTING.md](CONTRIBUTING.md).

## Why

Good open formats exist for each part of a system: OpenAPI for HTTP APIs, AsyncAPI for messages, JSON Schema for
data, Gherkin for examples, SCXML for state machines, MADR for decisions, and more. What does not exist is an agreed
answer to two questions:

1. How do these fit together into **one** specification of a whole system?
2. How do you know that specification is **complete**?

Anyone who needs this looks for it, finds nothing, builds their own and keeps it private. Spec-driven development
tools (GitHub Spec Kit, OpenSpec, Kiro) specify one feature or one capability at a time; none ties every layer
together or defines when a whole-system specification is ready. System Spec is an open attempt to answer both
questions, so the next team does not have to start again.

## Who writes it, who reads it

System Spec assumes bundles are written by **LLM agents** following published skills, and **reviewed by people**
through generated views (diagrams, tables, plain-language rules). So each layer uses the format that can express the
most, precisely, even when that format is hard for a person to learn. Where two formats cover a layer equally, the one
with tools wins. Instructions for agents are in [AGENTS.md](AGENTS.md).

## What a bundle contains

A bundle is a folder. Each layer answers one question in an existing format:

| # | Question | Format |
|---|---|---|
| 1 | Who uses it, and who may do what? | [Cedar](https://www.cedarpolicy.com) schema and policies |
| 2 | What do they do? | Fully dressed use cases, [Gherkin](https://cucumber.io/docs/gherkin/), stories |
| 3 | What is it made of, and which rules always hold? | [JSON Schema 2020-12](https://json-schema.org), [Alloy 6](https://alloytools.org) |
| 4 | How is it reached? | [IFML](https://www.omg.org/spec/IFML/) screens, [OpenAPI 3.1](https://spec.openapis.org/oas/v3.1.0), [AsyncAPI 3](https://www.asyncapi.com), [W3C design tokens](https://www.designtokens.org) |
| 5 | How do things change over time? | [SCXML](https://www.w3.org/TR/scxml/) |
| 6 | How well must it work? | ISO/IEC 25010:2023, SEI quality-attribute scenarios, [OpenSLO](https://openslo.com) |
| 7 | What must it never do? | [OWASP ASVS 5](https://owasp.org/www-project-application-security-verification-standard/) and [WCAG 2.2](https://www.w3.org/TR/WCAG22/) by ID, misuse cases, [Open Threat Model](https://github.com/iriusrisk/OpenThreatModel) |
| 8 | Which outside systems does it touch? | Their contracts, [C4](https://c4model.com) context in [Structurizr DSL](https://docs.structurizr.com/dsl), failure behaviour |
| 9 | What is decided, and what is left to the builder? | [MADR 4](https://adr.github.io/madr/) |
| 10 | What product is this, for whom, among what? | Product context, following the ISO/IEC/IEEE 29148 stakeholder-requirements outline |
| 11 | Which engineering rules and technologies apply? | Engineering principles (after [arc42](https://arc42.org) sections 2 and 8), one decision per technology |

Six layers have no standard file format, so this repository defines JSON Schemas for them in [schema/](schema/): the
manifest, use cases, stories, quality scenarios, product context, outside systems and engineering principles.

## How completeness works

Every layer breaks down into countable **coverage units**: a use-case extension, a (role, action) pair, a state
transition, a screen state, a quality scenario, an ASVS requirement. A bundle is **ready** when every unit is
specified, linked to a testable acceptance criterion and traced to evidence or a decision, or is explicitly marked as
the builder's choice. Every rule is mechanical, so a validator can say exactly what is missing and what kind of
source would fill it. See [SPEC.md section 6](SPEC.md#6-readiness-definition-of-ready).

Three rules keep it honest:

- **One home per fact.** A field type lives only in JSON Schema, a transition only in SCXML, a permission only in Cedar.
  Everything else refers to it by identifier.
- **Open choices are explicit.** Anything left to the builder is a decision record with status `builder-choice` that
  names the constraints. Silence is never a choice.
- **Say what, never how.** A bundle describes what can be observed from outside the system. Internal structure is the
  builder's.

## Getting started

1. Copy [template/](template/) into your project as the start of a bundle.
2. Give an agent [AGENTS.md](AGENTS.md) and the bundle folder, with your requirements material.
3. Validate each file with the tools in [docs/tooling.md](docs/tooling.md), then the bundle against the readiness rules.

A validator for the readiness rules is planned; until it exists, the rules in SPEC.md are checked by the format
tools plus review.

## Repository layout

```
SPEC.md           the specification
AGENTS.md         instructions for LLM agents writing or reviewing a bundle
llms.txt          a short index for LLMs
schema/           JSON Schemas for the manifest and the layers with no standard format
template/         an empty bundle to copy
docs/
  decisions/      why each layer uses its format (MADR 4: this project records its decisions in the format it uses)
  tooling.md      tools for each layer, and what they cannot do
  extending.md    how to add a layer or format
CHANGELOG.md
CONTRIBUTING.md
LICENSE           MIT
```

## Related work

[MADR](https://adr.github.io/madr/) (decisions), [GitHub Spec Kit](https://github.com/github/spec-kit) and
[OpenSpec](https://github.com/Fission-AI/OpenSpec) (spec-driven development per feature or capability),
[Backstage](https://backstage.io/docs/features/software-catalog/descriptor-format) (linking artifacts that exist),
ISO/IEC/IEEE 29148 (what a requirements specification should contain), [arc42](https://arc42.org) (architecture
documentation). System Spec aims to work alongside them: exports to Spec Kit and OpenSpec are welcome contributions.

## License

[MIT](LICENSE).
