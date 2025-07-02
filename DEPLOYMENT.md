# Elite Chat API - Deployment Guide

## Overview
Elite Chat API is a comprehensive WhatsApp bulk messaging platform that can be self-hosted on any platform. This guide will help you deploy and configure the application.

## System Requirements
- Node.js 18 or higher
- PostgreSQL 12 or higher
- npm or yarn package manager
- Domain name (optional, for production)

## Quick Start

### 1. Installation
```bash
# Extract the deployment package
unzip elite-chat-api-deploy.zip
cd elite-chat-api

# Install dependencies
npm install

# Set up environment variables
cp .env.example .env
```

### 2. Environment Configuration
Edit the `.env` file with your configuration:

```env
# Database Configuration
DATABASE_URL=postgresql://username:password@localhost:5432/elitechatapi

# Session Configuration
SESSION_SECRET=your-super-secret-session-key-here

# Server Configuration
PORT=5000
NODE_ENV=production

# WhatsApp Business API (Configure in Settings page)
# These are managed through the UI, not environment variables
```

### 3. Database Setup
```bash
# Push database schema
npm run db:push

# The application will automatically create the required tables
```

### 4. Build and Start
```bash
# Build for production
npm run build

# Start the application
npm start
```

Your application will be available at `http://localhost:5000`

## Production Deployment

### Option 1: Traditional VPS/Server

#### Prerequisites
- Ubuntu 20.04+ or CentOS 8+
- Root or sudo access

#### Steps
1. Install Node.js and PostgreSQL:
```bash
# Ubuntu/Debian
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs postgresql postgresql-contrib

# CentOS/RHEL
sudo dnf install -y nodejs npm postgresql postgresql-server
```

2. Create database:
```bash
sudo -u postgres createdb elitechatapi
sudo -u postgres createuser --interactive elitechatapi
```

3. Configure and start:
```bash
# Upload and extract your deployment package
cd /opt/elite-chat-api
npm install --production
npm run db:push
npm run build

# Use PM2 for process management
npm install -g pm2
pm2 start ecosystem.config.js
pm2 startup
pm2 save
```

### Option 2: Docker Deployment

Use the included `Dockerfile` and `docker-compose.yml`:

```bash
# Build and start with Docker Compose
docker-compose up -d

# The application will be available at http://localhost:5000
```

### Option 3: Cloud Platforms

#### Heroku
1. Create a new Heroku app
2. Add PostgreSQL addon: `heroku addons:create heroku-postgresql:mini`
3. Deploy using Git or Heroku CLI
4. Run database migration: `heroku run npm run db:push`

#### Railway
1. Connect your repository to Railway
2. Add PostgreSQL service
3. Set environment variables
4. Deploy automatically

#### DigitalOcean App Platform
1. Create new app from GitHub repository
2. Add managed PostgreSQL database
3. Configure environment variables
4. Deploy

## Configuration

### WhatsApp Business API Setup

1. **Get WhatsApp Business API Access**:
   - Apply for WhatsApp Business API access
   - Get your Phone Number ID and Access Token

2. **Configure Webhook**:
   - Set webhook URL to: `https://yourdomain.com/api/webhook/whatsapp`
   - Configure webhook events: messages, message_deliveries, message_reads

3. **App Settings**:
   - Go to Settings page in the application
   - Add your WhatsApp instances with:
     - Instance Name
     - Phone Number ID
     - Access Token
     - Webhook URL (optional)

### Reverse Proxy Setup (Nginx)

For production, use Nginx as a reverse proxy:

```nginx
server {
    listen 80;
    server_name yourdomain.com;

    location / {
        proxy_pass http://localhost:5000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
    }
}
```

## Features

### Core Features
- **Dashboard**: Overview of campaigns, contacts, and messaging statistics
- **Messages**: Real-time messaging interface with WhatsApp contacts
- **Contacts**: Comprehensive contact management with tags and custom fields
- **Campaigns**: Bulk messaging campaigns with scheduling and templates
- **Analytics**: Performance metrics and delivery statistics
- **Settings**: WhatsApp API configuration and user preferences

### API Endpoints
- `GET /api/auth/user` - Get current user information
- `GET /api/dashboard/stats` - Dashboard statistics
- `GET /api/contacts` - List all contacts
- `POST /api/contacts` - Create new contact
- `GET /api/campaigns` - List all campaigns
- `POST /api/campaigns` - Create new campaign
- `GET /api/messages` - List messages
- `POST /api/messages/send` - Send message
- `POST /api/webhook/whatsapp` - WhatsApp webhook endpoint

## Security Considerations

1. **Environment Variables**: Never commit `.env` files to version control
2. **Session Secret**: Use a strong, unique session secret
3. **Database Security**: Use strong database passwords and restrict access
4. **HTTPS**: Always use HTTPS in production
5. **Firewall**: Configure firewall to only allow necessary ports
6. **Updates**: Keep dependencies updated regularly

## Troubleshooting

### Common Issues

1. **Database Connection Error**:
   - Check DATABASE_URL format
   - Ensure PostgreSQL is running
   - Verify database credentials

2. **Port Already in Use**:
   - Change PORT in .env file
   - Kill existing processes: `lsof -ti:5000 | xargs kill`

3. **WhatsApp API Errors**:
   - Verify Phone Number ID and Access Token
   - Check webhook URL accessibility
   - Ensure proper WhatsApp Business API permissions

4. **Build Errors**:
   - Clear node_modules: `rm -rf node_modules && npm install`
   - Check Node.js version compatibility

### Logs and Monitoring

- Application logs: `pm2 logs` (if using PM2)
- Database logs: Check PostgreSQL logs
- Nginx logs: `/var/log/nginx/error.log`

## Scaling

For high-volume deployments:

1. **Database Optimization**:
   - Use connection pooling
   - Add database indexes
   - Consider read replicas

2. **Application Scaling**:
   - Use PM2 cluster mode
   - Load balancer for multiple instances
   - Redis for session storage

3. **Monitoring**:
   - Set up application monitoring
   - Database performance monitoring
   - Error tracking and alerts

## Support

For technical support and questions:
- Check the troubleshooting section
- Review application logs
- Ensure all environment variables are properly set

## License

This deployment package is provided as-is. Please ensure compliance with WhatsApp Business API terms of service.