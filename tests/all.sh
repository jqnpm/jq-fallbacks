#!/usr/bin/env bash


fileUnderTest="${BASH_SOURCE%/*}/../jq/main.jq"


read -d '' fourLineTests <<-'EOF' || true
unlessNullFallback: Null returns string
null
unlessNullFallback("a"; "b")
"b"

unlessNullFallback: Zero returns string
0
unlessNullFallback("a"; "b")
"a"

unlessNullFallback: Object returns string
{}
unlessNullFallback("a"; "b")
"a"

unlessNullFallback: Null returns object
null
unlessNullFallback("a"; {})
{}

unlessNullFallback: String returns filter
"a"
unlessNullFallback(. + "!"; {})
"a!"

unlessNullFallback: null returns filter
null
unlessNullFallback("a"; . // "b")
"b"

ifNull: Null returns string
null
ifNull("a")
"a"

ifNull: Zero returns zero
0
ifNull("a")
0

ifNull: Object returns object
{}
ifNull("a")
{}

unlessNull: Null returns null
null
unlessNull("a")
null

unlessNull: Zero returns string
0
unlessNull("a")
"a"

unlessNull: Object returns string
{}
unlessNull("a")
"a"

nullAsObject: Object returns object
"a"
nullAsObject
"a"

nullAsObject: null returns object
null
nullAsObject
{}
EOF

function testAllFourLineTests () {
	echo "$fourLineTests" | runAllFourLineTests
}


# Run tests above automatically.
# Custom tests can be added by adding new function with a name that starts with "test": function testSomething () { some test code; }
source "${BASH_SOURCE%/*}/test-runner.sh"
