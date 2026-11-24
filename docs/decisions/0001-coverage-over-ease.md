---
status: accepted
date: 2026-11-24
decision-makers: Biosphere Labs
---

# Choose formats for coverage, not ease of learning

## Context and Problem Statement

People will not author bundles by hand: LLMs will, following published skills, and people will review generated views. A first draft that chose easy formats left too much to the imagination (maintainer feedback, 2026-11-24).

## Decision Drivers

* Coverage: the most that can be expressed precisely
* An existing open standard where one exists
* Written by LLMs with skills and reviewed by people, so ease of learning does not count
* Turns into countable, testable units

## Considered Options

* The most complete format for each layer
* The simplest format for each layer

## Decision Outcome

Chosen option: "The most complete format for each layer", because the authors are agents and reviewers see generated views.

### Consequences

* Overlap must be controlled by the one-home rule (P3)
* Every layer needs a generated review view

### Confirmation

The readiness rules in [SPEC.md](../SPEC.md) section 6 check this layer.

## Pros and Cons of the Options

### The most complete format for each layer

* Good, because less is left to the imagination
* Bad, because overlapping layers can contradict each other

### The simplest format for each layer

* Good, because people can read it
* Bad, because it leaves gaps that builders fill by guessing
