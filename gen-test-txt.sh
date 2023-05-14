#!/bin/bash

function get_chars()
{
	local count=$(getconf PAGE_SIZE)

	for f in $(seq $count); do
		echo -n $((f % 10))
	done
}

get_chars > test.txt
