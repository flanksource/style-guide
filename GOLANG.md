## Golang Conventions



[Effective Go](https://golang.org/doc/effective_go.html)

[CodeReviewComments](https://code.google.com/p/go-wiki/wiki/CodeReviewComments)



#### Reduce the scope of variables where possible

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



#### Indent Error Flow

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

CamelCase or camelCase, not CAMEL_CASE

- [Initialisms](https://github.com/golang/go/wiki/CodeReviewComments#initialisms)

err not, someerr

#### Don't include the type in the name

Prefer

```go
var a string
```

over

```go
var aString string
```



#### Don't include the package in the name

See [#1](https://golang.org/doc/effective_go.html#package-names)

Prefer

```go
package http
type Response struct
```

over

```go
package http
type HttpResponse struct
```



#### Keep names short

See [#1](https://github.com/golang/go/wiki/CodeReviewComments#variable-names)

Prefer `c` to `lineCount`. Prefer `i` to `sliceIndex`.

Go [already encourages short variable names](https://github.com/golang/go/wiki/CodeReviewComments#variable-names).

In addition, short names:

- Are faster to listen to (and read)
- Are easier to navigate around
- Are less effort to type

In the above example, you might think that the names `vectorA` and `vectorB` are good because you’re putting context inside the name itself. That way, there’s no confusion / ambiguity when the variables are referred to elsewhere. However, this is redundant / not necessary if you’re following the [group code blocks logically](https://about.sourcegraph.com/handbook/engineering/go_style_guide#group-code-blocks-logically) advice above.

#### Make names meaningful

Prefer

```go
var total, scaled Vector
```

over

```go
var tVec, sVec Vector
```

Using meaningful names reduces the amount of work that a person has to do to understand what’s going on in your code. More concretely:

- They don’t have to keep as much context in their head about what that variable does.
- They don’t have to jump around to find definitions, usage, etc…
- It can also help distinguish important variables from temporary placeholders

Whenever possible, prefer meaningful names over explanatory comments. Comments are an extra thing to navigate around, and they don’t actually reduce the amount of jumping around the codebase that you’ll need to do when the variables are used later on.

#### Use pronounceable names

Prefer

```go
var total Vector
func add(...)
```

over

```go
var tVec Vector
var addAllVecs(...)
```

Pronounceable names:

- Screen readers can read actually read them
- Takes less time than pronouncing a string of letters

[You should watch this short YouTube video of @juliaferraioli navigating some Go code with a screenreader.](https://www.youtube.com/watch?v=xwjvufcJK-Q)

Now, something you may have noticed during the demo, is how screen readers handle variable names. It’s rough, right?

[@juliaferraioli](https://twitter.com/juliaferraioli) shared an anecdote about how she spent about 15 minutes scratching her head during a code review the other day, wondering what “gee-thub” was, before she realized that it was reading “GitHub”.

So make sure you use pronounceable names. Don’t make up words. Think of how they would be spoken. **Avoid concatenated variable names when possible.** Various screen readers won’t necessarily make it clear that the variable name is one word.



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