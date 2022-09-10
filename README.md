# What the Pack!?

This is a Bedrock behavior pack, resource pack, and world template that
intentionally doesn't make much sense. New content comes often at the
moment.

## Installing

Check out the releases page for precompressed addon files, which you can
import directly into your game (can't be done on consoles).

Or, if you want, generate it from a branch or tag of your choice by running
`Package.ps1` (you may need to allow scripts to run on your machine first):

```pwsh
# Generate the default configuration (everything)
.\Package.ps1

# Generate with only the specified components
# (this command is equivilent to the above command)
.\Package.ps1 -Build Resources,Behavior,WorldTemplate
# => what.mcaddon
# |- => resource pack (Resources)
# |- => behavior pack (Behavior; depends on Resources)
# \- => world template (WorldTemplate; depends on Behavior and Resources)

# Generate individual pack files (can be combined with -Build)
.\Package.ps1 -Individual
# => what-behavior.mcpack
# => what-resources.mcpack
# => what-world-template.mctemplate

```
