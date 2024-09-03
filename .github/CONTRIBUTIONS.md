# Contribution Guide

Thank you for your interest in contributing to our project! We welcome contributions from the community and appreciate your efforts to help improve our codebase. To ensure a smooth collaboration process, please follow the guidelines outlined below.

## Testing

Tests are written using [bashunit](https://bashunit.typeddevs.com/).

To install the vendor dependencies, run:

```bash
./install-dependencies.sh
```

To run all tests, use the following command:

```bash
./lib/bashunit tests
```

Please make sure to write appropriate tests for any new features or bug fixes you introduce. Tests should be placed in the `tests` directory and follow the naming convention of `test_*.sh`.
