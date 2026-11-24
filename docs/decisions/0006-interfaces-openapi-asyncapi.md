---
status: accepted
date: 2026-11-24
decision-makers: Biosphere Labs
---

# Use OpenAPI 3.1 and AsyncAPI 3 for HTTP and messages

## Context and Problem Statement

The bundle must define every request and every message, whatever transport the customer chooses.

## Decision Drivers

* Coverage: the most that can be expressed precisely
* An existing open standard where one exists
* Written by LLMs with skills and reviewed by people, so ease of learning does not count
* Turns into countable, testable units

## Considered Options

* OpenAPI 3.1 plus AsyncAPI 3

## Decision Outcome

Chosen option: "OpenAPI 3.1 plus AsyncAPI 3", because they are the standards and were accepted from the start.

### Consequences

* Consumers that read only OpenAPI need an adapter for AsyncAPI

### Confirmation

The readiness rules in [SPEC.md](../SPEC.md) section 6 check this layer.

## Pros and Cons of the Options

### OpenAPI 3.1 plus AsyncAPI 3

* Good, because both are the established standards and share JSON Schema
* Good, because AsyncAPI covers Kafka, AMQP, MQTT, WebSocket and webhooks
