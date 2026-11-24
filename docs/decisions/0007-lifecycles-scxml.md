---
status: accepted
date: 2026-11-24
decision-makers: Biosphere Labs
---

# Use SCXML for lifecycles

## Context and Problem Statement

The bundle must say how things change over time and which changes are forbidden.

## Decision Drivers

* Coverage: the most that can be expressed precisely
* An existing open standard where one exists
* Written by LLMs with skills and reviewed by people, so ease of learning does not count
* Turns into countable, testable units

## Considered Options

* SCXML
* XState JSON
* A custom transition table

## Decision Outcome

Chosen option: "SCXML", because it is the most complete standard.

### Consequences

* Diagrams are generated for review

### Confirmation

The readiness rules in [SPEC.md](../SPEC.md) section 6 check this layer.

## Pros and Cons of the Options

### SCXML

* Good, because it is a W3C Recommendation with nested and parallel states, history and a data model
* Bad, because it is wordy XML

### XState JSON

* Bad, because it is not a formal standard and weak on Java

### A custom transition table

* Bad, because it is ours
