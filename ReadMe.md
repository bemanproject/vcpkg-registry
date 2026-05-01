# Beman Registry

This is the Beman Project's vcpkg registry

## Using the registry

The typical way to use a vcpkg registry is to add it to the package manifest,
see the [vcpkg documentation](https://learn.microsoft.com/en-us/vcpkg/concepts/manifest-mode)
on manifest mode for more details. Ordinary usage of the Beman Project's
registry would look like:

```jsonc
{
  "default-registry": { /* ... */ },
  "registries": [
    {
      "kind": "git",
      "repository": "https://github.com/bemanproject/vcpkg-registry",
      "baseline": "...",
      "packages": [ "beman-*" ]
    }
  ],
  "overlay-ports": [ /* ... */ ]
}
```

This would provide any ports prefixed with `beman-` from the Beman registry
when requested by a project. The Beman registry is self-sufficent and does
not rely on the vcpkg built-in registry, so can also be used directly as
a default registry if desired.

## Adding / Updating a port

This is handled automatically by the `reusable-beman-vcpkg-release.yml` workflow in
https://github.com/bemanproject/infra-workflows, which triggers when a new release is
created.
