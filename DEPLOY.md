# 🚀 部署到 GitHub Pages 指南

## 📦 本地仓库已准备就绪

仓库位置：`/root/.openclaw/workspace/primary-accounting-quiz`

---

## 🔧 部署步骤

### 方式一：使用 GitHub CLI（推荐）

```bash
# 1. 安装 GitHub CLI（如果未安装）
# Debian/Ubuntu:
sudo apt-get install gh

# 2. 登录 GitHub
gh auth login

# 3. 创建仓库并推送
cd /root/.openclaw/workspace/primary-accounting-quiz
gh repo create primary-accounting-quiz --public --source=. --remote=origin --push

# 4. 启用 GitHub Pages
gh api -X POST /repos/$(gh api /user | jq -r .login)/primary-accounting-quiz/pages \
  -f source='{"branch":"master","path":"/"}'
```

### 方式二：手动推送

```bash
# 1. 在 GitHub 上创建新仓库 primary-accounting-quiz（不要初始化 README）

# 2. 添加远程仓库并推送
cd /root/.openclaw/workspace/primary-accounting-quiz
git remote add origin https://github.com/YOUR_USERNAME/primary-accounting-quiz.git
git branch -M master
git push -u origin master

# 3. 在 GitHub 仓库设置中启用 Pages
# Settings → Pages → Source → 选择 master branch → Save
```

---

## 🌐 访问地址

部署成功后，访问地址为：

```
https://YOUR_USERNAME.github.io/primary-accounting-quiz/
```

---

## 📝 自动部署（可选）

创建 GitHub Actions 自动部署：

```bash
mkdir -p .github/workflows
cat > .github/workflows/deploy.yml << 'EOF'
name: Deploy to GitHub Pages

on:
  push:
    branches: [ master ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./
EOF

git add .github/workflows/deploy.yml
git commit -m "Add auto-deploy workflow"
git push
```

---

## ✅ 检查清单

- [ ] 创建 GitHub 仓库
- [ ] 推送代码
- [ ] 启用 GitHub Pages
- [ ] 测试在线访问
- [ ] 分享链接给用户

---

*创建时间：2026-04-08*
