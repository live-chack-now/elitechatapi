#!/bin/bash

echo "Installing Elite Chat API..."

# Check Node.js version
node_version=$(node -v 2>/dev/null | cut -d'v' -f2)
if [ -z "$node_version" ]; then
    echo "❌ Node.js not found. Please install Node.js 18 or higher."
    exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Check if .env exists
if [ ! -f ".env" ]; then
    echo "⚙️  Creating environment file..."
    cp .env.example .env
    echo "✅ Created .env file. Please edit it with your configuration."
else
    echo "✅ Environment file already exists."
fi

# Create logs directory
mkdir -p logs

echo "🎉 Installation complete!"
echo ""
echo "Next steps:"
echo "1. Edit .env file with your database and session configuration"
echo "2. Set up your PostgreSQL database"
echo "3. Run 'npm run db:push' to create database tables"
echo "4. Run 'npm run build' to build the application"
echo "5. Run 'npm start' to start the application"
echo ""
echo "For detailed instructions, see DEPLOYMENT.md"