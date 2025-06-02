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

The Beman registry is a standard vcpkg registy, thus adding a port requires
the standard steps documented in [the vcpkg maintainer guide](https://learn.microsoft.com/en-us/vcpkg/contributing/maintainer-guide).

The Python script `update_port.py` handles some of the monotenous work of
updating version numbers and SHA512 hashes, and when used in conjuction with
the `vcpkg x-add-version` script for managing the version database can be
used to quickly update ports.

However these are presented without further commentary, it is not intended for
those unfamiliar with vcpkg registry maintenance to update ports at this time.

## Note for maintainers

Beman project uses it own fork of the `vcpkg-cmake*` host dependencies to allow
it to stand alone as a default registry. These are vendored under
`beman-cmake-tools`. Generally speaking these mirror the functions of
`vcpkg-cmake` and `vcpkg-cmake-config` exactly, except renamed to
`beman_cmake_*`.
