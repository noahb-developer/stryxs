-- migrate_v12.sql — allow users to DELETE their own workout_feedback rows.
-- The table had INSERT / SELECT / UPDATE policies (saving + editing feedback
-- works) but NO DELETE policy, so the "Delete" button's delete matched 0 rows
-- under RLS and silently did nothing — the row stayed, and reopening "How did
-- that feel?" showed the old saved feedback instead of a fresh form.
-- Same class of bug as the missing workouts UPDATE policy (migrate_v7).
-- Idempotent.

ALTER TABLE public.workout_feedback ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS workout_feedback_delete_own ON public.workout_feedback;
CREATE POLICY workout_feedback_delete_own
  ON public.workout_feedback
  FOR DELETE
  USING (auth.uid() = user_id);
