---
status: accepted
date: 2026-11-24
decision-makers: Biosphere Labs
---

# Use ISO 25010:2023, SEI scenarios and OpenSLO for quality

## Context and Problem Statement

The bundle must say how well the system works, in numbers.

## Decision Drivers

* Coverage: the most that can be expressed precisely
* An existing open standard where one exists
* Written by LLMs with skills and reviewed by people, so ease of learning does not count
* Turns into countable, testable units

## Considered Options

* All three together
* 25010 with EARS sentences
* OpenSLO only

## Decision Outcome

Chosen option: "All three together", because together they cover what to ask, how to answer, and how to measure in production.

### Consequences

* schema/quality-scenario.schema.json is defined here

### Confirmation

The readiness rules in [SPEC.md](../SPEC.md) section 6 check this layer.

## Pros and Cons of the Options

### All three together

* Good, because 25010 says what to ask, SEI scenarios make each answer testable, and OpenSLO makes runtime targets machine-readable
* Bad, because three formats

### 25010 with EARS sentences

* Bad, because measures tend to be left out

### OpenSLO only

* Bad, because it covers only runtime qualities
