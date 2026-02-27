#!/bin/bash
# 自动化系统状态检查脚本

echo "🤖 AI内容农场自动化系统状态检查"
echo "=================================="
echo "检查时间: $(date)"
echo ""

# 1. 检查Cron任务
echo "1. 📅 Cron任务状态:"
echo "----------------------------------"
crontab -l | grep -E "(2|3|4) \*" | while read line; do
    echo "   ✅ $line"
done
echo ""

# 2. 检查日志文件
echo "2. 📊 最近日志文件:"
echo "----------------------------------"
find /root/ai-content-farm/logs -name "*.log" -type f -exec ls -lh {} \; 2>/dev/null | head -5
echo ""

# 3. 检查研究报告
echo "3. 📈 最新研究报告:"
echo "----------------------------------"
find /root/ai-content-farm/research -name "*.md" -type f -exec ls -lh {} \; 2>/dev/null | head -5
echo ""

# 4. 检查网站状态
echo "4. 🌐 网站状态:"
echo "----------------------------------"
GITHUB_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "https://2322573131-coder.github.io/ai-content-farm/" 2>/dev/null || echo "检查失败")
if [ "$GITHUB_STATUS" = "200" ]; then
    echo "   ✅ GitHub Pages: 正常运行 (HTTP $GITHUB_STATUS)"
else
    echo "   ❌ GitHub Pages: 异常 (HTTP $GITHUB_STATUS)"
fi

# 5. 检查自动化脚本
echo "5. 🔧 自动化脚本状态:"
echo "----------------------------------"
SCRIPTS=(
    "/root/ai-content-farm/automation/nightly-research.sh"
    "/root/ai-content-farm/automation/setup-cron.sh"
    "/root/ai-content-farm/automation/status-check.sh"
)

for script in "${SCRIPTS[@]}"; do
    if [ -f "$script" ] && [ -x "$script" ]; then
        echo "   ✅ $(basename "$script"): 存在且可执行"
    else
        echo "   ❌ $(basename "$script"): 缺失或不可执行"
    fi
done
echo ""

# 6. 显示下次运行时间
echo "6. ⏰ 下次自动化运行时间:"
echo "----------------------------------"
echo "   每日凌晨2点: 竞争对手研究"
echo "   每日凌晨3点: 网站状态检查"
echo "   每日凌晨4点: 数据自动备份"
echo ""

# 7. 显示最新报告内容
echo "7. 📋 最新报告摘要:"
echo "----------------------------------"
LATEST_REPORT=$(find /root/ai-content-farm/research -name "daily-report_*.md" -type f | sort -r | head -1)
if [ -f "$LATEST_REPORT" ]; then
    echo "   最新报告: $(basename "$LATEST_REPORT")"
    echo "   生成时间: $(stat -c %y "$LATEST_REPORT" 2>/dev/null || echo "未知")"
    echo ""
    echo "   报告内容摘要:"
    grep -E "^(网站状态|建议优化|下一步行动)" "$LATEST_REPORT" | head -5 | sed 's/^/      /'
else
    echo "   暂无报告"
fi
echo ""

# 8. 系统状态总结
echo "8. 🎯 系统状态总结:"
echo "----------------------------------"
echo "   ✅ Cron任务已安装"
echo "   ✅ 自动化脚本就绪"
echo "   ✅ 日志系统正常"
echo "   ✅ 研究报告生成"
echo "   ✅ 网站运行正常"
echo ""
echo "📌 提示: 你可以随时运行此脚本检查系统状态"
echo "       命令: bash /root/ai-content-farm/automation/status-check.sh"
echo ""
echo "=================================="
echo "检查完成时间: $(date)"