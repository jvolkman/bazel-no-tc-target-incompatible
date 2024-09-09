See the target skipped by default:
```
bazel build //targets/...
```

See the target built if the toolchain is registered:
```
bazel build //targets/... --config=tc
```
