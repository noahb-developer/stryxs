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

---

# Round 2 follow-up (paste into the SAME conversation as round 1)

That reference is excellent and I have already encoded the periodization, the R1-R10 guardrails, the zones, and the progression caps into the app. Now I want to go deeper and make sure we are not missing anything, because for this app the quality of the coach is everything. Keep covering BOTH Ironman (140.6) and Half-Ironman (70.3), mark every difference, stay dense and numeric.

Two asks first:

A) REVIEW AND EXTEND your own reference. Re-read what you wrote and add anything you left out, glossed over, or could make more precise or more codeable. Same style.

B) Give me YOUR expert opinion on what a truly great AI triathlon coach should have that I did not think to ask for. Do not hold back. If there is a whole topic we are missing, add it.

Then go deep on these specific areas. For each, give hard numbers, formulas, tables, and at least one worked numeric example:

1. ADAPTIVE ADJUSTMENT (the most important gap). Given a completed week of real data (HR drift per session, actual pace/power vs target, sessions completed vs missed, RPE and how it felt: easy/hard/sore/sick, and the trend over 2-3 weeks), give explicit rules for how to adjust NEXT week. For example: "if cardiac drift > X% on most aerobic runs, cut volume Y%"; "if the key long ride was missed, do not add it on top, do Z"; "if RPE is consistently high or the athlete logs sore/sick, trigger an early deload"; plus overtraining / under-recovery red flags and the response to each. This is how the coach tracks the athlete, so be thorough.

2. IN-SESSION STRUCTURE. For each session type per sport, a warmup / main set / cooldown template with durations and targets, so a workout description is concrete and prescriptive instead of vague.

3. KEY-SESSION PLACEMENT across the week. Exact rules for spacing hard sessions: what counts as the same energy system, the minimum gap between two hard same-system sessions, and ready-to-use 7-day weekly templates for 5-, 6-, and 7-day availability, for IM and HALF, in Base / Build / Peak, showing where rest and deload sit.

4. PROJECTION ENGINE, worked end to end. Take a concrete athlete (5K PB 21:12, bike FTP ~210 W or avg ~26 km/h, swim CSS 1:56/100m, 12 weeks consistent) and project a full IM and a full 70.3 finish step by step: swim split, T1, bike split (show how you get bike speed and time from FTP / NP), T2, run split (show the open-marathon prediction and the tri fatigue factor applied), and total. Then show how to phrase a one-line, data-grounded "why" for each leg's target pace, and how the confidence label and range come out for that data.

5. RECOVERY AND READINESS. How to read fatigue from resting HR / HRV / sleep / mood when available, and from training data when not; concrete thresholds for inserting unplanned rest or pulling back.

6. ENVIRONMENT AND LOGISTICS. Heat / altitude / travel adjustments, hilly-course pacing, and a race-week plus race-morning checklist.

7. STRENGTH PROGRESSION across a season (sets / reps / load by phase), and the injury-prevention and mobility essentials per sport.

8. PROACTIVE COACHING. The specific situations a good coach should NOTICE and message the athlete about unprompted (for example: missed 3 swims in a row, easy runs creeping into Z3, two weeks of high drift), each with the trigger condition and the intent of the message.

Format: dense, hard numbers, tables, formulas, worked examples, IM-vs-HALF marked, no filler. Give me everything; if in doubt, include it.

---

# COACH PAIR 2 — Marathon + Half-Marathon (round 1; new conversation)

You are a world-class distance-running coach and exercise physiologist specializing in the Marathon (42.2 km) and Half-Marathon (21.1 km). I am building an AI coaching app that (a) generates personalized, periodized training plans and (b) predicts race finish times from an athlete's real training data. I need a rigorous, structured reference I can encode directly into the app's rules.

Cover BOTH the Marathon and the Half-Marathon. Whenever they differ, mark it [MAR vs HALF]. Be specific and quantitative: numbers, ranges, formulas, tables, not vague philosophy. Ground it in the established methodologies and cite which one (Jack Daniels / VDOT, Pete Pfitzinger / Advanced Marathoning, Hal Higdon, Renato Canova, Stephen Seiler / polarized, Pete Riegel / endurance time model). Every rule should map to a constant, lookup, or validator.

Produce these sections:

1. PERIODIZATION MODEL — phase structure (Base/foundation -> Build/specific -> Peak/sharpen -> Taper -> Race); typical phase durations and how they scale with weeks-to-race (table for 12, 16, 18, 24 weeks); how to set phase boundaries from time-to-race; minimum viable build.

2. WEEKLY STRUCTURE & PROGRESSION (most important, hard numbers): max safe weekly MILEAGE increase (% per week) by experience; cutback/down-week cadence and how much to cut; rest/recovery days per week by level; when doubles are appropriate for runners; how a weekly mileage (or hours) budget maps to number of runs and their lengths; the long run as a % of weekly mileage and its absolute caps [MAR vs HALF]; intensity distribution (polarized ~80/20) by phase. Give explicit guardrail rules (with numbers) that keep week-to-week load smooth, always include easy/rest, and never spike the long run.

3. ZONES & PACES — Daniels VDOT and the 5 training paces E / M / T / I / R: define each, its purpose, and how to compute the pace from a recent race (give the VDOT formula). Also HR zones from LTHR (Z1-Z5 ranges). Worked example for a runner with a 21:12 5K.

4. SESSION LIBRARY — every standard run session (recovery, easy, steady, long run, marathon-pace long run [Pfitz], medium-long, tempo/threshold (cruise intervals), VO2 intervals, strides, hill reps, progression run, fast finish long run), each with target pace/zone, typical duration/distance by phase, and purpose. Include warmup/main/cooldown structure.

5. ADAPTATION TO THE ATHLETE — scale to available days/week, weekly mileage budget, experience (beginner/intermediate/advanced), current fitness (recent PBs, LTHR), injuries/limiters; how to place the long run, the quality (tempo/interval) days, and easy days across a 7-day week protecting recovery; treadmill/heat substitutions.

6. TAPER — length and volume/intensity changes [MAR vs HALF]; how much to cut, what to keep.

7. RACE-DAY EXECUTION — pacing strategy [MAR vs HALF] (even vs slight negative split, the marathon "wall" and how pacing avoids it, what % of goal pace the first km/mile should be); carbohydrate loading pre-race and in-race fueling (carbs/hr, fluid, when to take gels); the one-line "why" for the goal pace a smart runner would respect.

8. RACE-TIME PROJECTION METHODOLOGY — how to predict a marathon / half finish from a recent 5K/10K (Riegel exponent for runners, Daniels VDOT equivalency); a marathon-specific fade/endurance factor and how training volume affects it (a runner on low mileage fades more than Riegel predicts); MINIMUM data for a credible projection; concrete LOW/MEDIUM/HIGH confidence criteria (data thresholds); how to communicate uncertainty as a range. Worked example: project a marathon and a half for a runner with a 21:12 5K on ~50 km/week.

9. ANTI-PATTERNS / SAFETY — explicit DO-NOT rules with numbers (too much too soon, the 10% rule, easy days not easy, long run too long or too fast, too much intensity, skipping cutback weeks, racing the workouts). Running injuries are common, so be specific (cadence, surface, shoe rotation, bone-stress risk).

10. FEASIBILITY / SANITY CHECK — given a goal time + weeks-to-race + current fitness, judge if it's realistic; the minimum weekly mileage and longest run a given goal time requires (e.g., a sub-3 marathon vs a sub-4 marathon vs a sub-1:45 half). Pair any "unrealistic" verdict with the specific lever (more weeks, more mileage, or a softer goal).

FORMAT: clear headers and bullets, tables for anything numeric (paces by VDOT, phase durations, mileage->runs maps, confidence thresholds, min-mileage-by-goal), explicit numbers and rules I can turn into code, mark every Marathon-vs-Half difference, dense, no filler.
