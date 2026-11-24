---
status: accepted
date: 2026-11-24
decision-makers: Biosphere Labs
---

# Use fully dressed use cases, Gherkin and stories for behaviour

## Context and Problem Statement

The bundle must say what users do, including everything that can go wrong.

## Decision Drivers

* Coverage: the most that can be expressed precisely
* An existing open standard where one exists
* Written by LLMs with skills and reviewed by people, so ease of learning does not count
* Turns into countable, testable units

## Considered Options

* Fully dressed use cases plus Gherkin plus stories
* User stories plus Gherkin
* Job stories plus Gherkin

## Decision Outcome

Chosen option: "Fully dressed use cases plus Gherkin plus stories", because asking "what can go wrong?" at every step finds edge cases systematically.

### Consequences

* schema/use-case.schema.json and schema/story.schema.json are defined here

### Confirmation

The readiness rules in [SPEC.md](../SPEC.md) section 6 check this layer.

## Pros and Cons of the Options

### Fully dressed use cases plus Gherkin plus stories

* Good, because every step is checked for extensions
* Good, because stories remain the slices builders deliver
* Bad, because use cases have no standard file format, so the schema is ours

### User stories plus Gherkin

* Good, because trackers know them
* Bad, because edge cases depend on the author remembering them

### Job stories plus Gherkin

* Good, because they capture the situation
* Bad, because they have the same gap as user stories
