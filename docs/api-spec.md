# RVN-XM REST API Spec

## Auth
- `POST /auth/login`
- `POST /auth/logout`
- `GET /auth/me`

## Accounts
- `GET /accounts`
- `POST /accounts`
- `GET /accounts/:id`
- `PATCH /accounts/:id`
- `DELETE /accounts/:id`
- `POST /accounts/:id/broker/connect`
- `GET /accounts/:id/broker/status`
- `POST /accounts/:id/broker/sync`

## Symbols
- `GET /symbols`
- `POST /symbols`
- `PATCH /symbols/:id`
- `DELETE /symbols/:id`

## Strategies
- `GET /strategies`
- `POST /strategies`
- `GET /strategies/:id`
- `PATCH /strategies/:id`
- `DELETE /strategies/:id`

## Signals
- `GET /signals`
- `POST /signals/generate`
- `GET /signals/:id`
- `POST /signals/:id/approve`
- `POST /signals/:id/reject`

## Risk
- `GET /risk-rules`
- `POST /risk-rules`
- `PATCH /risk-rules/:id`
- `DELETE /risk-rules/:id`
- `POST /risk/evaluate`

## News
- `GET /news-events`
- `POST /news/refresh`
- `POST /news/evaluate`

## Orders
- `GET /orders`
- `POST /orders`
- `GET /orders/:id`
- `POST /orders/:id/send`
- `POST /orders/:id/cancel`
- `POST /orders/:id/modify`

## Trades
- `GET /trades`
- `GET /trades/:id`
- `GET /positions`
- `POST /positions/:id/close`

## Dashboard
- `GET /dashboard/summary`
- `GET /dashboard/performance`
- `GET /dashboard/activity`
- `GET /logs`

## Bot
- `POST /bot/start`
- `POST /bot/stop`
- `GET /bot/status`
- `POST /bot/run-once`
