#!/bin/bash
# 双向验证：正例必须报，反例必须不报
set -uo pipefail
export PATH="/usr/local/bin:$PATH"
cd "$(dirname "$0")/.."
PASS=0; FAIL=0
ok(){ echo "  ✅ $1"; PASS=$((PASS+1)); }
bad(){ echo "  ❌ $1"; FAIL=$((FAIL+1)); }
RULES="TAX-ARCHIVE-RETENTION TAX-INVOICE-TITLE TAX-DATA-CROSS-BORDER TAX-E-INVOICE-VERIFY"
echo ""; echo "  $(node -p "require('./package.json').name") · 双向验证"
J=$(node bin/cli.mjs --root tests/fixtures/fail/demo-project --json 2>&1)
for rid in $RULES; do
  c=$(echo "$J" | python3 -c "
import json,sys
try:
    d=json.load(sys.stdin); print(len([f for f in d.get('findings',[]) if f.get('ruleId')=='$rid']))
except Exception: print(0)" 2>/dev/null)
  [ "${c:-0}" -gt 0 ] && ok "$rid 报出（$c 处）" || bad "$rid 未报出"
done
M=$(node bin/cli.mjs --root tests/fixtures/pass/clean-project --json 2>&1 | python3 -c "
import json,sys
try: print(len(json.load(sys.stdin).get('findings',[])))
except Exception: print(-1)" 2>/dev/null)
[ "${M:-1}" = "0" ] && ok "干净样本 0 命中" || bad "干净样本误报 $M 条"
echo "  ────────────────────────────────────────"
echo "  通过 $PASS · 失败 $FAIL"
[ "$FAIL" -eq 0 ]
