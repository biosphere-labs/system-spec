---
status: accepted
date: 2026-11-24
decision-makers: Biosphere Labs
---

# Combine project-constitution sections, arc42 and technology decisions

## Context and Problem Statement

Builders need the engineering rules and the technology choices, fixed or left open.

## Decision Drivers

* Coverage: the most that can be expressed precisely
* An existing open standard where one exists
* Written by LLMs with skills and reviewed by people, so ease of learning does not count
* Turns into countable, testable units

## Considered Options

* Constitution sections plus arc42 sections 2 and 8 plus a decision per technology
* Named profiles only
* Spec Kit constitution

## Decision Outcome

Chosen option: "Constitution sections plus arc42 sections 2 and 8 plus a decision per technology", because it covers both the rules and the stack.

### Consequences

* schema/engineering-principles.schema.json is defined here

### Confirmation

The readiness rules in [SPEC.md](../SPEC.md) section 6 check this layer.

## Pros and Cons of the Options

### Constitution sections plus arc42 sections 2 and 8 plus a decision per technology

* Good, because the seven sections (constraints, cross-cutting concepts, code quality, testing, error handling, security practice, governance) are what agent builders read as project rules
* Good, because it covers rules and stack

### Named profiles only

* Bad, because loose

### Spec Kit constitution

* Bad, because its sections cover less than the seven-section constitution used here
