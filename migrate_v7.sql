-- migrate_v7.sql — let users UPDATE their own workout rows.
--
-- Symptom this fixes: classifying a workout (Planned / Extra / Not training)
-- failed with "Could not update, try refreshing" and the notification kept
-- asking to classify. Reading workouts worked (a SELECT policy exists), but the
-- UPDATE matched 0 rows because the workouts table had no UPDATE RLS policy, so
-- activity_classification never actually persisted. That also kept synced
-- workouts "unclassified", which is why Race Projections sat at 0/5.
--
-- Idempotent: safe to run more than once.

ALTER TABLE public.workouts ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "workouts_update_own" ON public.workouts;
CREATE POLICY "workouts_update_own" ON public.workouts
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Confirm what's now on the table (look for a row with cmd = UPDATE):
SELECT policyname, cmd FROM pg_policies
WHERE schemaname = 'public' AND tablename = 'workouts'
ORDER BY cmd, policyname;
