# Extending System Spec

System Spec cannot foresee every kind of system. You can add a layer or a format without forking (decision 0015).

## Add an extension to a bundle

1. Choose a name starting with `x-`, for example `x-model-card` for machine-learning model documentation.
2. Prefer an existing format with tools (decision 0013). Define a JSON Schema only if none exists.
3. Write the extension's definition, in the same shape as a layer in SPEC.md section 5:
   - the question the layer answers;
   - the format and its version;
   - what files MUST contain;
   - its **coverage units** and identifier prefix (start it with `X`, for example `XMC-`);
   - its readiness rules;
   - its review view.
4. Publish the definition at a stable URL.
5. In the bundle's `system.spec.yaml`, add it to `extensions` with its id, version and URL, and list its files with
   `layer: x-…` and `format: x-…`. The core manifest schema accepts these.

The core readiness rules still apply to extension files: unique identifiers, resolving references, one home per fact,
evidence for every unit.

## Propose an extension for the core

Open a pull request that adds a decision record in `docs/decisions/` (MADR 4) explaining the question the layer
answers, the options considered and why the chosen format wins, plus the extension's definition. Extensions in use by
more than one team are the best candidates.

## Replace a format

The same route: a decision record that supersedes the existing one. Say what the new format covers that the old one
did not, and what its tools are.
