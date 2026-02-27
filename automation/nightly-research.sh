#!/bin/bash
# 夜间自动化研究脚本
# 每天凌晨2点自动运行

set -e

LOG_DIR="/root/ai-content-farm/logs"
RESEARCH_DIR="/root/ai-content-farm/research"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# 创建目录
mkdir -p "$LOG_DIR"
mkdir -p "$RESEARCH_DIR"

# 开始日志
echo "=== 夜间自动化研究开始: $(date) ===" | tee "$LOG_DIR/nightly-research_$TIMESTAMP.log"

# 1. 分析竞争对手网站
echo "1. 分析竞争对手网站..." | tee -a "$LOG_DIR/nightly-research_$TIMESTAMP.log"

# Futurepedia分析
echo "分析Futurepedia..." | tee -a "$LOG_DIR/nightly-research_$TIMESTAMP.log"
curl -s "https://www.futurepedia.io/" | grep -o '<title>[^<]*</title>' | tee -a "$RESEARCH_DIR/futurepedia_$TIMESTAMP.txt"

# There's An AI For That分析
echo "分析There's An AI For That..." | tee -a "$LOG_DIR/nightly-research_$TIMESTAMP.log"
curl -s "https://theresanaiforthat.com/" | grep -o '<title>[^<]*</title>' | tee -a "$RESEARCH_DIR/theresanaiforthat_$TIMESTAMP.txt"

# 2. 检查我们的网站状态
echo "2. 检查我们的网站状态..." | tee -a "$LOG_DIR/nightly-research_$TIMESTAMP.log"

# GitHub Pages状态
GITHUB_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "https://2322573131-coder.github.io/ai-content-farm/")
echo "GitHub Pages状态: $GITHUB_STATUS" | tee -a "$LOG_DIR/nightly-research_$TIMESTAMP.log"

# 本地服务器状态
LOCAL_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:8083/" 2>/dev/null || echo "未运行")
echo "本地服务器状态: $LOCAL_STATUS" | tee -a "$LOG_DIR/nightly-research_$TIMESTAMP.log"

# 3. 生成每日报告
echo "3. 生成每日报告..." | tee -a "$LOG_DIR/nightly-research_$TIMESTAMP.log"

REPORT_FILE="$RESEARCH_DIR/daily-report_$(date +%Y-%m-%d).md"
cat > "$REPORT_FILE" << EOF
# 每日自动化报告
## 日期: $(date +"%Y年%m月%d日")

## 网站状态
- GitHub Pages: $GITHUB_STATUS
- 本地服务器: $LOCAL_STATUS

## 竞争对手分析
### Futurepedia
- 标题: $(curl -s "https://www.futurepedia.io/" | grep -o '<title>[^<]*</title>' | sed 's/<title>//;s/<\/title>//')

### There's An AI For That
- 标题: $(curl -s "https://theresanaiforthat.com/" | grep -o '<title>[^<]*</title>' | sed 's/<title>//;s/<\/title>//')

## 建议优化
基于今日分析，建议：
1. 检查网站加载速度
2. 更新AI工具信息
3. 优化SEO元标签
4. 测试移动端体验

## 下一步行动
1. 添加新的AI工具
2. 优化搜索功能
3. 更新内容新鲜度
4. 检查联盟链接

## 自动化任务完成
报告生成时间: $(date)
EOF

echo "报告已生成: $REPORT_FILE" | tee -a "$LOG_DIR/nightly-research_$TIMESTAMP.log"

# 4. 发送通知（如果需要）
echo "4. 准备发送通知..." | tee -a "$LOG_DIR/nightly-research_$TIMESTAMP.log"

# 这里可以集成钉钉、微信等通知
NOTIFICATION_FILE="$LOG_DIR/notification_$TIMESTAMP.txt"
cat > "$NOTIFICATION_FILE" << EOF
主题: 夜间自动化研究完成
时间: $(date)

任务完成情况:
1. 竞争对手分析 ✓
2. 网站状态检查 ✓
3. 每日报告生成 ✓

详细报告请查看:
$REPORT_FILE

日志文件:
$LOG_DIR/nightly-research_$TIMESTAMP.log
EOF

echo "=== 夜间自动化研究完成: $(date) ===" | tee -a "$LOG_DIR/nightly-research_$TIMESTAMP.log"
echo "总运行时间: $SECONDS 秒" | tee -a "$LOG_DIR/nightly-research_$TIMESTAMP.log"

# 设置文件权限
chmod -R 755 "$LOG_DIR"
chmod -R 755 "$RESEARCH_DIR"

exit 0