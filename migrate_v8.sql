-- migrate_v8.sql — public-share completed-sensor stats
-- Adds a denormalized snapshot of the athlete's COMPLETED workout stats
-- (duration / distance / avg HR, keyed by date+sport) onto the shared_plans
-- row. Needed because the anonymous public-share viewer cannot read the
-- athlete's private `workouts` table (per-user RLS), so the athlete's app
-- writes a small public snapshot here. Idempotent.

ALTER TABLE public.shared_plans
  ADD COLUMN IF NOT EXISTS snapshot jsonb;

-- No RLS change needed: shared_plans rows are already readable by share_token
-- (the public page does select('*') by token), so the new column rides along.
-- The athlete updates their own row under the existing owner UPDATE policy.
