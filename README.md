# Log Builder

Calendar application for maintaining TODO lists in markdown format.

## Tech Stack

- _Just_ **Ruby**

## Packaging

### Download Requirements

- [Ruby Packer](https://github.com/ericbeland/ruby-packer)

### Complile from Source

- `$ ./build_package`

## TODOs

- [ ] Add configuration examples to README.
- [ ] Overwrite same-named tags for a day.
- [x] Bundle program as executable package.
- [ ] Output to CWD unless explicitly specified.
- [ ] Warn of duplicate keys in YAML.
- [ ] Add begin/rescue blacks to all YAML-related methods.
  - [ ] Warn user of improper configuration.
  - [ ] Do not stop running on improper configuration.
- [ ] Validate inputs to `add_task_service`.
- [ ] Reconsider naming on methods in `add_task_service`.
