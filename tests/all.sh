#!/usr/bin/env bash


fileUnderTest="${BASH_SOURCE%/*}/../jq/main.jq"


read -d '' fourLineTests <<-'EOF' || true
unlessNullFallback Null returns string
null
unlessNullFallback("a"; "b")
"b"

unlessNullFallback Zero returns string
0
unlessNullFallback("a"; "b")
"a"

unlessNullFallback Object returns string
{}
unlessNullFallback("a"; "b")
"a"

unlessNullFallback Null returns object
null
unlessNullFallback("a"; {})
{}

unlessNullFallback String returns filter
"a"
unlessNullFallback(. + "!"; {})
"a!"

unlessNullFallback null returns filter
null
unlessNullFallback("a"; . // "b")
"b"

ifNull Null returns string
null
ifNull("a")
"a"

ifNull Zero returns zero
0
ifNull("a")
0

ifNull Object returns object
{}
ifNull("a")
{}

unlessNull Null returns null
null
unlessNull("a")
null

unlessNull Zero returns string
0
unlessNull("a")
"a"

unlessNull Object returns string
{}
unlessNull("a")
"a"

nullAsObject Object returns object
"a"
nullAsObject
"a"

nullAsObject null returns object
null
nullAsObject
{}
EOF

# TODO: break out and reuse test harnesss.
function runAllFourLineTests () {
	DONE=false
	until $DONE;
	do
		local name
		local input
		local code
		local expected

		read name
		read input
		read code
		read expected

		local expectedPretty=$(echo "$expected" | jq '.')

		local output=$(echo "$input" | jq -f <(echo "$code" | cat "$fileUnderTest" -))

		assertEquals "$name" "$expectedPretty" "$output"

		read || DONE=true # Empty line between tests.
	done
}

# TODO: make each test a separate function recognizable to shUnit2?
function testAllFourLineTests () {
	echo "$fourLineTests" | runAllFourLineTests
}


source shunit2
