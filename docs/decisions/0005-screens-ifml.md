---
status: accepted
date: 2026-11-24
decision-makers: Biosphere Labs
---

# Use IFML for screens and flows

## Context and Problem Statement

The bundle must describe screens, their states, events and navigation. Earlier we believed no standard existed; IFML (OMG) does.

## Decision Drivers

* Coverage: the most that can be expressed precisely
* An existing open standard where one exists
* Written by LLMs with skills and reviewed by people, so ease of learning does not count
* Turns into countable, testable units

## Considered Options

* IFML plus W3C design tokens plus WCAG 2.2
* A custom screen inventory
* Figma as the authority

## Decision Outcome

Chosen option: "IFML plus W3C design tokens plus WCAG 2.2", because it is the existing standard with the most coverage.

### Consequences

* Command-line validation of IFML is an open question (SPEC.md Annex B)

### Confirmation

The readiness rules in [SPEC.md](../SPEC.md) section 6 check this layer.

## Pros and Cons of the Options

### IFML plus W3C design tokens plus WCAG 2.2

* Good, because it is an OMG standard covering screens, events, actions, navigation and data binding
* Bad, because its tooling is old and Eclipse-based

### A custom screen inventory

* Bad, because it is ours to define and maintain

### Figma as the authority

* Bad, because it cannot be checked and ties the bundle to a vendor
