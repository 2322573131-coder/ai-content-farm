# AI工具库项目 - 技能使用指南

## 已安装技能列表

### 1. SEO审计技能 (seo-audit)
**用途**：审计网站SEO问题，提供优化建议
**触发词**：
- "SEO audit"
- "technical SEO" 
- "SEO issues"
- "on-page SEO"
- "meta tags review"

**应用场景**：
- 优化AI工具库网站的SEO
- 检查页面元标签和结构
- 分析关键词排名机会
- 提供SEO改进建议

### 2. 竞品分析技能 (competitor-analysis)
**用途**：分析竞争对手的SEO和GEO策略
**触发词**：
- "analyze competitors"
- "competitor SEO"
- "who ranks for"
- "competitive analysis"
- "what are my competitors doing"

**应用场景**：
- 分析Futurepedia、There's An AI For That等竞争对手
- 发现竞争对手的成功策略
- 识别市场机会和差距
- 制定超越竞争对手的计划

### 3. 联盟营销技能 (affiliate-marketing)
**用途**：设计和优化联盟营销计划
**触发词**：
- "affiliate program"
- "affiliate marketing"
- "affiliate partners"
- "referral commissions"
- "affiliate network"

**应用场景**：
- 设计AI工具联盟佣金计划
- 优化联盟链接和转化率
- 管理联盟合作伙伴
- 跟踪和分析联盟收入

### 4. 浏览器自动化技能 (browser-automation)
**用途**：网页测试、抓取和自动化交互
**触发词**：浏览器自动化相关任务

**应用场景**：
- 自动化收集竞争对手数据
- 测试网站功能和性能
- 监控价格和内容变化
- 自动化重复性网页任务

## 技能集成到自动化系统

### 每日自动化任务增强

**凌晨2点任务**（竞品研究）：
```bash
# 使用competitor-analysis技能分析Futurepedia
# 使用seo-audit技能检查我们网站的SEO状态
```

**凌晨3点任务**（网站监控）：
```bash
# 使用browser-automation技能测试网站功能
# 使用seo-audit技能检查SEO变化
```

**凌晨4点任务**（数据备份和优化）：
```bash
# 使用affiliate-marketing技能优化联盟链接
# 生成SEO和竞品分析报告
```

## 具体应用示例

### 示例1：全面竞品分析
```
触发：analyze competitors Futurepedia
技能：competitor-analysis
输出：
1. Futurepedia的关键词策略
2. 他们的内容优势和弱点
3. 技术SEO实现
4. 联盟营销方法
5. 我们的机会点
```

### 示例2：网站SEO审计
```
触发：SEO audit our AI tools website
技能：seo-audit
输出：
1. 页面SEO评分
2. 元标签优化建议
3. 内容结构改进
4. 技术SEO问题
5. 实施优先级
```

### 示例3：联盟计划优化
```
触发：optimize affiliate program for AI tools
技能：affiliate-marketing
输出：
1. 最佳佣金率建议
2. 联盟合作伙伴招募策略
3. 转化率优化技巧
4. 跟踪和分析方法
```

## 技能组合使用策略

### 阶段1：基础优化（本周）
1. **seo-audit** → 优化网站基础SEO
2. **competitor-analysis** → 分析3个主要竞争对手
3. **affiliate-marketing** → 设置基础联盟计划

### 阶段2：深度优化（下个月）
1. **competitor-analysis** + **seo-audit** → 深度竞品SEO分析
2. **browser-automation** → 自动化数据收集
3. **affiliate-marketing** → 优化联盟转化率

### 阶段3：持续优化（长期）
1. 每日自动运行竞品分析
2. 每周SEO审计和优化
3. 每月联盟计划评估和调整

## 预期效果

### SEO优化：
- 目标：3个月内自然搜索流量提升50%
- 使用技能：seo-audit, competitor-analysis

### 竞品分析：
- 目标：每月发现10个优化机会
- 使用技能：competitor-analysis, browser-automation

### 联盟收入：
- 目标：6个月内联盟收入达到$500/月
- 使用技能：affiliate-marketing

## 技能更新和维护

### 检查技能更新：
```bash
npx skills check
npx skills update
```

### 添加新技能：
```bash
# 搜索相关技能
npx skills find [关键词]

# 安装技能
npx skills add [owner/repo@skill] -g -y
```

### 技能目录：
```
~/.agents/skills/          # 全局技能安装目录
/root/.openclaw/workspace/skills/  # 工作区技能目录
```

## 注意事项

1. **安全风险**：所有技能都经过安全评估，但使用时仍需谨慎
2. **权限控制**：技能运行具有完整代理权限
3. **数据隐私**：避免在技能中使用敏感信息
4. **性能影响**：复杂技能可能消耗较多资源

## 支持资源

- 技能市场：https://skills.sh/
- SEO技能库：https://skills.sh/aaron-he-zhu/seo-geo-claude-skills
- 自动化技能：https://skills.sh/sickn33/antigravity-awesome-skills
- 营销技能：https://skills.sh/coreyhaines31/marketingskills

## 问题排查

### 技能未激活：
1. 检查是否正确使用触发词
2. 确认技能已正确安装
3. 查看技能目录是否存在

### 技能运行错误：
1. 检查技能依赖是否满足
2. 查看错误日志
3. 尝试重新安装技能

### 性能问题：
1. 限制同时运行的技能数量
2. 优化技能使用频率
3. 监控系统资源使用

---

**最后更新**：2026-02-27
**维护者**：小龙虾AI助手 🦞