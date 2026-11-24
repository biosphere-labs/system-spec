# System Spec, draft 0.1

The key words MUST, MUST NOT, SHOULD and MAY are used as described in RFC 2119.

## 1. Scope

A **bundle** specifies one software system: everything a user, a client or another system can observe about it.
It MUST NOT prescribe internal structure (modules, classes, libraries, storage layout) except where a constraint
from outside the system forces it, and then only as a recorded decision (layer 9) or an engineering principle
(layer 11).

A bundle is complete when two independent builders, given only the bundle, would produce systems whose observable
behaviour differs only where the bundle explicitly says the choice is the builder's.

## 2. Principles

- **P1. Written by agents, reviewed by people.** Bundles are expected to be authored by LLMs following published
  skills. Formats are chosen for coverage and precision, not ease of learning. Every layer MUST have a generated
  review view (section 7) so people never review raw formats they do not read.
- **P2. Existing standards first.** A layer uses an existing open standard wherever one exists. This standard
  defines JSON Schemas only for layers that have none (use cases, stories, quality scenarios, product context,
  external systems, engineering principles) and for the manifest.
- **P3. One home per fact.** Each fact is stated in exactly one file. Every other mention is a reference by
  identifier (section 4). A fact stated twice is a defect, even when both statements agree.
- **P4. Everything counts.** Every layer defines **coverage units** (section 6). Each unit becomes at least one
  acceptance criterion for the builder. A statement that produces no coverage unit has no effect on what is built.
- **P5. Open choices are explicit.** Anything left to the builder is marked with a `builder-choice` decision
  (section 5.9) that names the constraints the choice must respect. Silence is never a choice.
- **P6. Evidence for every statement.** Every coverage unit traces to a source: a quoted passage from the
  requester's material, a research finding, or a decision record.

## 3. Bundle layout

```
system.spec.yaml                 manifest (schema/manifest.schema.json)
product/context.yaml             layer 10
principles/engineering.yaml      layer 11
roles/schema.cedarschema         layer 1: entity types, actions
roles/policies.cedar             layer 1: permit and forbid rules
behaviour/use-cases/UC-*.yaml    layer 2 (schema/use-case.schema.json)
behaviour/features/*.feature     layer 2: Gherkin
behaviour/stories/ST-*.yaml      layer 2 (schema/story.schema.json)
domain/schemas/*.schema.json     layer 3: JSON Schema 2020-12
domain/model.als                 layer 3: Alloy 6
domain/glossary.yaml             layer 3
interfaces/ui/*.ifml             layer 4: IFML (XMI)
interfaces/ui/tokens.json        layer 4: W3C design tokens
interfaces/http/*.openapi.yaml   layer 4: OpenAPI 3.1
interfaces/messages/*.asyncapi.yaml  layer 4: AsyncAPI 3
lifecycles/*.scxml               layer 5
quality/scenarios/QS-*.yaml      layer 6 (schema/quality-scenario.schema.json)
quality/slos/*.yaml              layer 6: OpenSLO
safety/profile.yaml              layer 7: ASVS level, WCAG level, regulations
safety/misuse/*.feature          layer 7: misuse cases in Gherkin
safety/threat-model.otm.json     layer 7: Open Threat Model
external/EXT-*.yaml              layer 8 (schema/external-system.schema.json)
external/contracts/*             layer 8: the outside systems' OpenAPI or AsyncAPI
external/context.dsl             layer 8: C4 system context, Structurizr DSL
decisions/NNNN-*.md              layer 9: MADR 4
views/                           generated review views (never edited)
```

Paths are fixed so that agents and tools find files without reading the manifest. The manifest still lists every
file, its layer and its format version.

## 4. Identifiers and references

Every coverage unit has an identifier that is unique in the bundle:

| Prefix | Unit | Defined in |
|---|---|---|
| `ROLE-` | a role (a Cedar principal type or group) | roles/schema.cedarschema |
| `ACT-` | an action | roles/schema.cedarschema |
| `POL-` | a policy (Cedar `@id` annotation) | roles/policies.cedar |
| `UC-n` | a use case; `UC-n.s` a step; `UC-n.sa` an extension (Cockburn numbering, e.g. `UC-3.4a`) | behaviour/use-cases |
| `SC-` | a Gherkin scenario (tag `@SC-…`) | behaviour/features, safety/misuse |
| `ST-` | a story | behaviour/stories |
| `ENT-` | an entity (JSON Schema `$id` ends with it) | domain/schemas |
| `INV-` | an invariant (Alloy `fact` or `assert` named `INV_…`) | domain/model.als |
| `TERM-` | a glossary term | domain/glossary.yaml |
| `SCR-` | a screen (IFML ViewContainer id) | interfaces/ui |
| `OP-` | an HTTP operation (OpenAPI `operationId`) | interfaces/http |
| `MSG-` | a message (AsyncAPI operation id) | interfaces/messages |
| `SM-` | a state machine (SCXML `name`); `SM-x/state` a state; `SM-x/state--event` a transition | lifecycles |
| `QS-` | a quality scenario | quality/scenarios |
| `SLO-` | a service-level objective (OpenSLO `metadata.name`) | quality/slos |
| `THR-` | a threat (OTM threat id) | safety/threat-model.otm.json |
| `EXT-` | an outside system | external |
| `ADR-nnnn` | a decision | decisions |

A reference is written as the identifier alone. Where a format has no field for it, the reference goes in that
format's extension mechanism: `x-spec-refs` in OpenAPI, AsyncAPI and JSON Schema; a tag in Gherkin; an annotation
in Cedar; a `spec:refs` attribute in SCXML (namespace `https://github.com/biosphere-labs/system-spec/ns/1`, provisional); an `Annotation` element in IFML.

## 5. Layers

Each layer lists: the format, what it MUST contain, and its coverage units.

### 5.1 Roles and permissions (Cedar)

- MUST declare every kind of principal (user roles, service accounts, anonymous visitors) and every action a
  principal can attempt, including actions on screens and on messages, not only on HTTP operations.
- MUST give every policy an `@id("POL-…")` annotation and an `@spec_refs("UC-…")` annotation naming the use-case
  steps that need it.
- Default is deny. Every action MUST be reached by at least one `permit`, or be named in a decision that says it is
  never permitted.
- **Coverage units:** each pair of (role, action) is one unit, decided by the policies as permit, forbid or
  conditional. A conditional pair produces one unit per condition branch.
- **Check:** Cedar's validator against the schema; Cedar policy analysis for "can any role ever do X".

### 5.2 Behaviour (use cases, Gherkin, stories)

- **Use cases** (schema/use-case.schema.json): primary actor, stakeholders and interests, preconditions, minimal
  and success guarantees, trigger, main success scenario, and extensions. Every step MUST be considered for
  extensions; a step with none MUST say `extensions: none-identified` with the reason.
- **Gherkin**: every main scenario and every extension MUST have at least one scenario tagged with its use-case
  step (`@UC-3.4a`). Values that vary MUST use `Scenario Outline` with `Examples` tables that include boundary
  values.
- **Stories** (schema/story.schema.json): the slices of work a builder delivers. Each story names the use-case steps
  it delivers and lists its acceptance criteria as references to scenarios. Every use-case step MUST be delivered
  by exactly one story.
- **Coverage units:** each use-case step and each extension.

### 5.3 Domain (JSON Schema, Alloy, glossary)

- **JSON Schema 2020-12** for every entity and value type. The interface layers MUST reference these schemas
  rather than define their own.
- **Alloy 6** for relationships, multiplicities and invariants. Every invariant is a named `fact` or `assert`
  (`INV_…`) with a `--` comment giving its plain-language reading.
- **Glossary**: one entry per domain term, with its definition and the entity that holds it.
- **Coverage units:** each invariant; each entity field constraint.
- **Check:** the Alloy Analyzer finds no counterexample to any assert and the facts are satisfiable. P3 applies:
  field types live in JSON Schema only; Alloy refers to entities by name and adds only relations and rules.

### 5.4 Interfaces (IFML, OpenAPI, AsyncAPI, design tokens)

- **Screens (IFML)**: every screen (ViewContainer), its components and their data bindings (to `ENT-`), every
  event and the action or navigation it triggers. Every screen MUST define its states: empty, loading, partial,
  error and success, or say why a state cannot occur.
- **HTTP (OpenAPI 3.1)** and **messages (AsyncAPI 3)**: every operation with every response or reply, its error
  bodies, its security requirement (naming `ACT-`) and its examples. Payloads reference domain schemas.
  AsyncAPI is used for any transport (Kafka, AMQP, MQTT, WebSocket, webhooks); the transport itself MAY be a
  builder's choice.
- **Design tokens** (W3C Design Tokens Community Group format): colour, type, spacing and motion.
- **Coverage units:** each screen state; each IFML event; each pair of (operation, response status); each message.

### 5.5 Lifecycles (SCXML)

- One machine for every entity or process whose behaviour depends on its history (an order, a subscription, an
  import job).
- MUST list every event the machine accepts in every state, either as a transition or as explicitly ignored.
- **Coverage units:** each transition; each pair of (state, event) that is explicitly forbidden.

### 5.6 Quality (ISO/IEC 25010:2023, SEI scenarios, OpenSLO)

- The bundle MUST address each of the nine 25010:2023 characteristics (functional suitability, performance
  efficiency, compatibility, interaction capability, reliability, security, maintainability, flexibility, safety)
  with scenarios, or record a decision that the characteristic does not apply.
- Each scenario (schema/quality-scenario.schema.json) has source, stimulus, environment, artifact, response and a
  **numeric** response measure.
- Runtime targets (latency, availability, error rate) are also written as OpenSLO objectives, linked to their scenario.
- **Coverage units:** each scenario.

### 5.7 Must never (ASVS, WCAG, misuse cases, Open Threat Model)

- `safety/profile.yaml` names the OWASP ASVS 5 level, the WCAG 2.2 level and any regulations (for example GDPR).
  Each named requirement ID that applies is a coverage unit; an ID judged not applicable needs a decision.
- **Misuse cases**: Gherkin features for what an attacker or careless user tries, tagged `@misuse`.
- **Threat model** (Open Threat Model JSON): components are the bundle's outside systems and interfaces, never
  internal modules; each threat has a mitigation that names a coverage unit or a decision.
- **Coverage units:** each applicable ASVS and WCAG requirement; each misuse scenario; each threat.

### 5.8 Outside systems

- One file per outside system (schema/external-system.schema.json): what it provides, its contract, its limits
  (rate, size, availability) and the required behaviour when it is unavailable, slow or returns an error.
- `external/context.dsl`: a C4 system-context view only. Containers and components are out of scope (section 1).
- **Coverage units:** each failure mode's required behaviour.

### 5.9 Decisions (MADR 4)

- Full template: context, decision drivers, options considered with their pros and cons, outcome, consequences, and
  confirmation (how anyone can check the decision is followed).
- A **builder-choice** decision has `status: builder-choice` in its front matter. It names what is left open and the
  constraints the builder's choice must satisfy.
- **Coverage units:** each decision's confirmation.

### 5.10 Product context

- schema/product-context.schema.json, following the outline of the stakeholder requirements specification in
  ISO/IEC/IEEE 29148: purpose, scope, stakeholders, users and their characteristics, operational environment,
  business processes and constraints. Plus: product category, comparable products with what the system must match
  or beat, and differentiators.
- **Coverage units:** none directly. Every requirement in other layers SHOULD trace to a stakeholder need here.

### 5.11 Engineering principles

- principles/engineering.yaml: constraints (arc42 section 2: technical, organisational, conventions), cross-cutting
  concepts (arc42 section 8), code quality, testing discipline, error handling, security practice and governance.
- Every technology the requester fixes (language, framework, cloud, database) is a decision; every technology left
  open is a `builder-choice` decision.

## 6. Readiness (definition of ready)

A bundle is **ready** when a validator confirms all of the following. Every rule is mechanical.

1. The manifest validates against schema/manifest.schema.json and lists every file in the bundle.
2. Every file validates against its format's own schema or tool (Cedar validator, OpenAPI and AsyncAPI validators,
   JSON Schema meta-schema, a Gherkin parser, SCXML schema, IFML metamodel, Alloy Analyzer, OTM schema, OpenSLO).
3. Every identifier is unique, and every reference resolves.
4. Every coverage unit of every layer (section 5) is linked to at least one testable acceptance criterion: a
   Gherkin scenario, an OpenAPI or AsyncAPI example, or a quality scenario with a numeric measure.
5. Every use-case step is delivered by exactly one story.
6. Every (role, action) pair has a decision from the policies.
7. Every (state, event) pair of every machine is a transition or explicitly ignored.
8. Every screen has all five states or a reason.
9. Every 25010:2023 characteristic has a scenario or a decision.
10. No fact is stated twice (P3): field types appear only in JSON Schema; transitions only in SCXML; permissions only
    in Cedar.
11. Every coverage unit traces to evidence or a decision (P6).
12. There are no open questions: the manifest's `openQuestions` list is empty.

A rule that fails produces a **gap**: the unit, the rule, and the kind of source that would fill it.

## 7. Review views

`views/` is generated and never edited. A conforming toolchain MUST generate at least: a role and action table from
Cedar; diagrams of every machine from SCXML and every screen flow from IFML; plain-language invariants from Alloy
comments; a use-case document with its scenarios inline; and a coverage report listing every unit and its criterion.

## 8. Filling instructions

The manifest schema, and each schema in `schema/`, carries filling instructions on every field, in an `x-fill`
annotation keyword:

- `source`: where the value comes from (requester's material, research, another field, a decision).
- `method`: the thinking needed to fill it in.
- `dependsOn`: fields that must be filled first. Together these form the order in which a bundle is written.
- `doneWhen`: a check that says the field is complete.

JSON Schema ignores unknown keywords, so validators are unaffected. Authoring agents read them as their instructions.

## 9. Consumers

A consumer (a software factory, a team of agents, a human team) turns coverage units into its own acceptance
criteria. Annex A shows the mapping for a factory driven by acceptance criteria.

## 10. Extensions

A bundle MAY use layers and formats that this specification does not define. Each is named `x-<name>`, declared in
the manifest's `extensions` list with a version and a URL to its definition, and MUST define its coverage units and
readiness rules in the same way as section 5. The core readiness rules still apply. See
[docs/extending.md](docs/extending.md).

## 11. Tools

Each layer's validators, renderers and generators, and what they do not do, are listed in
[docs/tooling.md](docs/tooling.md). Where two formats cover a layer equally, this specification uses the one with
tools (decision 0013).

## Annex A (informative): mapping to a criteria-driven software factory

| What the factory needs | From the bundle |
|---|---|
| Stories with acceptance criteria | behaviour/stories, with criteria from linked scenarios and coverage units |
| A specification page for each deployable service | generated from product context, use cases and interfaces |
| Decisions with defaults and reasons | decisions, including builder-choice decisions |
| HTTP and message contracts | interfaces/http, interfaces/messages |
| Project principles | principles/engineering.yaml |
| Known facts and things never to do | product context constraints; safety profile |
| Product research context (category, audience, purpose, technologies, competitors) | product/context.yaml; technology decisions |
| The toolchain | technology decisions in principles/engineering.yaml |

A factory that reads only some formats needs an adapter that turns the coverage units of the others into criteria,
for example one criterion for every (operation, response status) pair of an OpenAPI document.

## Annex B: open questions for this draft

- The name of the standard (working name: System Spec).
- IFML tooling is old and Eclipse-based: confirm it can be validated from a command line, or define a JSON
  serialisation of the IFML metamodel.
- The SCXML and IFML namespaces for references (section 4) are provisional.
- Whether ISO 29148's outline can be followed without licensing its text.
