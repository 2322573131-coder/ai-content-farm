#!/bin/bash
# 设置自动化Cron任务

echo "设置自动化Cron任务..."
echo "当前用户: $(whoami)"
echo "当前时间: $(date)"

# 创建Cron任务文件
CRON_FILE="/tmp/ai-content-farm-cron"

# 每天凌晨2点运行研究脚本
echo "0 2 * * * /root/ai-content-farm/automation/nightly-research.sh >> /root/ai-content-farm/logs/cron.log 2>&1" > $CRON_FILE

# 每天凌晨3点检查网站状态
echo "0 3 * * * curl -s -o /dev/null -w 'GitHub Pages: %{http_code} at %{time_total}s\n' 'https://2322573131-coder.github.io/ai-content-farm/' >> /root/ai-content-farm/logs/status.log" >> $CRON_FILE

# 每天凌晨4点备份数据
echo "0 4 * * * cd /root/ai-content-farm && git add . && git commit -m '每日自动备份: $(date)' && git push >> /root/ai-content-farm/logs/backup.log 2>&1" >> $CRON_FILE

# 显示Cron任务
echo "=== 计划设置的Cron任务 ==="
cat $CRON_FILE
echo "=========================="

# 提示用户如何安装
echo ""
echo "要安装这些Cron任务，请运行:"
echo "crontab $CRON_FILE"
echo ""
echo "要查看当前Cron任务:"
echo "crontab -l"
echo ""
echo "要编辑Cron任务:"
echo "crontab -e"

# 创建必要的目录
mkdir -p /root/ai-content-farm/logs
mkdir -p /root/ai-content-farm/backups

echo "Cron任务设置完成！"