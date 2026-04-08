#!/bin/bash
# GitHub Pages 一键部署脚本

echo "🚀 初级会计练习系统 - GitHub 部署向导"
echo "======================================"
echo ""

# 检查 Git
if ! command -v git &> /dev/null; then
    echo "❌ Git 未安装，请先安装：apt-get install git"
    exit 1
fi

echo "✅ Git 已安装"

# 进入仓库目录
cd "/root/.openclaw/workspace/primary-accounting-quiz" || exit 1

# 检查远程仓库
if git remote -v | grep -q origin; then
    echo "✅ 远程仓库已配置"
    git remote -v | grep origin
else
    echo ""
    echo "📝 请输入你的 GitHub 用户名："
    read -p "> " USERNAME
    
    if [ -z "$USERNAME" ]; then
        echo "❌ 用户名不能为空"
        exit 1
    fi
    
    echo ""
    echo "🔗 添加远程仓库..."
    git remote add origin git@github.com:${USERNAME}/primary-accounting-quiz.git
    echo "✅ 远程仓库已添加：git@github.com:${USERNAME}/primary-accounting-quiz.git"
fi

echo ""
echo "📤 准备推送..."
echo ""

# 推送
git push -u origin master

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 推送成功！"
    echo ""
    echo "🌐 接下来请启用 GitHub Pages："
    echo "   1. 访问 https://github.com/${USERNAME}/primary-accounting-quiz/settings/pages"
    echo "   2. Source 选择 'master' branch"
    echo "   3. 点击 Save"
    echo ""
    echo "📍 部署完成后访问地址："
    echo "   https://${USERNAME}.github.io/primary-accounting-quiz/"
else
    echo ""
    echo "❌ 推送失败！"
    echo ""
    echo "可能的原因："
    echo "   1. SSH key 未配置 → 运行：ssh-keygen -t ed25519 然后添加到 GitHub"
    echo "   2. 仓库不存在 → 先在 GitHub 创建仓库 primary-accounting-quiz"
    echo "   3. 权限问题 → 检查 SSH key 是否有写入权限"
    echo ""
    echo "💡 或者使用 HTTPS 方式推送："
    echo "   git remote set-url origin https://github.com/${USERNAME}/primary-accounting-quiz.git"
    echo "   git push -u origin master"
fi

echo ""
