---
status: accepted
date: 2026-11-24
decision-makers: Biosphere Labs
---

# Use JSON Schema and Alloy 6 for the domain

## Context and Problem Statement

The bundle must say what the system is made of and which rules always hold.

## Decision Drivers

* Coverage: the most that can be expressed precisely
* An existing open standard where one exists
* Written by LLMs with skills and reviewed by people, so ease of learning does not count
* Turns into countable, testable units

## Considered Options

* JSON Schema plus Alloy 6
* JSON Schema plus EARS rules
* Context Mapper DSL

## Decision Outcome

Chosen option: "JSON Schema plus Alloy 6", because it adds an automatic consistency check to the data model.

### Consequences

* Types live only in JSON Schema; Alloy adds relations and rules

### Confirmation

The readiness rules in [SPEC.md](../SPEC.md) section 6 check this layer.

## Pros and Cons of the Options

### JSON Schema plus Alloy 6

* Good, because the Alloy Analyzer finds contradictions in the spec before building
* Good, because JSON Schema is shared with OpenAPI and AsyncAPI
* Bad, because Alloy tooling is Java only

### JSON Schema plus EARS rules

* Good, because simple
* Bad, because nothing checks the rules for consistency

### Context Mapper DSL

* Bad, because it leans into architecture
