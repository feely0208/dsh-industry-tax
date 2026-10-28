# 财税行业专项体检（dsh-industry-tax）

**什么时候用**：给财税行业项目做上线前自查，或准备监管检查/测评材料时。用户会提到该行业特有的合规项（见下表）。

## 怎么用

```bash
<cli 路径> --root <项目目录>       # 检查一个项目
<cli 路径> --demo                  # 用内置样本看检出效果
<cli 路径> --list-rules            # 列出判据与出处
<cli 路径> --html report.html      # 出 HTML 报告
```

## 它查什么

| 规则 | 查什么 |
|---|---|
| `TAX-ARCHIVE-RETENTION` | 会计凭证/账簿保存期低于 30 年（或财务报告未永久保存） |
| `TAX-INVOICE-TITLE` | 开票信息缺纳税人识别号或抬头与主体不一致 |
| `TAX-DATA-CROSS-BORDER` | 税务/财务数据出境未做安全评估或标准合同 |
| `TAX-E-INVOICE-VERIFY` | 电子发票未做验真/重复报销校验 |

每条判据都带出处（法规名称与条款）与修复建议，报出时一并给出。
