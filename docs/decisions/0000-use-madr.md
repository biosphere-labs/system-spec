---
status: accepted
date: 2026-11-24
decision-makers: Biosphere Labs
---

# Use MADR 4 for this standard's own decisions

## Context and Problem Statement

The standard needs to record why each layer uses its format, in a way readers already know.

## Decision Drivers

* Dogfooding: the standard uses its own decision format

## Considered Options

* MADR 4
* Free-form notes

## Decision Outcome

Chosen option: "MADR 4", because the standard should record its decisions with the format it uses for decisions.

### Consequences

* Every later choice gets a record like this one

### Confirmation

The readiness rules in [SPEC.md](../SPEC.md) section 6 check this layer.

## Pros and Cons of the Options

### MADR 4

* Good, because it is the format layer 9 uses
* Good, because it records the options considered

### Free-form notes

* Bad, because the reasons are lost
