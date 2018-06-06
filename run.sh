#!/bin/ash

set -e

octave --eval "Recurrent_EM_hmm_skips_1gau($1, $2)" && cp hmm_with_skips_with_prob_total-2000_init-100.mat /root/shared/results/
