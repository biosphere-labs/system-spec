---
status: accepted
date: 2026-11-24
decision-makers: Biosphere Labs
---

# Prefer formats that come with tools, and say what the tools cannot do

## Context and Problem Statement

A standard is adopted when people can validate, render and generate from it on the day they find it. Coverage alone (decision 0001) could pick a format nobody can check.

## Considered Options

* Coverage first, tools as a qualification
* Tools first, coverage second
* Ignore tools

## Decision Outcome

Chosen option: "Coverage first, tools as a qualification", because where two formats cover a layer equally, the one with tools wins, and where the most complete format has weak tools, its tools are listed with what they do not do (docs/tooling.md).

### Consequences

* Every layer lists its tools in docs/tooling.md
* A weak-tool layer (IFML) carries a qualification and an open question

## Pros and Cons of the Options

### Coverage first, tools as a qualification

* Good, because the most complete format is kept
* Good, because readers know what is and is not automated

### Tools first, coverage second

* Bad, because layers lose expressiveness to tool fashion

### Ignore tools

* Bad, because adoption suffers and readiness cannot be checked
