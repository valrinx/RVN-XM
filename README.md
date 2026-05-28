# TRADE XM

Pixel trading office dashboard with a monorepo structure for web, API, Telegram bot, shared types, and future worker services.

## One-click start

Double-click `start.bat`.

What it does:
- creates `.env` from `.env.example` if missing
- installs dependencies if needed
- starts API
- starts Web
- starts Telegram bot if `TELEGRAM_BOT_TOKEN` is present
- opens the app in your browser

## Docker start

Double-click `run-docker.bat` or run:

```bash
docker compose up --build
```

## Stack

- Web: Next.js, Tailwind CSS
- API: Node.js, Express, Socket.IO
- Bot: Telegram bot via Telegraf
- Shared: common types and event contracts
- Infra: Docker, PostgreSQL, Redis

## Project structure

```text
apps/
  web/
  api/
  bot/
packages/
  shared/
  ui/
  trading-engine/
services/
  market-worker/
  news-worker/
  signal-worker/
```

## Requirements

- Node.js 20+
- npm 10+
- Docker Desktop (optional, for compose)

## Manual local development

### 1) Install dependencies

```bash
npm install
```

### 2) Create environment file

Copy `.env.example` to `.env` and fill in any real secrets you want to use.

### 3) Run the full app stack locally

```bash
npm run dev
```

This starts:
- Web on `http://localhost:3000`
- API on `http://localhost:4000`

## Telegram bot

Set a valid token before starting the bot:

```bash
TELEGRAM_BOT_TOKEN=your_token_here
```

Bot commands:
- `/start`
- `/status`
- `/market`
- `/help`

## API endpoints

- `GET /health`
- `GET /api/status`
- `GET /api/market`
- `POST /api/events`

## Realtime events

Socket.IO events:
- `app:boot`
- `app:market`
- `app:tick`
- `app:event`
- `telegram:alert`
- `bot:subscribed`

## Notes

- The UI currently uses live socket updates from the API.
- Market data and signals are mocked for now, but the architecture is ready for real exchange integration.
- The bot requires a valid Telegram token to connect.
