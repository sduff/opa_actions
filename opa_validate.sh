#!/bin/sh

opa_output=$( opa eval --data policies/policy.rego --input example.tfplan.json --format pretty "data.confluent.deny" 2>&1 )
echo $opa_output

if [ "$opa_output" == "[]" ]; then
  # no deny, continue
  exit 0
else
  # deny, fail
  exit 1
fi

