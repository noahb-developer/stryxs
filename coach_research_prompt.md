# Coach research prompt — Ironman (140.6) + Half-Ironman (70.3)

Paste the block below into a strong research model (Claude, GPT, Perplexity, etc.).
Then paste the model's full output back to Claude Code so it can be encoded into the
`coach` edge function (persona system prompt + plan-generation guardrails + projection logic).

Do ONE coach pair at a time. This first prompt covers Ironman + 70.3 (they share Friel
methodology). Later pairs: marathon + half-marathon, 5K/10K + general fitness, sprint/olympic tri.

---

You are a world-class endurance coach and exercise physiologist specializing in triathlon, specifically Ironman (140.6) and Half-Ironman (70.3). I am building an AI coaching app that (a) generates personalized, periodized training plans and (b) predicts race finish times from an athlete's real training data. I need a rigorous, structured reference I can encode directly into the AI's rules.

Cover BOTH Ironman (140.6) and Half-Ironman (70.3). Whenever the two differ, say so explicitly. Be specific and quantitative: give numbers, ranges, formulas, and tables — not vague philosophy. Cite the methodology/source (Joe Friel, Jack Daniels, Brett Sutton, Stephen Seiler, Andrew Coggan, Matt Dixon, etc.) where relevant. Every rule I should be able to turn into code.

Produce these sections:

1. PERIODIZATION MODEL
- The macro / meso / micro structure (Base → Build → Peak → Taper → Race). Typical phase durations, and how they scale with weeks-to-race (give a table for 16, 24, 36, and 52-week plans).
- How to set phase boundaries purely from the athlete's time-to-race.

2. WEEKLY STRUCTURE & PROGRESSION RULES — MOST IMPORTANT, give hard numbers
- Max safe week-to-week volume increase (% per week), and how it differs by experience level.
- Recovery / deload week cadence (e.g., every 3rd or 4th week) and how much to cut volume.
- Minimum and typical REST days per week, by experience level and phase.
- Max sessions per day; when a "double" day is appropriate vs harmful.
- How a weekly HOURS budget maps to number of sessions and their durations.
- Intensity distribution (e.g., polarized ~80/20): % of weekly time per zone, by phase.
- IMPORTANT: I have a bug where generated plans jump from several rest days one week to zero rest days and 3-4 sessions/day the next. Give explicit guardrail rules (with numbers) that make week-to-week load smooth and always include adequate rest.

3. ZONES
- HR zones from LTHR (run and bike separately) and swim zones from CSS. Give the % ranges for Z1–Z5 in a table.

4. SESSION LIBRARY (per sport)
- For swim, bike, run: every standard session type (easy/endurance, tempo, threshold, VO2/intervals, long, recovery, technique/drills), each with target zone, typical duration/distance by phase, and its purpose.
- Brick workouts: when, how long, structure.
- Strength: how much, what type, where in the week, what to avoid near key sessions.

5. ADAPTATION TO THE ATHLETE
- How to scale the plan to: available training days/week, weekly hours budget, experience level (beginner / intermediate / advanced), current fitness (LTHR / swim CSS / recent PBs), injuries/limiters, and equipment (pool access, indoor trainer, etc.).
- How to place the long ride, long run, and key swim across a 7-day week given the athlete's available days, while protecting recovery.

6. TAPER
- Taper length and the volume/intensity changes, for Ironman vs 70.3.

7. RACE-DAY EXECUTION (we display per-leg pacing)
- Target pacing for each leg (swim, bike, run) relative to threshold/zones, for Ironman vs 70.3. For EACH leg give a single credible one-line rationale ("why") a smart athlete would respect.
- Fueling and hydration guidelines per leg (carbs/hr, fluid, sodium).

8. RACE-TIME PROJECTION METHODOLOGY (we predict finish times from training data)
- How to project an Ironman / 70.3 finish from recent benchmarks (e.g., 5K/10K PB → marathon-equivalent), training volume, and threshold values. Give the actual formulas/standard models you'd use (Riegel exponent, Daniels VDOT, critical power/speed, etc.).
- The MINIMUM data needed for a credible projection, and what specifically raises or lowers confidence.
- Concrete LOW / MEDIUM / HIGH confidence criteria — define the data thresholds that justify each level.
- How to communicate uncertainty honestly while still being useful.

9. ANTI-PATTERNS / SAFETY RULES — explicit "never do this"
- The top mistakes that make a plan dangerous or ineffective (load spikes, missing recovery weeks, too much intensity, no rest, unrealistic ramp), written as explicit DO-NOT rules WITH numbers.

10. FEASIBILITY / SANITY CHECK
- Given a goal time + weeks-to-race + current fitness, how to judge whether the goal is realistic, and the minimum training (weekly volume, number of weeks, longest sessions) a given goal requires.

FORMAT: clear headers and bullets. Use TABLES for anything numeric (zone %, phase durations, hours→sessions maps, confidence thresholds). Give explicit numbers and rules I can turn into code, not general advice. Mark every Ironman-vs-70.3 difference. Be thorough but dense — no filler, no motivational fluff.
