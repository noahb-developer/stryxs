# STANDALONE SWIMMER METHODOLOGY, PART 3
## Persona: `swimmer`. Extends Parts 1 and 2. Review additions, stroke technique and efficiency metrics, adaptive adjustment (rules AS1 to AS20), recovery and readiness. Factor tables scoped to this persona only.

Sources as Parts 1 and 2, plus: Swim Smooth swim-type and fault-correction framework, Taormina (catch and early vertical forearm), McMaster and Blatherwick (swimmer dryland and shoulder prehab literature), Sims (female athlete physiology, Roar), Tanaka (masters swimming performance decline rates).

---

## A. REVIEW: CORRECTIONS AND EXTENSIONS TO PARTS 1 AND 2

A1. Send-off edge case: the Part 1 send-off formula can produce under 5 s rest after rounding when target pace is slow. Add: rest_actual = sendoff − swim_time; if rest_actual < rest_requested − 4, bump send-off one 5 s step. Hard floor: 5 s rest on any rep.

A2. CSS test validity gate (was implied, now explicit): the 400/200 test is INVALID if t200 pace is not at least 3 s per 100 faster than t400 pace (swimmer paced it wrong). Response: keep prior CSS, prescribe a re-test in 5 to 7 days with pacing instructions (negative-split each TT).

A3. D' sanity clamp: derived D' outside 5 to 40 m means a mis-paced test. Clamp to tier default (8 / 15 / 25) and flag the test.

A4. Provisional-CSS guard: the "steady pace − 9 s" inferral only applies to swims of 800 m plus at RPE 4 to 5. Short or hard swims must not feed it. If only hard swims exist, use "average hard pace − 3 s" and force LOW confidence.

A5. Zone drift with fatigue: in the final third of any session, allow +1 s per 100 on Z2 targets and +1.5 s on Z4 targets before counting it as a miss (normal drift, not failure). Anything beyond that feeds the adaptive rules below.

A6. Pool length normalization (codifies Part 1): store all paces normalized to 25 m pool. Convert on input: pace_25eq = pace_50 − 1.5 s per 100; pace_OW has no reliable back-conversion, never use OW swims to update CSS, only to update the OW condition factors and OW confidence.

A7. Missing from Parts 1 and 2 and now added below: the entire technique development system (section B), efficiency metric formulas (section C), adaptive adjustment (section D), readiness model (section E), and in Part 4: session scaling, weekly templates, deeper projections, environment, dryland, proactive triggers.

---

## B. EXPERT ADDITIONS: WHAT A GREAT AI SWIM COACH NEEDS THAT YOU DID NOT ASK FOR

Each item gets either a full section or a hard rule here.

B1. STROKE FAULT -> DRILL CORRECTION MATRIX (full system, the single biggest gap). Swimming coaching IS fault correction. The app cannot see video, but it can infer the dominant fault cluster from data plus a 6-question intake (see B2) and prescribe the right drill block. Matrix:

| Fault | Data and intake signature | Primary drills (dose) | Tools | Expected gain when corrected |
|---|---|---|---|---|
| Sinking legs / poor body position | high stroke count plus high kick effort reported, slower with pull buoy REVERSED (faster with buoy by 4 s per 100 plus) | head-position resets, kick on side, snorkel swim, core engagement cues (8 x 50, 3 x per week, 3 weeks) | snorkel, fins | 3 to 8 s per 100, beginners |
| Dropped elbow / weak catch | low stroke count but slow pace (over-glide), pace barely improves at higher effort | scull 1 front, doggy paddle, single-arm with catch focus, fist swim (10 x 50 per session) | snorkel | 2 to 6 s per 100 |
| Over-glide / dead-spot timing | stroke rate under 50 spm at threshold (tier-adjusted), pace fade in chop reported | tempo-trainer ramp +2 spm per week, catch-up elimination cues | tempo trainer | 2 to 5 s per 100 in OW especially |
| Crossover / snaking | unilateral breather plus neck or shoulder niggles, veers in OW | bilateral 3-5-7 breathing, 6-1-6 with fins, alignment focus | fins, snorkel | straighter OW lines, 1 to 4 percent OW distance saved |
| Fighter / thrashy (high SR, short DPS) | stroke rate over 75 spm with stroke count over gate | fist swim, stroke-count 25s aiming minus 2 strokes, long-dog drill | none | 3 to 6 s per 100 |
| Weak kick timing | kick board pace under 50 percent of swim pace, 2-beat unintentional | vertical kick 8 x 20 s, board kick with snorkel, 6-beat patterning at easy pace | board, fins, snorkel | small pace, big OW and sprint payoff |

DEFAULT when fault unknown: run the B2 intake; if still ambiguous, prescribe the balanced technique block (Part 1, 4.10 menu rotated weekly).

B2. TECHNIQUE INTAKE (one-time, 6 questions, drives B1): (1) faster, same, or slower with a pull buoy, and by how much, (2) breathing side(s) and comfort bilateral, (3) stroke count per 25 if known, (4) does pace collapse in chop, (5) any shoulder or neck niggles and which side, (6) self-described: smooth, fighter, over-glider, sinker, or unsure. Map answers to the fault matrix; ties break toward body position first (it gates everything else).

B3. EFFICIENCY METRICS, formulas the app computes per swim (full system in section C).

B4. STROKE RATE and the tempo trainer: optimal SR bands at threshold by goal: [DISTANCE pool] 60 to 75 spm, [OW] 65 to 80 spm (higher SR resists chop, Swim Smooth), [SPEED 100 m] 85 to 100 spm, [SPEED 50 m] 100 plus. DEFAULT intermediate threshold SR: 65 spm. Rule: never raise prescribed SR more than 2 spm per week, and only while stroke count holds within +1.

B5. KICK COST-BENEFIT BY DISTANCE: kick contributes roughly 10 to 15 percent of propulsion but can consume 30 percent plus of total energy at hard effort. Prescription share of kick at race effort: 50 m sprint = full 6-beat maximal; 100 to 400 m = strong 6-beat; 1500 m = moderate 6-beat or 4-beat; 3.8 km plus OW = light 2-beat to 4-beat, legs draft-saving. Why: leg muscle oxygen cost per newton of thrust is 3 to 4 x the arms. [DISTANCE] swimmers cap kick sets at 10 percent of volume; [SPEED] at 15 to 20 percent.

B6. MULTI-STROKE: freestyle-only is the persona default, but 10 to 15 percent of easy and warmup volume as backstroke (DEFAULT 10 percent) is a shoulder-health rule, not a preference: it balances internal-rotator dominance (impingement prevention). Breaststroke as active recovery only; butterfly excluded below advanced tier (shoulder load x2 per meter).

B7. MASTERS / AGING (50 plus): expected performance decline about 0.6 to 1 percent per year 35 to 60, accelerating after 70 (Tanaka). Rules: deload every 3rd week forced, max 2 Z5-plus sessions per week becomes 1, recovery between Z4-plus sessions 72 h not 48, dryland shoulder prehab mandatory 2 x per week, CSS retest every 8 weeks not 6 (slower change). Warmups lengthen 50 percent.

B8. FEMALE PHYSIOLOGY (Sims): where cycle data exists, place highest-intensity blocks in the follicular phase, expect 1 to 2 s per 100 slower paces and higher RPE in the late-luteal phase, do not log late-luteal pace misses as fitness regressions (adaptive rules AS2 and AS8 are suppressed for that window). Iron screening prompt if persistent unexplained pace-at-RPE decline. Wetsuit thermals: women generally tolerate cold worse at equal body composition percentile, lower the cold-water caution threshold 1 C.

B9. FEEL FOR THE WATER: trainable, decays in 48 to 72 h of no swimming. Rules: never more than 3 consecutive dry days in Build or Peak for intermediate plus; every session's first 200 m includes sculling or doggy paddle; taper keeps daily or near-daily water contact (Part 2 already cut length not count, this is why).

B10. PSYCHOLOGY HOOKS the coach should know: taper anxiety (flagged in Part 4 proactive triggers), open-water panic (mitigation: graduated exposure protocol, first OW swims 10 to 15 min with a partner or guided group, breathing drills, wetsuit familiarity), and plateau frustration (point to efficiency metrics when pace stalls, the visible-progress lever).

---

## C. EFFICIENCY METRICS (computable per swim from stroke count, time, distance)

Definitions (single-arm stroke counts, 25 m pool baseline, 5 m push-off assumed):
- Distance per stroke DPS (m) = (pool_length − 5) / strokes_per_length. Worked: 16 strokes per 25 -> DPS 1.25; 20 -> 1.00; 23 -> 0.87.
- Stroke rate SR (spm) = strokes / minute, or 60 x strokes_per_length / (length_time − 3 s push-off glide).
- SWOLF per 25 = strokes_per_25 + seconds_per_25. Normalize 50 m pools: SWOLF_25eq = SWOLF_50 / 2 + 2.
- Stroke index SI = velocity (m/s) x DPS. The single best efficiency scalar (Costill). Worked: 1.00 m/s x 2.0 m per cycle (counting cycles) = 2.0.

Tier bands (men, 25 m pool, single-arm count; women add 2 to count bands):

| Metric at Z2 | Beginner | Intermediate | Advanced |
|---|---|---|---|
| Stroke count per 25 | 22 to 26 | 17 to 21 | 13 to 16 |
| SWOLF per 25 | 45 plus | 38 to 44 | under 38 |
| SR at threshold (spm) | 48 to 60 | 58 to 72 | 65 to 85 |

Usage rules:
- C1. Track 4-week rolling SWOLF at Z2. Improving SWOLF at stable pace = technique gain; stable SWOLF at improving pace = fitness gain. Report which lever moved (athletes love this).
- C2. Stroke-count creep WITHIN a session of +2 per 25 from the swimmer's fresh baseline = technique breakdown under fatigue, feeds AS6.
- C3. Golf sets as the standing efficiency test: 6 x 50 swim golf (score = strokes + seconds per 50), best score logged monthly, prescribe in deload weeks (low stress, high signal).
- C4. When no stroke data exists (no watch, no counting): prescribe manual count on 4 x 25 once per week in a technique session; the app asks for one number, not full instrumentation.

---

## D. ADAPTIVE ADJUSTMENT (rules AS1 to AS20, evaluate after each completed week)

Inputs per week: per-set actual vs target pace, within-set fade (first rep vs last rep pace), stroke count or SWOLF trend if present, sessions completed vs planned, RPE and felt tags (easy / hard / strong / flat / sore / sick), shoulder-soreness flag, CTL / ATL / TSB / ACWR, and the 2 to 3 week trend of all of these. Rules fire in the listed order; earlier rules can suppress later ones. Apply at most ONE volume cut and ONE intensity cut per week (largest applicable), never stack cuts.

Hard-stop tier (safety, override everything):
- AS1 SICK TAG or fever: zero intensity until 48 h symptom-free; replace with rest or optional 20 min Z1 if symptoms are above the neck only. Resume at 70 percent of prior week volume, no Z4 plus for the first 3 days back.
- AS2 SHOULDER SORENESS flagged (any session): immediately pull paddles and band for 14 days, cut next week volume 30 percent, convert one swim to kick-and-fins emphasis, trigger early deload. Second flag within 28 days: cut 50 percent, insert the shoulder prehab block (Part 4, dryland) and recommend clinical assessment. Pain ABOVE 3 of 10 or night pain: swimming paused, see a professional, the app says so plainly.
- AS3 ACWR (meters or shoulder_load_units) > 1.30 (1.20 beginner): clamp next week to bring ACWR to 1.10. This rule cannot be overridden by goal proximity.

Fatigue tier:
- AS4 TSB below −20 for 3 plus consecutive days, or RPE 2 plus points above typical for the same session type twice in one week: early deload week now (Part 1, 2.3 cuts), shift the schedule rather than skipping the deload later.
- AS5 Pace at fixed RPE slipped 3 plus s per 100 across 3 sessions (the no-HR fatigue proxy): cut next week volume 20 percent, keep intensity sessions but halve their main sets. If it persists a 2nd week: full deload plus rest day audit (sleep section E).
- AS6 Stroke count creep +2 per 25 under fatigue (C2) in 2 plus sessions: REPLACE one aerobic session next week with a technique session (volume neutral). Creep is a breakdown signal, not a fitness signal; adding meters makes it worse.
- AS7 Within-set fade on the CSS set > 3 s per 100 (first to last rep): next CSS session cut main-set volume 20 percent at the SAME pace (e.g. 10 x 100 -> 8 x 100). Fade 5 plus s per 100: also add 5 s to the send-off.
- AS8 Hold-pace failure (average more than 2 s per 100 slower than target) on CSS sets in 2 consecutive sessions: back off INTENSITY not volume: prescribe CSS + 2 for one week, then re-test CSS. Two failed weeks plus a failed retest pattern = recompute zones from the new test, the old CSS was stale or the ramp outran adaptation.
- AS9 Long-swim within-swim fade > 5 s per 100 (first vs last quarter): freeze long-swim growth (repeat distance next week), shift its pace target +2 s per 100.

Compliance tier:
- AS10 Long swim missed: do NOT stack it midweek and do NOT double next weekend. Next week's long swim = the missed one's distance (no growth step). Two consecutive misses: shrink the long swim 20 percent and ask about the scheduling barrier (proactive trigger).
- AS11 1 session missed (non-long): drop it, no make-up, week proceeds.
- AS12 2 plus sessions missed: next week = repeat the current week at 90 percent volume, no progression.
- AS13 50 percent plus of planned meters missed for 2 consecutive weeks: regenerate the plan at the demonstrated availability (sessions actually completed per week), message the athlete (proactive trigger). A plan the athlete cannot attend is the coach's error, not the athlete's.
- AS14 Athlete consistently EXCEEDS plan (110 percent plus meters, all felt tags easy or strong, 2 weeks): advance the ramp one step early, but never break AS3 or the Part 1 absolute caps.

Progress tier:
- AS15 CSS-set reps consistently 1 to 2 s FASTER than target with RPE at or below target, 2 sessions: schedule a CSS retest within 10 days rather than silently hardening targets.
- AS16 Retest improves CSS by 3 plus s per 100: re-derive every zone pace and send-off immediately, update projections (Part 4 worked example C), and reset the within-set fade baselines.
- AS17 Felt tags flat or hard on 60 percent plus of sessions for 2 weeks with TSB above −10 (so not load): check sleep and life-stress inputs (section E), suggest moving the hardest session to the athlete's self-reported best day, do not cut load yet.

Technique tier:
- AS18 SWOLF 4-week trend worsening 2 plus points at stable pace: raise drill share 10 percentage points for the next 3 weeks.
- AS19 Stroke-gate crossing (count rises above the Part 2 gate): apply the low-skill weighting (Part 2, 5.5): freeze volume, 40 percent drill until back under.
- AS20 Pull-buoy delta shrinking (swim pace approaching buoy pace within 2 s per 100 when it was 4 plus): body position improved; release 5 percentage points of drill volume back to aerobic.

DEFAULTS: any threshold above, when athlete data is too sparse to compute, resolves to NO action except AS1 to AS3 which always evaluate.

---

## E. RECOVERY AND READINESS

With wearable data (resting HR, HRV, sleep):
- E1 Resting HR +7 bpm above 28-day baseline OR HRV 20 percent below baseline for 2 consecutive mornings: convert today's session to Z1 recovery or rest. Both flags together: rest day, full stop.
- E2 Sleep under 6 h before a planned Z4-plus session: swap it with the week's easy session; quality work on no sleep is junk plus injury risk.
- E3 Mood / stress self-report at worst level 2 plus days: cap the week at Z3, AS17 logic applies.

Without wearables, swim-data proxies (the common case):
- E4 The fixed-RPE pace ladder: maintain a rolling baseline of pace at RPE 4 on the standard aerobic session. Slippage thresholds: 2 s per 100 = note it; 3 s = AS5 fires; 5 s = treat as TSB below −20 equivalent, early deload.
- E5 RPE creep: same prescribed set, RPE +2 vs its 4-week norm, twice in 7 days = AS4 equivalent.
- E6 Stroke-count creep at WARMUP pace (not under fatigue): +2 per 25 at easy effort is a strong systemic-fatigue flag (technique degrades before pace does in tired swimmers): insert one unplanned rest day.
- E7 TSB readiness bands for scheduling: key sessions ideally at TSB −10 to +5; TSB below −15, no Z5 plus; TSB below −25, nothing above Z2.

Shoulder readiness (its own channel, evaluated before every paddle or Z5-plus session):
- E8 Pre-session shoulder check the app asks on hard days: "any shoulder tightness today, 0 to 3?" 0 to 1 = proceed; 2 = no paddles, main set −20 percent; 3 = AS2 fires.
- E9 Cumulative rule: 3 plus sessions in 14 days with shoulder score 2 = treat as one AS2 flag.

Swimming as recovery for life: 20 to 30 min Z1 swims are legitimate active recovery (zero impact, hydrostatic pressure aids venous return) and may be offered on rest days as OPTIONAL, never counted toward weekly meters progression, capped at 1,500 m. DEFAULT: offered to intermediate and advanced only.

End of Part 3. Part 4 covers session scaling, weekly templates, projection depth, environment and logistics, dryland strength, and proactive coaching triggers.
