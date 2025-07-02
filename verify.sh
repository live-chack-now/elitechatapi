#!/bin/bash

echo "🔍 Verifying Elite Chat API deployment..."

# Check Node.js
if command -v node &> /dev/null; then
    echo "✅ Node.js found: $(node -v)"
else
    echo "❌ Node.js not found"
    exit 1
fi

# Check npm
if command -v npm &> /dev/null; then
    echo "✅ npm found: $(npm -v)"
else
    echo "❌ npm not found"
    exit 1
fi

# Check if package.json exists
if [ -f "package.json" ]; then
    echo "✅ package.json found"
else
    echo "❌ package.json not found"
    exit 1
fi

# Check if .env exists
if [ -f ".env" ]; then
    echo "✅ .env configuration found"
else
    echo "⚠️  .env not found - copy from .env.example"
fi

# Check if built
if [ -d "dist" ]; then
    echo "✅ Application built"
else
    echo "ℹ️  Application not built yet - run 'npm run build'"
fi

# Check dependencies
if [ -d "node_modules" ]; then
    echo "✅ Dependencies installed"
else
    echo "⚠️  Dependencies not installed - run 'npm install'"
fi

echo ""
echo "📋 Deployment Status:"
echo "- Configuration: $([ -f ".env" ] && echo "Ready" || echo "Needs setup")"
echo "- Dependencies: $([ -d "node_modules" ] && echo "Installed" || echo "Not installed")"
echo "- Build: $([ -d "dist" ] && echo "Ready" || echo "Needs build")"
echo ""
echo "🚀 Next steps if not ready:"
echo "1. Run ./install.sh to set up the project"
echo "2. Edit .env with your configuration"
echo "3. Run 'npm run db:push' to set up database"
echo "4. Run 'npm run build' to build the application"
echo "5. Run 'npm start' to start the server"