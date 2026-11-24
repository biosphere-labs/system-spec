---
status: accepted
date: 2026-11-24
decision-makers: Biosphere Labs
---

# Use Cedar for roles and permissions

## Context and Problem Statement

The bundle must say who may do what, including conditions such as "own records only".

## Decision Drivers

* Coverage: the most that can be expressed precisely
* An existing open standard where one exists
* Written by LLMs with skills and reviewed by people, so ease of learning does not count
* Turns into countable, testable units

## Considered Options

* Cedar schema and policies
* A role by action table in YAML
* OpenAPI security scopes

## Decision Outcome

Chosen option: "Cedar schema and policies", because it has the most coverage and can be checked automatically.

### Consequences

* A table view is generated for review

### Confirmation

The readiness rules in [SPEC.md](../SPEC.md) section 6 check this layer.

## Pros and Cons of the Options

### Cedar schema and policies

* Good, because it covers role- and attribute-based rules and has a formal schema
* Good, because policies can be analysed automatically
* Bad, because readers need a generated table

### A role by action table in YAML

* Good, because it is easy to read
* Bad, because it cannot express conditions

### OpenAPI security scopes

* Good, because it reuses OpenAPI
* Bad, because it covers only the HTTP API
