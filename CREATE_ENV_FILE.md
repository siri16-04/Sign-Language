# How to Create Your .env.local File

Since `.env.local` files are protected, please follow these steps to create it manually:

## Step 1: Create the File

In the root directory of your project, create a new file named `.env.local`

**On Windows:**
- You can create it in File Explorer or your code editor
- Make sure the file name starts with a dot: `.env.local`

**On Mac/Linux:**
```bash
touch .env.local
```

## Step 2: Add Your Supabase Credentials

Open `.env.local` and add the following content:

```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url_here
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key_here
```

## Step 3: Replace with Your Actual Values

### Get Your Supabase Credentials:

1. Go to [Supabase Dashboard](https://app.supabase.com)
2. Select your project (or create a new one if you haven't)
3. Click on **Settings** (gear icon) in the left sidebar
4. Click on **API** in the settings menu
5. You'll see:
   - **Project URL** - Copy this value
   - **anon public** key - Copy this key (starts with `eyJ...`)

### Update Your .env.local File:

Replace the placeholders with your actual values:

```env
NEXT_PUBLIC_SUPABASE_URL=https://xxxxxxxxxxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh4eHh4eHh4eHh4eHgiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTYxNjIzOTAyMiwiZXhwIjoxOTMxODE1MDIyfQ.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

## Step 4: Restart Your Development Server

After creating/updating `.env.local`, you **must** restart your development server:

```bash
# Stop the current server (Ctrl+C)
# Then start it again
npm run dev
```

## Important Notes

- ✅ The file should be named exactly `.env.local` (with the dot at the beginning)
- ✅ Never commit `.env.local` to git (it's already in .gitignore)
- ✅ The values should NOT have quotes around them
- ✅ Make sure there are no spaces around the `=` sign
- ✅ Each variable should be on its own line

## Verify It's Working

After restarting your server, you should see:
- No warnings about missing Supabase environment variables
- The login page should work properly
- You should be able to sign in anonymously

## Troubleshooting

If you see errors about missing environment variables:
1. Check the file name is exactly `.env.local`
2. Check the variable names are exactly as shown (case-sensitive)
3. Restart your development server
4. Clear browser cache and hard refresh (Ctrl+Shift+R)

## Quick Copy Template

Here's what your `.env.local` file should look like (replace with your values):

```env
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
```

Fill in your Supabase URL and anon key after the `=` signs.


