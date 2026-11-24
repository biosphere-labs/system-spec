---
status: accepted
date: 2026-11-24
decision-makers: Biosphere Labs
---

# Describe outside systems by contract, C4 context and failure behaviour

## Context and Problem Statement

The bundle must say which outside systems the system uses and what happens when they fail.

## Decision Drivers

* Coverage: the most that can be expressed precisely
* An existing open standard where one exists
* Written by LLMs with skills and reviewed by people, so ease of learning does not count
* Turns into countable, testable units

## Considered Options

* Contracts plus C4 context plus failure behaviour
* C4 context only
* Backstage entities

## Decision Outcome

Chosen option: "Contracts plus C4 context plus failure behaviour", because failure behaviour is what builders most often guess.

### Consequences

* schema/external-system.schema.json is defined here

### Confirmation

The readiness rules in [SPEC.md](../SPEC.md) section 6 check this layer.

## Pros and Cons of the Options

### Contracts plus C4 context plus failure behaviour

* Good, because builders can mock against the contracts and do not guess failure handling

### C4 context only

* Bad, because there is no contract detail

### Backstage entities

* Bad, because they describe what exists, not intent
