curl https://js.adapools.org/pools/351a90a0253fb3595ccc460438b9947cd8a0b9a7f457f3478bbb31d8/summary.json 2>/dev/null \
| jq '.data | del(.group_basic, .id, .pool_id, .pool_id_bech32, .hist_roa, .hist_bpe, .tax_ratio_old, .tax_fix_old, .hash_id, .direct, .patreon, .handles, .icon, .db_description, .updated, .db_ticker, .db_name, .db_url, .ticker_orig, .pool_id)' \
| tr -d \"{},: \
| awk NF \
| sed -e 's/^[ \t]*/adapools_/' > /var/lib/prometheus/node-exporter/adapools.prom
