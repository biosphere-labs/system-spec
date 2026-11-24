# Instructions for agents

You are writing, extending or reviewing a **System Spec bundle**: a complete, implementation-neutral specification of
one software system, made of files in existing standard formats. Read [SPEC.md](SPEC.md) first; it is normative.
This file tells you how to work.

## Your goal

Produce a bundle that a builder can implement **without asking a question**. Two independent builders given only the
bundle should produce systems whose observable behaviour differs only where a `builder-choice` decision allows it.

## Rules you must follow

1. **Never guess.** When the requester's material, research or a decision does not answer something, add it to
   `openQuestions` in `system.spec.yaml`, naming the units it blocks. A bundle with open questions is not ready, and
   that is the correct outcome.
2. **Cite.** Every coverage unit traces to a quoted source passage, a research finding with its source, or a decision
   record (`ADR-nnnn`).
3. **One home per fact.** Define each fact once, in the file SPEC.md section 5 assigns it to. Elsewhere, refer to it
   by identifier (SPEC.md section 4). Never copy a type, a transition or a permission into a second file.
4. **What, not how.** Describe what can be observed from outside the system. Do not choose modules, classes, libraries
   or storage unless the requester fixed them; then record the constraint as a decision.
5. **Mark open choices.** If something may be left to the builder, write a decision with `status: builder-choice`
   and the constraints the builder's choice must satisfy.
6. **Use the filling instructions.** Every field in `schema/*.schema.json` has an `x-fill` annotation:
   `source` (where the value comes from), `method` (how to work it out), `dependsOn` (what to fill first) and
   `doneWhen` (how to tell it is complete). Follow them.
7. **Validate as you go** with the tools in [docs/tooling.md](docs/tooling.md).

## Order of work

The `dependsOn` annotations define the order. In outline:

1. `product/context.yaml`: purpose, scope, users, stakeholders, comparable products.
2. `principles/engineering.yaml` and technology decisions: what is fixed, what is the builder's choice.
3. `domain/`: glossary, JSON Schemas, Alloy model. Run the Alloy Analyzer.
4. `roles/`: Cedar schema, then policies.
5. `behaviour/use-cases/`: for every step, ask what can go wrong (invalid input, no permission, an outside system
   fails, the data changed meanwhile, the actor gives up) and write an extension or the reason it cannot happen.
6. `lifecycles/`: one SCXML machine for each thing whose behaviour depends on its history.
7. `interfaces/`: screens (IFML), HTTP (OpenAPI), messages (AsyncAPI), design tokens.
8. `external/`: each outside system's contract and failure behaviour.
9. `quality/` and `safety/`: a scenario with a number for each ISO 25010 characteristic; ASVS and WCAG levels;
   misuse cases; the threat model.
10. `behaviour/features/` and `behaviour/stories/`: Gherkin for every flow and extension; stories that slice the steps.
11. `system.spec.yaml`: list every file; check the readiness rules (SPEC.md section 6); report every gap.

Work in passes. A later layer often reveals a question about an earlier one: record it and go back.

## When you review a bundle

Check the readiness rules one by one and report each failure as: the unit, the rule, and the kind of source that would
fill it. Do not fix a gap by inventing an answer.
