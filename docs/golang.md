# Golang Conventions

[Effective Go](https://golang.org/doc/effective_go.html)

[CodeReviewComments](https://code.google.com/p/go-wiki/wiki/CodeReviewComments)

## Reduce the scope of variables where possible

See [#1](https://golang.org/doc/effective_go.html#if)

Do this

```go
if err := doSomething(); err != nil {
   return err
}
```

Instead of this:

```go
err := doSomething()
if err != nil {
   return err
}
```

## Indent Error Flow

See [#1](https://golang.org/doc/effective_go.html#if), [#2](https://github.com/golang/go/wiki/CodeReviewComments#indent-error-flow)

Prefer

```go
if err != nil {
 // error handling
 return // or continue, etc.
}
// normal code
```

Over

```go
if err != nil {
 // error handling
} else {
 // normal code
}
```

### Naming

* `CamelCase` or `camelCase`, not `CAMEL_CASE`

* Follow [Initialisms](https://github.com/golang/go/wiki/CodeReviewComments#initialisms)

* `err` not, `someerr`
* `some.package` not `somePackage`
* `a` not `aString`  
* `http.Response` not `HttpResponse` See [#1](https://golang.org/doc/effective_go.html#package-names)
* `i` not `sliceIndex`,  `c` not `lineCount` See [#1](https://github.com/golang/go/wiki/CodeReviewComments#variable-names) and [Keep names short](https://about.sourcegraph.com/handbook/engineering/go_style_guide#keep-names-short)
* `total, scaled Vector` over `tVec, sVec Vector`. See [Make names meaningful](https://about.sourcegraph.com/handbook/engineering/go_style_guide#make-names-meaningful)
* `add(v Vector)` not `addAllVecs()` see [Use pronounceable names](https://about.sourcegraph.com/handbook/engineering/go_style_guide#use-pronounceable-names)

### Whitespace

#### Use new lines intentionally

If we revisit the recommended organization, we can also see the usage of new lines. Newlines are something we kind of pepper in our code without really thinking about it. However, they can be really powerful signals. I recommend that you treat them like paragraph breaks – if you don’t use any at all, your reader is lost. If you use them too much, your message is fragmented. They can help guide the user to where the logical components are.

Be intentional with them!

```go
a, b := Vector{1, 2, 3}, Vector{4, 5, 6}
a, b := swap(a, b)

c := Vector{7, 8, 9}
total := add([]Vector(a, b, c))...)
```

### Logging

#### Don't use `fmt.Println` for logging

```go
  log "github.com/sirupsen/logrus"
```

### Error Handling

#### Wrap errors rather than logging and returning

Instead of:

```go
if err != nil {
  log.Tracef("An error occured during operation x: %v", err)
  return err
}
```

Do:

```go
if err != nil {
  return fmt.Errorf("error occured during operation x: %v", err)
}
```

#### Lowercase error statements

Instead of

```go
if err != nil {
  return fmt.Errorf("Error occured during operation x: %v", err)
}
```

Do:

```go
if err != nil {
  return fmt.Errorf("error occured during operation x: %v", err)
}
```

When multiple errors are chained and wrapped, uppercasing creates messages like:

`operation z Error occured during operation x`
