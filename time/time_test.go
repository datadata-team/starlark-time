package time

import (
	"testing"

	"go.starlark.net/starlark"
	"go.starlark.net/starlarktest"
	"go.starlark.net/syntax"
)

func TestTimeModule(t *testing.T) {
	assertModule, err := starlarktest.LoadAssertModule()
	if err != nil {
		t.Fatal(err)
	}

	var predeclared = starlark.StringDict{
		"time":   Module,
		"assert": assertModule["assert"],
	}

	var thread = &starlark.Thread{}

	starlarktest.SetReporter(thread, t)

	_, err = starlark.ExecFileOptions(syntax.LegacyFileOptions(), thread, "time.star", nil, predeclared)
	if err != nil {
		t.Fatal(err)
	}
}
