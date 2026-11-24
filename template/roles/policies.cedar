// Default is deny. Every policy has an id and names the use-case steps that need it.
@id("POL-owner-views-item")
@spec_refs("UC-1.1")
permit (principal, action == Action::"ACT-view-item", resource)
when { resource.owner == principal };
