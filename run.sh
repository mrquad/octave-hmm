#!/bin/bash

set -e

octave EM_hmm_skips_1gau.m && cp hmm_with_skips_with_prob2200.mat /root/shared/results/
