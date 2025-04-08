# Railway Deployment Guide for CoverLetterGPT

This guide provides step-by-step instructions for deploying CoverLetterGPT on Railway.

## Prerequisites

1. A Railway account (sign up at [railway.app](https://railway.app))
2. GitHub account with the CoverLetterGPT repository
3. All required API keys:
   - OpenAI API key
   - Google OAuth credentials
   - Stripe API keys
   - SendGrid API key

## Step 1: Database Setup

1. Log in to your Railway account
2. Click "New Project"
3. Select "Database" → "PostgreSQL"
4. Wait for the database to be provisioned
5. Once created, go to the "Connect" tab
6. Copy the "PostgreSQL Connection URL"
7. Save this URL for later use in environment variables

## Step 2: Project Setup

1. In Railway dashboard, click "New Project"
2. Select "Deploy from GitHub repo"
3. Connect your GitHub account if not already connected
4. Select the CoverLetterGPT repository
5. Choose the branch you want to deploy (usually `main`)

## Step 3: Environment Variables

1. In your Railway project, go to the "Variables" tab
2. Add the following environment variables:

```bash
# Server Configuration
WASP_SERVER_URL=https://your-railway-app-url.railway.app
WASP_WEB_CLIENT_URL=https://your-railway-app-url.railway.app

# Database
DATABASE_URL=your-postgresql-connection-url-from-step-1

# OpenAI
OPENAI_API_KEY=your-openai-api-key

# Google OAuth
GOOGLE_CLIENT_ID=your-google-client-id
GOOGLE_CLIENT_SECRET=your-google-client-secret

# SendGrid
SENDGRID_API_KEY=your-sendgrid-api-key
SEND_EMAILS_IN_DEVELOPMENT=false

# Stripe
STRIPE_KEY=your-stripe-secret-key
PRODUCT_PRICE_ID=your-stripe-product-price-id
PRODUCT_CREDITS_PRICE_ID=your-stripe-credits-product-price-id
```

## Step 4: Build Configuration

1. In your Railway project, go to "Settings"
2. Under "Build & Deploy", configure:
   - Build Command: `npm install && npx wasp build`
   - Start Command: `npx wasp start`
   - Health Check Path: `/`

## Step 5: Database Migrations

1. After the first deployment, you need to run database migrations
2. In Railway dashboard, go to your project
3. Click on "Deployments"
4. Find the latest deployment
5. Click on the three dots (...)
6. Select "Open Shell"
7. Run the following commands:
   ```bash
   npx wasp db migrate-dev
   ```

## Step 6: Domain Configuration

1. In Railway dashboard, go to your project
2. Click on "Settings"
3. Under "Domains", click "Generate Domain"
4. Copy the generated domain
5. Update your environment variables with the new domain:
   - Update `WASP_SERVER_URL` with the new domain
   - Update `WASP_WEB_CLIENT_URL` with the new domain

## Step 7: SSL Configuration

1. Railway automatically provisions SSL certificates
2. Verify SSL is working by accessing your domain with `https://`

## Step 8: OAuth Configuration

1. Go to Google Cloud Console
2. Update your OAuth 2.0 Client ID configuration:
   - Add your Railway domain to authorized JavaScript origins
   - Add your Railway domain to authorized redirect URIs
3. Update the environment variables with new OAuth credentials if needed

## Step 9: Stripe Webhook Configuration

1. Go to Stripe Dashboard
2. Navigate to Developers → Webhooks
3. Add a new endpoint:
   - URL: `https://your-railway-domain.railway.app/stripe-webhook`
   - Select events to listen to (at minimum: `checkout.session.completed`)
4. Copy the webhook signing secret
5. Add it to Railway environment variables:
   ```bash
   STRIPE_WEBHOOK_SECRET=your-webhook-signing-secret
   ```

## Step 10: Monitoring Setup

1. In Railway dashboard, go to your project
2. Set up monitoring:
   - Enable "Metrics"
   - Configure alerts for:
     - High CPU usage
     - High memory usage
     - Failed deployments
     - Database connection issues

## Troubleshooting

### Common Issues

1. **Database Connection Issues**
   - Verify DATABASE_URL is correct
   - Check if database is running
   - Ensure migrations are applied

2. **Build Failures**
   - Check build logs in Railway dashboard
   - Verify all dependencies are in package.json
   - Ensure Node.js version is compatible

3. **Environment Variables**
   - Verify all required variables are set
   - Check for typos in variable names
   - Ensure values are correctly formatted

4. **OAuth Issues**
   - Verify domain is correctly configured in Google Console
   - Check redirect URIs match exactly
   - Ensure environment variables are updated

### Debug Process

1. Check Railway logs:
   - Go to project dashboard
   - Click on "Deployments"
   - Select latest deployment
   - View logs

2. Test database connection:
   ```bash
   npx wasp db migrate-dev
   ```

3. Verify environment variables:
   ```bash
   npx wasp env
   ```

## Maintenance

### Regular Tasks

1. Monitor Railway metrics:
   - CPU usage
   - Memory usage
   - Database performance
   - API response times

2. Update dependencies:
   ```bash
   npm update
   ```

3. Check SSL certificate status:
   - Verify certificate expiration
   - Monitor for any SSL errors

4. Database maintenance:
   - Monitor database size
   - Check for slow queries
   - Perform regular backups

### Backup Strategy

1. Enable automatic database backups in Railway
2. Configure backup retention period
3. Test backup restoration process
4. Document backup procedures

## Security Considerations

1. Keep all API keys secure
2. Regularly rotate credentials
3. Monitor for suspicious activities
4. Keep dependencies updated
5. Enable Railway's security features

## Support Resources

- [Railway Documentation](https://docs.railway.app)
- [Wasp Documentation](https://wasp-lang.dev/docs)
- [Stripe Documentation](https://stripe.com/docs)
- [OpenAI Documentation](https://platform.openai.com/docs) 