# 财税行业专项体检（dsh-industry-tax）

财税行业多出来的那几项：发票与会计凭证保存期、税务数据出境、发票抬头与税号校验，别等稽查才发现。

## 安装

```bash
dsh plugin --profile web add @deepwhale-cn/dsh-industry-tax
```

也可源码安装：`dsh plugin --profile web add github:feely0208/dsh-industry-tax`。

## 用法

```bash
dsh-tax ...   # （见下表规则）
```

用 CLI 或直接让 Agent 调用 `industry-tax` 技能：给一个项目目录，输出命中项、法规出处与修复建议。

## 判据

| 规则 | 查什么 |
|---|---|
| `TAX-ARCHIVE-RETENTION` | 会计凭证/账簿保存期低于 30 年（或财务报告未永久保存） |
| `TAX-INVOICE-TITLE` | 开票信息缺纳税人识别号或抬头与主体不一致 |
| `TAX-DATA-CROSS-BORDER` | 税务/财务数据出境未做安全评估或标准合同 |
| `TAX-E-INVOICE-VERIFY` | 电子发票未做验真/重复报销校验 |

## 说明

- 纯本地扫描，不上传代码与数据；
- 规则与出处公开在 `rules/`，可自行增删；
- 误报/漏报请提 Issue。
