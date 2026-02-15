# Supabase Setup Guide

This guide will help you set up Supabase for the AR Learning application with anonymous authentication and quiz score storage.

## Prerequisites

- A Supabase account (sign up at https://supabase.com)
- Node.js and npm installed
- This project set up locally

## Step 1: Create a Supabase Project

1. Go to [Supabase Dashboard](https://app.supabase.com)
2. Click "New Project"
3. Fill in your project details:
   - **Name**: AR Learning (or your preferred name)
   - **Database Password**: Choose a strong password
   - **Region**: Select the closest region to your users
4. Click "Create new project"
5. Wait for the project to be created (usually 1-2 minutes)

## Step 2: Get Your Supabase Credentials

1. In your Supabase project dashboard, go to **Settings** → **API**
2. You'll find:
   - **Project URL**: Copy this (looks like `https://xxxxx.supabase.co`)
   - **anon public key**: Copy this key (starts with `eyJ...`)

## Step 3: Set Up Environment Variables

1. Create a `.env.local` file in the root of your project (if it doesn't exist)
2. Add your Supabase credentials:

```env
NEXT_PUBLIC_SUPABASE_URL=your_project_url_here
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_anon_key_here
```

Replace `your_project_url_here` and `your_anon_key_here` with the values from Step 2.

## Step 4: Create Database Tables

1. In your Supabase dashboard, go to **SQL Editor**
2. Click "New query"
3. Copy the contents of `supabase-schema.sql` from this project
4. Paste it into the SQL Editor
5. Click "Run" to execute the SQL
6. You should see success messages for:
   - Table creation
   - Index creation
   - Row Level Security policies
   - Triggers

## Step 5: Enable Anonymous Authentication

1. Go to **Authentication** → **Providers** in your Supabase dashboard
2. Scroll down to find **Anonymous** provider
3. Toggle it to **Enabled**
4. Click "Save"

## Step 6: Verify Row Level Security (RLS)

The SQL schema already sets up RLS policies. To verify:

1. Go to **Authentication** → **Policies** in your Supabase dashboard
2. You should see policies for:
   - `users` table: Users can view/insert/update own data
   - `quiz_scores` table: Users can view/insert own quiz scores

## Step 7: Test the Setup

1. Start your development server:
   ```bash
   npm run dev
   ```

2. Navigate to `http://localhost:3000/login`
3. Click "Continue Anonymously"
4. You should be redirected to the home page
5. Take a quiz and verify the score is saved

## Step 8: Verify Data in Supabase

1. In Supabase dashboard, go to **Table Editor**
2. Check the `users` table - you should see your anonymous user
3. Complete a quiz and check the `quiz_scores` table - you should see your score

## Troubleshooting

### Error: "Supabase environment variables are not set"
- Make sure your `.env.local` file exists in the project root
- Verify the variable names are exactly: `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- Restart your development server after adding environment variables

### Error: "Failed to login"
- Check that Anonymous authentication is enabled in Supabase
- Verify your Supabase URL and anon key are correct
- Check browser console for detailed error messages

### Error: "Error saving quiz score to Supabase"
- Verify the database tables were created successfully
- Check that RLS policies are set up correctly
- Ensure the user is authenticated (check browser console)

### Database Connection Issues
- Verify your Supabase project is active (not paused)
- Check your internet connection
- Review Supabase dashboard for any service status issues

## Database Schema

### Tables Created

1. **users**
   - `id` (UUID, Primary Key)
   - `email` (Text, nullable)
   - `username` (Text, nullable)
   - `anonymous_id` (Text, Unique)
   - `created_at` (Timestamp)
   - `updated_at` (Timestamp)

2. **quiz_scores**
   - `id` (UUID, Primary Key)
   - `user_id` (UUID, Foreign Key → users.id)
   - `topic_id` (Text)
   - `score` (Integer)
   - `total_questions` (Integer)
   - `percentage` (Integer)
   - `completed_at` (Timestamp)
   - `created_at` (Timestamp)

### Indexes
- `idx_quiz_scores_user_id` - Fast lookup of user scores
- `idx_quiz_scores_topic_id` - Fast lookup by topic
- `idx_quiz_scores_completed_at` - Ordered by completion time
- `idx_users_anonymous_id` - Fast user lookup

## Security Notes

- Row Level Security (RLS) is enabled on all tables
- Users can only access their own data
- Anonymous users are fully supported
- All data is encrypted in transit (HTTPS)

## Next Steps

After setup, you can:
- View user quiz scores in the Supabase dashboard
- Export data for analytics
- Set up custom authentication methods if needed
- Create additional tables as your app grows

## Support

If you encounter issues:
1. Check the Supabase documentation: https://supabase.com/docs
2. Review the error messages in browser console
3. Check Supabase dashboard logs for backend errors
4. Verify all environment variables are set correctly


