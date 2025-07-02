# Elite Chat API - WhatsApp Messaging Platform

A comprehensive self-hostable WhatsApp bulk messaging platform with Cloud API integration, dashboard management, and real-time messaging capabilities.

## Features

### 🚀 Core Features
- **Dashboard**: Real-time overview of campaigns, contacts, and messaging statistics
- **Messages**: Live messaging interface with WhatsApp contacts
- **Contacts**: Advanced contact management with tags and custom fields
- **Campaigns**: Bulk messaging campaigns with scheduling and templates
- **Analytics**: Detailed performance metrics and delivery statistics
- **Settings**: WhatsApp Business API configuration and user preferences

### 💬 WhatsApp Integration
- WhatsApp Business Cloud API support
- Multiple instance management
- Real-time message delivery tracking
- Media support (images, videos, documents)
- Webhook integration for incoming messages
- Message templates and bulk campaigns

### 🔧 Technical Features
- Real-time WebSocket communication
- PostgreSQL database with Drizzle ORM
- Session-based authentication
- Responsive design with WhatsApp-themed UI
- RESTful API endpoints
- Docker support for easy deployment

## Quick Start

### Prerequisites
- Node.js 18 or higher
- PostgreSQL 12 or higher
- npm or yarn package manager

### Installation

1. **Extract and Install**:
```bash
unzip elite-chat-api-deploy.zip
cd elite-chat-api
npm install
```

2. **Configure Environment**:
```bash
cp .env.example .env
# Edit .env with your database and session configuration
```

3. **Setup Database**:
```bash
npm run db:push
```

4. **Build and Start**:
```bash
npm run build
npm start
```

Visit `http://localhost:5000` to access the application.

### Docker Deployment

For quick deployment with Docker:

```bash
docker-compose up -d
```

This will start both the application and PostgreSQL database.

## Configuration

### Environment Variables

Create a `.env` file based on `.env.example`:

```env
DATABASE_URL=postgresql://username:password@localhost:5432/elitechatapi
SESSION_SECRET=your-super-secret-session-key-change-this-in-production
PORT=5000
NODE_ENV=production
```

### WhatsApp Business API Setup

1. **Get API Access**: Apply for WhatsApp Business API access through Meta
2. **Configure Instance**: In the Settings page, add your:
   - Instance Name
   - Phone Number ID
   - Access Token
   - Webhook URL (optional)

3. **Set Webhook**: Configure webhook URL to `https://yourdomain.com/api/webhook/whatsapp`

## API Endpoints

### Authentication
- `GET /api/auth/user` - Get current user information
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout

### Dashboard
- `GET /api/dashboard/stats` - Get dashboard statistics

### Contacts
- `GET /api/contacts` - List all contacts
- `POST /api/contacts` - Create new contact
- `PUT /api/contacts/:id` - Update contact
- `DELETE /api/contacts/:id` - Delete contact

### Campaigns
- `GET /api/campaigns` - List all campaigns
- `POST /api/campaigns` - Create new campaign
- `PUT /api/campaigns/:id` - Update campaign
- `DELETE /api/campaigns/:id` - Delete campaign

### Messages
- `GET /api/messages` - List messages
- `POST /api/messages/send` - Send message

### WebSocket
- `/ws` - WebSocket endpoint for real-time messaging

## Development

### Project Structure
```
├── client/                 # React frontend
│   ├── src/
│   │   ├── components/    # Reusable components
│   │   ├── pages/        # Page components
│   │   ├── hooks/        # Custom hooks
│   │   └── lib/          # Utilities and configurations
├── server/                # Express backend
│   ├── routes.ts         # API routes
│   ├── storage.ts        # Database operations
│   ├── whatsapp.ts       # WhatsApp API integration
│   └── auth.ts           # Authentication middleware
├── shared/                # Shared types and schemas
│   └── schema.ts         # Database schema
└── deployment files
```

### Available Scripts

```bash
npm run dev          # Start development server
npm run build        # Build for production
npm start            # Start production server
npm run db:push      # Push database schema changes
```

### Technology Stack

**Frontend**:
- React 18 with TypeScript
- Wouter for routing
- TanStack Query for state management
- Shadcn/ui components
- Tailwind CSS for styling

**Backend**:
- Node.js with Express
- TypeScript
- WebSocket for real-time features
- Session-based authentication

**Database**:
- PostgreSQL
- Drizzle ORM
- Connection pooling support

## Deployment Options

### Traditional Server (VPS)
See `DEPLOYMENT.md` for detailed VPS deployment instructions.

### Cloud Platforms
- **Heroku**: Deploy with PostgreSQL addon
- **Railway**: One-click deployment with managed database
- **DigitalOcean**: App Platform deployment
- **AWS**: EC2 or Elastic Beanstalk deployment

### Docker
Use included Docker configuration for containerized deployment.

## Security

- Session-based authentication with secure cookies
- Environment variable configuration
- Input validation and sanitization
- HTTPS recommended for production
- Database connection security

## Support

For technical support:
1. Check the `DEPLOYMENT.md` guide
2. Review application logs
3. Ensure all environment variables are properly configured
4. Verify WhatsApp Business API credentials

## License

This project is provided as-is for self-hosting purposes. Please ensure compliance with WhatsApp Business API terms of service.

---

Built with ❤️ for WhatsApp business messaging automation.