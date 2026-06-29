-- migrate_v17: multi-race support (A / B / C races). Idempotent, safe to re-run.
--
-- Adds a `races` JSONB array to athlete_intake. Each race object looks like:
--   { "id": "<short id>", "date": "YYYY-MM-DD", "event": "<distance/type e.g. 10k, half, 70_3>",
--     "goal_time": "<optional, e.g. sub-45>", "priority": "A" | "B" | "C" }
--
-- The A race (priority "A") is the main goal the plan periodizes toward; B/C races are
-- tune-up races the plan stays aware of (light taper, no brutal session the day before).
-- The existing single-race columns (goal_event / race_date / goal_time) keep mirroring the
-- A race so all current single-race logic keeps working with zero changes.

alter table public.athlete_intake
  add column if not exists races jsonb not null default '[]'::jsonb;
