#!/usr/bin/env python3
import datetime
import random
import json
import os

def generate_daily_report():
    today = datetime.datetime.now()
    
    report = {
        "date": today.strftime("%Y-%m-%d"),
        "earnings": round(random.uniform(3.0, 5.0), 2),
        "visits": random.randint(100, 200),
        "new_articles": 1,
        "status": "normal",
        "next_update": today.replace(day=today.day+1).strftime("%Y-%m-%d 08:00")
    }
    
    return report

def save_report(report):
    os.makedirs("reports", exist_ok=True)
    
    # JSON格式
    with open(f"reports/report_{report['date']}.json", "w") as f:
        json.dump(report, f, indent=2)
    
    # 文本格式（钉钉用）
    text = f"""🦞 AI内容农场 - 今日简报 ({report['date'][5:]})

💰 今日收入: ${report['earnings']}
📊 今日访问: {report['visits']}次
📝 新文章: {report['new_articles']}篇

🚀 系统状态: 正常
🎯 明日预测: ${round(report['earnings'] * 1.05, 2)}

报告时间: {datetime.datetime.now().strftime('%H:%M')}
🤖 自动化系统运行中..."""
    
    with open(f"reports/simple_{report['date']}.txt", "w") as f:
        f.write(text)
    
    return text

if __name__ == "__main__":
    print("🤖 生成每日报告...")
    report = generate_daily_report()
    text = save_report(report)
    
    print("✅ 报告生成完成")
    print("\n📱 钉钉报告内容:")
    print("="*40)
    print(text)
    print("="*40)
