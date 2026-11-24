---
status: accepted
date: 2026-11-24
decision-makers: Biosphere Labs
---

# Use ASVS, WCAG, misuse cases and Open Threat Model for what must never happen

## Context and Problem Statement

The bundle must say what the system must never do.

## Decision Drivers

* Coverage: the most that can be expressed precisely
* An existing open standard where one exists
* Written by LLMs with skills and reviewed by people, so ease of learning does not count
* Turns into countable, testable units

## Considered Options

* Requirement IDs from ASVS 5 and WCAG 2.2, plus misuse cases, plus an OTM threat model
* EARS unwanted-behaviour sentences only
* Misuse cases only

## Decision Outcome

Chosen option: "Requirement IDs from ASVS 5 and WCAG 2.2, plus misuse cases, plus an OTM threat model", because it has the most coverage and the IDs make coverage checkable.

### Consequences

* Choosing the levels is a decision in each bundle

### Confirmation

The readiness rules in [SPEC.md](../SPEC.md) section 6 check this layer.

## Pros and Cons of the Options

### Requirement IDs from ASVS 5 and WCAG 2.2, plus misuse cases, plus an OTM threat model

* Good, because one line brings in hundreds of existing testable requirements
* Good, because the threat model covers attacks

### EARS unwanted-behaviour sentences only

* Bad, because everything is written by hand

### Misuse cases only

* Bad, because only security
