import { createPlugin, pkgRootFrom } from '@deepwhale-cn/dsh-guard-core/plugin';

export const { name, inject, apply } = createPlugin({
  name: 'industry-tax',
  pkgRoot: pkgRootFrom(import.meta.url),
  skillFile: 'skill/industry-tax.md',
  binFile: 'bin/cli.mjs',
  description: '财税行业多出来的那几项：发票与会计凭证保存期、税务数据出境、发票抬头与税号校验，别等稽查才发现',
  whenToUse: '财税行业多出来的那几项：发票与会计凭证保存期、税务数据出境、发票抬头与税号校验，别等稽查才发现。',
});
