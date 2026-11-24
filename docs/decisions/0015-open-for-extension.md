---
status: accepted
date: 2026-11-24
decision-makers: Biosphere Labs
---

# Make the standard open for extension

## Context and Problem Statement

No single team can foresee every layer (for example machine-learning model cards, data retention, hardware). People must be able to add layers without forking.

## Considered Options

* Namespaced extensions declared in the manifest
* Forks
* A closed list of layers

## Decision Outcome

Chosen option: "Namespaced extensions declared in the manifest", because it lets anyone add a layer today and gives a path into the core.

### Consequences

* docs/extending.md describes the rules
* Layers and formats named x-… are accepted by the manifest schema

## Pros and Cons of the Options

### Namespaced extensions declared in the manifest

* Good, because a bundle stays valid against the core schema
* Good, because a popular extension can be promoted into the core by a decision record

### Forks

* Bad, because bundles stop being exchangeable

### A closed list of layers

* Bad, because teams give up and build their own
