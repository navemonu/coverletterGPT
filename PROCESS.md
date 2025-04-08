# CoverLetterGPT Project Documentation

## Project Overview
CoverLetterGPT is a web application that helps users generate personalized cover letters using GPT technology. The application is built using the Wasp framework and integrates with various services including OpenAI, Stripe, and Lightning Network for payments.

## Tech Stack
- **Framework**: Wasp (Full-stack framework)
- **Frontend**: React with Chakra UI
- **Backend**: Node.js with Express
- **Database**: PostgreSQL with Prisma ORM
- **Authentication**: Google OAuth
- **AI Integration**: OpenAI GPT API
- **Payment Processing**: Stripe and Lightning Network
- **Email Service**: SendGrid

## Setup Instructions

### Prerequisites
1. Node.js and npm installed
2. Docker installed (for local database)
3. Wasp CLI installed
4. Required API keys:
   - OpenAI API key
   - Google OAuth credentials
   - Stripe API keys
   - SendGrid API key

### Installation Steps
1. Clone the repository
2. Install Wasp:
   ```bash
   curl -sSL https://get.wasp-lang.dev/installer.sh | sh
   ```
3. Create `.env.server` file from `env.server.example`
4. Configure environment variables:
   - `WASP_SERVER_URL`: Server URL (default: http://localhost:3001)
   - `OPENAI_API_KEY`: OpenAI API key
   - `GOOGLE_CLIENT_ID`: Google OAuth client ID
   - `GOOGLE_CLIENT_SECRET`: Google OAuth client secret
   - `DATABASE_URL`: PostgreSQL connection URL
   - `SENDGRID_API_KEY`: SendGrid API key
   - `STRIPE_KEY`: Stripe API key
   - `PRODUCT_PRICE_ID`: Stripe product price ID
   - `PRODUCT_CREDITS_PRICE_ID`: Stripe credits product price ID

### Database Setup
Two options available:
1. Local PostgreSQL using Docker:
   ```bash
   wasp start db
   ```
2. Remote PostgreSQL (e.g., Railway):
   - Create database on Railway
   - Copy connection URL to `DATABASE_URL` in `.env.server`

### Running the Application
1. Run database migrations:
   ```bash
   wasp db migrate-dev
   ```
2. Start the application:
   ```bash
   wasp start
   ```
3. Access the application at `http://localhost:3000`

## Project Structure

### Core Components
1. **Authentication**
   - Google OAuth integration
   - User management

2. **Cover Letter Generation**
   - GPT integration for letter generation
   - Multiple generation modes:
     - Complete cover letter
     - Cover letter with witty remark
     - Cover letter ideas

3. **Payment System**
   - Stripe integration for subscription payments
   - Lightning Network integration for Bitcoin payments
   - Credit system for free trials

4. **Job Management**
   - Job posting and management
   - Cover letter association with jobs

### Database Schema
1. **User Model**
   - Basic user information
   - Payment status
   - Subscription details
   - Credits system

2. **Job Model**
   - Job details (title, company, location, description)
   - Association with cover letters
   - Completion status

3. **CoverLetter Model**
   - Letter content
   - Token usage tracking
   - Association with jobs and users

4. **Payment Models**
   - Lightning Network payment tracking
   - Payment status and settlement

## Development Process

### Adding New Features
1. Define new routes in `main.wasp`
2. Create corresponding React components in `src/client`
3. Implement server actions in `src/server/actions.ts`
4. Update database schema if needed in `schema.prisma`
5. Run migrations for database changes

### Testing
1. Test authentication flow
2. Verify payment processing
3. Test cover letter generation
4. Check database operations

### Deployment
1. Set up production environment variables
2. Configure production database
3. Set up SSL certificates
4. Deploy using Wasp deployment commands

## Maintenance

### Regular Tasks
1. Monitor OpenAI API usage
2. Check payment processing
3. Review user subscriptions
4. Monitor database performance

### Security Considerations
1. API key management
2. User data protection
3. Payment information security
4. Regular security audits

## Troubleshooting

### Common Issues
1. Database connection issues
2. OpenAI API rate limits
3. Payment processing errors
4. Authentication problems

### Debug Process
1. Check environment variables
2. Review server logs
3. Verify database connections
4. Test API integrations

## Future Improvements
1. Enhanced AI models integration
2. Additional payment methods
3. Improved user interface
4. Advanced analytics
5. Multi-language support 