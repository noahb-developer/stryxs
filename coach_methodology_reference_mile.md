# Middle-Distance / Miler Methodology (800m to 3000m, MILE centerpiece)
> Stryxs persona reference. DISTINCT from the road personas (5K/10K, half, marathon, ultra). This persona is governed by anaerobic capacity, running economy, raw speed, lactate tolerance, and neuromuscular power on top of a SMALLER aerobic base. Factor tables here are scoped to this persona only and must NOT leak into the distance personas, and the distance factor tables must NOT leak in here.
>
> House style: no em-dashes, every numeric rule has a DEFAULT, every rule keyed to beginner / intermediate / advanced, all paces anchored to the athlete's real PBs and to VDOT or critical velocity with an RPE fallback. All projection numbers below were computed and cross-checked before writing (Daniels-Gilbert VDOT model) and are internally consistent for unit testing.
---
## 0. Divergence key and athlete-type model
Two axes drive every divergence in this document. They are marked inline everywhere.
**Event axis:**
- `[800M]` most anaerobic, roughly 60 to 70% aerobic. Speed and lactate tolerance dominate.
- `[MILE]` (1500m and the 1609m mile) the centerpiece, roughly 75 to 84% aerobic. The balance event: aerobic power plus a finishing gear.
- `[3000M]` (and 2-mile) most aerobic of the middle distances, roughly 85 to 90% aerobic. Bridges to the 5K engine but still needs speed.
**Athlete-type axis (diagnosed from data, see Section 6):**
- `[SPEED-TYPE]` fast 400, fades late. The 800-down profile. Large anaerobic speed reserve.
- `[ENDURANCE-TYPE]` strong 5K, weak finish. The 1500-up profile. Small anaerobic speed reserve.
- `[COMBINED]` balanced.
**Persona default assumption (critical):** most amateur "milers" are ENDURANCE-TYPE and under-developed on speed. When type is unknown, DEFAULT the diagnosis to ENDURANCE-TYPE and bias the quality emphasis toward speed and lactate tolerance until data says otherwise.
**Experience tiers used throughout:**
- beginner: under ~18 months structured running, weekly volume under ~40 km, no recent track work.
- intermediate: ~18 months to ~5 years, ~40 to ~70 km/wk, some interval history.
- advanced: 5+ years, ~60 to ~110 km/wk, established speed and race history.
---
## 1. Periodization model
Lydiard-to-sharpening flavored, four phases. Middle distance peaks FASTER than the marathon and sharpens harder. Even the mile is aerobic-base-dependent (Lydiard), but the sharpening end is what wins it.
| Phase | Primary stimulus | Secondary | Quality sessions/wk | Marker |
|---|---|---|---|---|
| Base | Aerobic volume + general speed (strides, hills) | Economy, tendon prep | 1 to 2 | CV/threshold appears, strides daily-ish |
| Support | Specific endurance + VO2max | Threshold maintenance | 2 | I-pace intervals dominate |
| Specific | Race-pace + lactate tolerance + speed | VO2 maintenance | 2 to 3 | R-pace, special endurance, race-pace reps |
| Taper / Competition | Sharpness, races as workouts | Maintain everything, cut volume | 2 (lighter) | Peak, then hold across season |
### Phase durations scaled to weeks-to-event
Set phase boundaries purely from weeks-to-event. DEFAULT splits below; round to whole weeks.
| Weeks to event | Base | Support | Specific | Taper |
|---|---|---|---|---|
| 8 | 2 | 2 | 3 | 1 |
| 12 | 3 | 4 | 4 | 1 |
| 16 | 5 | 5 | 5 | 1 |
| 24 | 9 | 7 | 6 | 2 |
Boundary rule (codeable): `base_end = round(W * f_base)`, `support_end = base_end + round(W * f_support)`, `specific_end = W - taper_len`. DEFAULT fractions by event:
| Event | f_base | f_support | f_specific | taper_len |
|---|---|---|---|---|
| `[800M]` | 0.30 | 0.30 | 0.34 | max(1, round(W*0.06)) |
| `[MILE]` | 0.35 | 0.32 | 0.27 | max(1, round(W*0.06)) |
| `[3000M]` | 0.42 | 0.30 | 0.22 | max(1, round(W*0.05)) |
Type modifiers: `[SPEED-TYPE]` shift +1 week from Specific into Base/Support (they need aerobic support, not more speed). `[ENDURANCE-TYPE]` shift +1 week from Base into Specific (they need speed and lactate tolerance, not more base). Never let any phase drop below 1 week.
### Competition phase (track season)
When the goal is a season rather than one race, after the first peak hold a 4 to 10 week competition phase: 1 race every 1 to 2 weeks treated as the hard session of that week, 1 maintenance quality session, the rest easy. Re-sharpen with a 3 to 5 day micro-taper before target races. Do not re-enter heavy Base mid-season; a 1 to 2 week "refresh" of volume between race clusters is enough.
Event mix differences:
- `[800M]` more Specific and speed, less Base. Special endurance is the backbone of the Specific phase.
- `[MILE]` the balanced template above.
- `[3000M]` longer Base, VO2max is the backbone of Support, less pure speed (but never zero).
---
## 2. Weekly structure and progression rules (hard numbers)
Middle-distance weekly volume is LOW relative to distance running. The binding constraint is QUALITY sessions per week, not mileage. CNS and tendon load is the limiter, not cardio.
### Weekly volume ranges (km/wk) by tier and event
| Tier | `[800M]` | `[MILE]` | `[3000M]` |
|---|---|---|---|
| beginner | 25 to 40 | 30 to 45 | 35 to 50 |
| intermediate | 40 to 65 | 50 to 75 | 60 to 85 |
| advanced | 60 to 90 | 70 to 100 | 80 to 120 |
DEFAULT when only "I run a few times a week" is known: beginner 35, intermediate 60, advanced 85 km/wk, then scale to available days.
### Max safe week-to-week volume increase
| Tier | Max weekly volume increase | DEFAULT |
|---|---|---|
| beginner | 8% | 6% |
| intermediate | 7% | 5% |
| advanced | 6% | 4% |
Hold or deload every 3rd to 4th week. Deload cut: beginner cut volume 30%, intermediate 25%, advanced 20%, and drop to 1 quality session that week. DEFAULT deload cadence: every 4th week.
### Quality sessions per week (THE binding constraint, never more)
| Phase | beginner | intermediate | advanced |
|---|---|---|---|
| Base | 1 | 1 to 2 | 2 |
| Support | 1 to 2 | 2 | 2 |
| Specific | 2 | 2 to 3 | 3 |
| Taper | 1 to 2 | 2 | 2 (lighter) |
DEFAULT: beginner 2 max, intermediate 2, advanced 3 max. A "quality session" = VO2max, lactate tolerance / special endurance, R-pace speed, or threshold. Strides and hill sprints do NOT count toward this cap (they are neuromuscular, low metabolic cost).
### Rest / easy days
| Tier | Min full rest days/wk | Typical easy days/wk |
|---|---|---|
| beginner | 2 | 3 to 4 |
| intermediate | 1 | 2 to 3 |
| advanced | 1 | 2 to 3 |
### Guardrails (codeable, never violate)
- Never schedule two anaerobic sessions (VO2max, lactate tolerance, R-pace, or race-pace) on back-to-back days. Minimum 48h between any two; 72h between two lactate-tolerance / special-endurance sessions specifically `[800M][MILE]`.
- Threshold / CV is the one quality type that may sit 24h before an easy day, but still not adjacent to an anaerobic day.
- Cap weekly hard-rep volume increase at 10% (count total meters of work intervals, not warmup).
- Do not add a 3rd weekly quality session until 2 have been tolerated symptom-free for 3+ weeks.
- Intensity is capped by quality, not quantity: if rep pace falls more than 4% off target or form breaks, end the session. A bad session banked is interest paid in injury.
### Long run (yes, even milers run long, but capped)
| Event | Long run as % of weekly volume | Absolute cap | DEFAULT |
|---|---|---|---|
| `[800M]` | 20 to 25% | 16 km | 12 to 14 km |
| `[MILE]` | 22 to 28% | 19 km | 14 to 16 km |
| `[3000M]` | 25 to 30% | 22 km | 16 to 18 km |
Long run is easy aerobic (E pace, RPE 3 to 4). It is aerobic support, not a workout. `[SPEED-TYPE]` push toward the top of the range; `[ENDURANCE-TYPE]` keep at DEFAULT, do not let it crowd out speed.
### Strides and short sprints year-round (non-negotiable)
4 to 8 x 20 to 30m at ~95% effort, full walk-back recovery, 2 to 3 times per week, EVERY phase including base and taper. Purpose: maintain neuromuscular firing and economy with near-zero metabolic cost. Hill sprints (Section 5) 1x/wk in Base for tendon stiffness and power.
---
## 3. Zones, paces, and the speed-reserve model
### Prescription pace system (Daniels-anchored)
The app prescribes by VDOT-derived paces. All values below were computed from the Daniels-Gilbert VO2 model and are the per-400m target with /km conversion. %LTHR and RPE fallbacks are for athletes without a clean VDOT anchor.
| Pace | What it is | Use | %LTHR | RPE | Recovery |
|---|---|---|---|---|---|
| E (easy) | Aerobic base | Easy days, long run, warmup | 65 to 78% | 2 to 4 | n/a |
| T (threshold) | ~88% VO2max, ~60-min race pace | Aerobic support, CV days | 92 to 96% | 6 to 7 | short, 1:5 work:rest or continuous |
| I (interval) | ~vVO2max, 3K to 5K race pace | VO2max development | 98 to 100%+ | 8 to 9 | ~1:1 (equal time jog) |
| R (repetition) | ~mile/1500 race pace | Speed + economy | n/a (too short for HR) | 9 | full, 1:3 to 1:4 |
| Speed | 400/200 pace and faster | Neuromuscular power | n/a | 9 to 10 | full, walk to recovery |
### Verified VDOT pace table (seconds per 400m; /km in parentheses)
| VDOT | T /400 (/km) | I /400 (/km) | R /400 (/km) |
|---|---|---|---|
| 38 | 127.4s (5:18) | 114.9s (4:47) | 111.1s (4:38) |
| 42 | 117.5s (4:54) | 106.0s (4:25) | 101.6s (4:14) |
| 46 | 109.2s (4:33) | 98.5s (4:06) | 93.7s (3:54) |
| 50 | 102.1s (4:15) | 92.0s (3:50) | 86.9s (3:37) |
| 54 | 95.9s (4:00) | 86.5s (3:36) | 81.2s (3:23) |
| 58 | 90.5s (3:46) | 81.6s (3:24) | 76.2s (3:11) |
| 62 | 85.7s (3:34) | 77.3s (3:13) | 71.8s (2:59) |
| 66 | 81.5s (3:24) | 73.5s (3:04) | 67.9s (2:50) |
I-pace = vVO2max by construction. R-pace = the athlete's VDOT-equivalent mile velocity (Section 9 table). If no VDOT anchor exists, fall back to RPE and to "current mile race pace" for R, "3K to 5K race pace" for I, "comfortably hard, could speak 3 to 4 words" for T.
### The speed-reserve framework (the differentiator to encode)
Three velocities define the middle-distance engine:
- **vVO2max**: velocity at VO2max (m/s). The aerobic ceiling. Computed from VDOT (solve VO2cost(v) = VDOT). Equals I-pace.
- **MSS**: maximal sprint speed (m/s). The neuromuscular ceiling.
- **ASR**: anaerobic speed reserve = MSS minus vVO2max. The "room" between aerobic ceiling and top speed. This is where 800/mile race pace lives.
Race velocity expressed as fraction into the reserve: `%ASR = (v_race - vVO2max) / (MSS - vVO2max)`. Typical bands (MSS-dependent, use as defaults):
| Event | Race velocity vs vVO2max | DEFAULT %ASR |
|---|---|---|
| `[800M]` | well above | 15 to 30% (DEFAULT 20%) |
| `[MILE]` / 1500 | just above | 5 to 15% (DEFAULT 10%) |
| `[3000M]` | at to just above | 0 to 5% (DEFAULT at vVO2max) |
Diagnostic reading: for a FIXED race pace, a runner with a LARGE ASR sits at a LOWER %ASR (race feels submaximal, has a kick in reserve) = `[SPEED-TYPE]`. A runner with a SMALL ASR sits at a HIGH %ASR (maxed out, no finishing gear) = `[ENDURANCE-TYPE]`, and is speed-limited.
### Estimating MSS and vVO2max from athlete data
- vVO2max: always derivable from any race PB via VDOT. No test needed.
- MSS, in priority order:
  1. Flying-30m test (best): MSS = 30 / t_flying (m/s). Beginner protocol: 30m run-in, 30m timed at max.
  2. 5K-and-400 pairing: estimate MSS from the 400 PB. `MSS = avg_400_velocity / 0.83` (a trained runner averages ~83% of MSS over a 400). Example: 60s 400 = 6.667 m/s avg, MSS = 8.03 m/s.
  3. Untested DEFAULT by tier/sex:
| Sex / tier | MSS (m/s) | vVO2max (m/s) | ASR (m/s) |
|---|---|---|---|
| M beginner | 8.3 | 3.77 | 4.53 |
| M intermediate | 9.0 | 4.49 | 4.51 |
| M advanced | 9.8 | 5.17 | 4.63 |
| F beginner | 7.3 | 3.77 | 3.53 |
| F intermediate | 7.9 | 4.49 | 3.41 |
| F advanced | 8.6 | 5.17 | 3.43 |
(vVO2max in the default table is anchored to a representative VDOT per tier: 42 / 52 / 62. When the athlete has a real PB, replace vVO2max with their computed value and recompute ASR.)
### Critical velocity (Tinman, for aerobic support)
CV is the asymptote of the power-duration curve, slightly slower than T pace, sustainable ~25 to 40 minutes. Estimate `CV (m/s) ~= 0.92 * vVO2max`, or from two efforts (e.g. 1200m and 2400m time trials, CV = distance_diff / time_diff). Use CV for the aerobic-support workhorse session in Base and Support. RPE 6, "controlled discomfort."
---
## 4. Session library
Every session below gives: target (tied to VDOT / mile pace / ASR%), RPE, structure by phase, recovery, purpose, event/type emphasis, and a warmup/main/cooldown template that becomes the displayed workout-description string. All paces reference the VDOT table in Section 3 or the equivalent-time table in Section 9.
Standard warmup for all quality sessions (the warmup is itself a performance variable for the mile): 12 to 20 min E jog, dynamic drills (A-skip, B-skip, leg swings), 4 to 6 x strides, 2 to 3 build-ups to target pace. Standard cooldown: 10 to 15 min E jog.
### 4.1 Easy aerobic (E)
Target E pace / RPE 2 to 4 / HR 65 to 78% LTHR. Recovery and aerobic maintenance. All tiers, all phases. No-track: any surface, GPS or feel.
Template: 30 to 60 min continuous E. Add 4 to 6 strides in the last 10 min on 2 to 3 of these per week.
### 4.2 Long run (capped, see Section 2)
Target E pace / RPE 3 to 4. Aerobic support. Caps in Section 2.
Template: continuous E, no fast finish for milers (save the legs).
### 4.3 Threshold / Critical velocity (T / CV)
Target T pace (Section 3) or CV / RPE 6 to 7 / 92 to 96% LTHR. Raises lactate clearance and aerobic support. Backbone of Base and Support aerobic work. Emphasis `[3000M]` > `[MILE]` > `[800M]`. `[ENDURANCE-TYPE]` already strong here, keep maintenance dose; `[SPEED-TYPE]` needs more of this.
Template by phase:
- Base: 20 to 30 min continuous tempo at CV, or 4 to 5 x 5 min at T with 60s jog.
- Support: 5 to 6 x 1000m at T, 60 to 90s jog. (e.g. VDOT 50: ~4:15/km, 1000m in ~4:15.)
No-track: road or treadmill at /km pace.
### 4.4 VO2max / I-pace intervals
Target I pace = vVO2max (Section 3) / RPE 8 to 9 / 98 to 100% LTHR. Raises VO2max. Backbone of Support phase. Emphasis `[3000M]` and `[MILE]`; lighter for `[800M]`.
Structure: total work 4 to 8 min (beginner) up to 10 to 12 min (advanced) at I.
- 5 to 6 x 1000m at I, equal-time jog recovery (~3:30 to 4:00 jog).
- 8 to 10 x 400m at I, 200m jog. (VDOT 50: 400m in ~92s.)
- 5 to 6 x 800m at I, 400m jog `[3000M]`.
No-track: treadmill at I /km, or measured road loop.
### 4.5 R-pace repetitions (speed + economy)
Target R pace = mile/1500 race velocity (Section 3, Section 9) / RPE 9 / full recovery 1:3 to 1:4. Economy and speed at race pace without lactate accumulation. Specific phase. Emphasis `[MILE]` and `[800M]`. The under-trained `[ENDURANCE-TYPE]` amateur needs this most.
Structure (full recovery is the point: each rep crisp, no fade):
- 8 to 12 x 200m at R, walk/jog 200m (3x rep time).
- 6 to 8 x 300m at R, full recovery.
- 5 to 6 x 400m at R, 400m walk/jog. (VDOT 50: 400m in ~87s, ~3 to 4 min recovery.)
No-track: 200m/400m measured segments, treadmill less ideal (turnover differs).
### 4.6 Special endurance / lactate tolerance (Canova, Coe)
Target race pace or slightly faster / RPE 9 to 10 / LONG recovery (1:4 to 1:8). Teaches the body to run fast while accumulating and buffering lactate. The Specific-phase backbone for `[800M]` and a key `[MILE]` session. Most CNS/glycolytically costly: hard cap 1 per week, 72h spacing.
Structure:
- `[800M]`: 2 to 3 x 600m at 800 race pace, 6 to 10 min recovery. Or 300 + 300 broken with 30s rest, full recovery between sets.
- `[MILE]`: 2 to 3 x 600m at mile pace or 3 to 4 x 500m, long recovery. Broken-mile (below).
Beginner: cap at 2 reps and start at goal pace, not faster. Advanced: 3 reps, may run first rep slightly faster than goal.
### 4.7 Speed development (max velocity)
Target near-max, 95 to 100% / RPE 9 to 10 / FULL recovery. Raises MSS and ASR. Year-round, emphasized for `[800M]` and `[SPEED-TYPE]`, but every miler needs it.
Structure:
- Flying 30s: 30m run-in, 30m at max, 5 of them, full walk-back.
- 60 to 150m at 95% with full recovery (3 to 5 min), 4 to 8 reps.
Never run these tired. Place early in the week after a rest day.
### 4.8 Hill sprints
Target max effort uphill 8 to 12s / RPE 10 / full recovery (walk down + rest, ~2 to 3 min). Tendon stiffness, power, injury-resistant speed. Base phase, 1x/wk, 6 to 10 reps. Lower impact than flat sprints, good entry point for `[ENDURANCE-TYPE]` building speed.
### 4.9 Strides
4 to 8 x 20 to 30m at ~95%, full recovery, 2 to 3x/wk, every phase. Neuromuscular maintenance, economy. Do not count as a quality session.
### 4.10 Race-pace / broken-mile simulation
Target goal mile pace / RPE 8 to 9 / short rest within set. Race-specific rhythm and confidence. Specific and Taper phases, `[MILE]`.
Structure:
- Broken mile: 4 x 400m at goal mile pace, 30 to 60s rest. Progress to 30s, then to a 1200 + 400.
- 1000m + 600m at goal pace, full recovery between.
### 4.11 Plyometrics and drills (economy)
Low-amplitude plyos (pogo hops, ankle hops, low bounds) and running drills. Economy and stiffness. 1 to 2x/wk after easy runs, NOT before quality. Ramp slowly (Section 10): start 2 sets, add 1 set every 2 weeks. Achilles / soleus / calf risk if ramped fast.
---
## 5. Adaptation to the athlete
### Scale to available days/week
| Days/wk | beginner | intermediate | advanced |
|---|---|---|---|
| 3 | 1 quality + 1 strides + 1 long-ish E | 2 quality + 1 long E | 2 quality + 1 long E |
| 4 | 2 quality (1 hard, 1 lighter) + 2 E | 2 quality + 2 E (1 long) | 2 to 3 quality + E |
| 5 | 2 quality + 3 E (1 long, strides on 2) | 2 to 3 quality + E + long | 3 quality + E + long |
| 6 to 7 | (rare for beginner) | 2 to 3 quality + E + long + strides | 3 quality + doubles optional + long |
Rule: quality sessions per week from Section 2 are a CEILING, not a target to force. Fewer days means fewer easy runs first, protect the quality.
### The CENTERPIECE: diagnose the speed-vs-endurance limiter
This is the feature that makes the persona adaptive. Procedure (codeable):
1. From the athlete's 5K PB (most likely anchor), compute VDOT and the VDOT-balanced 400m time (Section 9 table).
2. Compare to the athlete's ACTUAL short PB (400 or 800 via free-text / last-race) if available, OR to implied speed from recent strides/sprint data.
3. Classify:
   - actual 400 FASTER than balanced by > 3% -> `[SPEED-TYPE]` (their speed exceeds what their aerobic engine implies; the mile is ENDURANCE-LIMITED, they cannot hold their speed for a full mile).
   - actual 400 SLOWER than balanced by > 3% -> `[ENDURANCE-TYPE]` (their aerobic engine outruns their speed; the mile is SPEED-LIMITED, they have no finishing gear).
   - within +/- 3% -> `[COMBINED]`.
4. No short PB: DEFAULT to `[ENDURANCE-TYPE]` (the amateur trap) and bias quality toward speed and lactate tolerance.
Balanced 400 reference (from VDOT, for the diagnosis): VDOT 50 -> 1:18.7, VDOT 54.6 -> 1:12.9, VDOT 60 -> 1:07.1. Full table in Section 9.
Quality-emphasis shift by diagnosis:
- `[SPEED-TYPE]` (endurance-limited mile): add aerobic support (CV, threshold, more E volume, slightly longer long run). Keep speed maintenance only. They already have the gear; build the engine to deliver it longer.
- `[ENDURANCE-TYPE]` (speed-limited mile): add R-pace, speed development, hill sprints, lactate tolerance. Hold aerobic volume, do not add base. They have the engine; build the gear.
### Low-mileage vs high-mileage to the same mile
A low-mileage runner reaches a given mile time through higher relative intensity and sharper speed (more R-pace and special endurance, smaller aerobic base). A high-mileage runner reaches it through a deeper aerobic base and higher vVO2max with less reliance on anaerobic reserve. Both are valid. Do not force a low-mileage speed-type onto a high-mileage plan; injury and staleness follow.
### Body composition, power-to-weight, neuromuscular maturity
Higher power-to-weight improves the speed end disproportionately (sprint and R-pace are mass-sensitive). Neuromuscular maturity (years of speed exposure) caps how fast MSS can rise; novices gain speed quickly, advanced runners gain little. Do not promise large MSS gains to an advanced runner.
### Equipment substitutes
- No track: measured road / GPS segments, treadmill for I and T (less ideal for R due to turnover). Hills for speed and power.
- Gym / weights: heavy strength (squats, trap-bar deadlift) 1 to 2x/wk in Base and Support raises power and economy. Drop volume in Specific/Taper, keep 1 light power session.
- Spikes: introduce gradually (Section 10), high Achilles/calf load.
---
## 6. Taper and peaking
Middle distance sharpens and peaks DIFFERENTLY from the marathon: keep intensity and race-pace sharpness, cut VOLUME hard.
### Taper structure for a mile peak
| Tier | Taper length | Volume cut | Intensity | Quality sessions |
|---|---|---|---|---|
| beginner | 7 to 10 days | 40 to 50% | maintain race-pace sharpness | 1 to 2 light |
| intermediate | 7 to 10 days | 45 to 55% | maintain | 2 light |
| advanced | 10 to 14 days | 50 to 60% | maintain, even sharpen | 2 light |
Rules:
- Cut volume, NOT intensity. Keep short race-pace touches (e.g. 3 to 4 x 200m at R) every 3 to 4 days through taper.
- A pre-race speed touch 2 days out: 3 to 4 x 150 to 200m at race pace or slightly faster, full recovery. Primes the CNS without fatigue.
- Day before: 15 to 20 min E + 4 x strides + 2 x 100m at mile pace. Stay sharp, stay fresh.
### Single race vs holding a season
- Single goal race: full taper above, peak once.
- Track season: smaller 3 to 5 day micro-tapers before each target race, full taper only for the season's A-race. Hold form with 1 quality + races; expect a 4 to 8 week sharp window before form dulls.
### Race-day warmup (a performance variable for the mile)
Long and specific: 15 to 20 min E jog, full dynamic drills, 6 to 8 strides, 3 to 4 build-ups, then 2 to 3 x 150 to 200m at race pace finishing ~10 to 20 min before the gun. Shorter for `[3000M]`, longest and most speed-primed for `[800M]`. A flat warmup costs the mile 1 to 3 seconds.
---
## 7. Race execution
One-line "why" per strategy. The mile is rarely run even-paced.
### `[800M]` (two-lap models)
- Even / slightly positive: lap 1 ~ 0.5 to 1.0s faster than lap 2. Why: 800 is too short to bank much, going out controlled-aggressive minimizes the deceleration that kills the last 200.
- `[SPEED-TYPE]`: front-run or sit on the leader, use the speed reserve in the last 150. Why: their kick beats most fields.
- `[ENDURANCE-TYPE]`: honest even pace, grind the speed out of others. Why: they have no kick, so make it a strength contest, not a sprint.
- Target first-lap %: ~ first 400 run ~1 to 2% faster than goal average. Beginner: go out at goal pace, do not bank.
### `[MILE]` / 1500
- Even-pace (time trial / championship from front): hold goal pace, last 400 as fast as legs allow. Best for `[ENDURANCE-TYPE]`.
- Sit-and-kick: stay relaxed in the pack to the bell, unload the last 300 to 400. Best for `[SPEED-TYPE]`.
- J-shaped / negative last lap: typical fast-mile distribution is a quick first 400 (settle), slightly slower middle 800, fast last 400. Be AT or NEAR the front at the bell (do not get boxed).
- Typical lap-split distribution (4:00 to 6:00 milers, % of average pace): lap1 ~99 to 101%, lap2 ~101 to 103% (slowest), lap3 ~101 to 102%, lap4 ~96 to 99% (fastest). The middle laps sag, the last lap is the gun.
- Finishing-gear math: last-400 capability ~= the runner's R-pace / 400 speed minus accumulated fatigue. A `[SPEED-TYPE]` can close 2 to 4s faster than average pace; an `[ENDURANCE-TYPE]` may only hold even.
### `[3000M]`
- Even to slightly negative, last 600 to 800 progressive. Why: largely aerobic, so even pacing is most efficient; the kick is shorter and earlier than the mile.
### Positioning, kicking, warmup
Stay out of boxes, be top-3 to top-5 at the bell in the mile. Kick timing: `[SPEED-TYPE]` late (last 200 to 300), `[ENDURANCE-TYPE]` early and long (last 400 to 600, a "long drive"). The long specific warmup (Section 6) is part of the race.
---
## 8. Race-time projection methodology (deterministic, codeable)
The engine predicts a middle-distance race time from training data. Two sub-models (aerobic from a long PB, speed from a short PB) reconciled by the event's aerobic weight. All numbers below are computed and consistent; unit-test against them.
### 8.1 Cross-distance equivalence (the aerobic predictor)
Primary method: Daniels VDOT equivalence. Compute VDOT from the best available PB, then read the equivalent target time. Verified equivalent-performance table:
| VDOT | 400 | 800 | 1500 | Mile | 3000 | 2-mile | 5K |
|---|---|---|---|---|---|---|---|
| 38 | 1:38.98 | 3:27.57 | 6:53.55 | 7:26.87 | 14:39.91 | 15:48.57 | 25:10.30 |
| 42 | 1:30.90 | 3:10.11 | 6:18.25 | 6:48.75 | 13:26.88 | 14:30.17 | 23:07.63 |
| 46 | 1:24.14 | 2:55.56 | 5:48.74 | 6:16.86 | 12:25.33 | 13:24.06 | 21:24.29 |
| 50 | 1:18.41 | 2:43.24 | 5:23.72 | 5:49.80 | 11:32.75 | 12:27.58 | 19:56.02 |
| 54 | 1:13.49 | 2:32.69 | 5:02.26 | 5:26.58 | 10:47.35 | 11:38.76 | 18:39.71 |
| 58 | 1:09.22 | 2:23.54 | 4:43.66 | 5:06.44 | 10:07.76 | 10:56.18 | 17:33.05 |
| 62 | 1:05.47 | 2:15.54 | 4:27.39 | 4:48.83 | 9:32.95 | 10:18.71 | 16:34.32 |
| 66 | 1:02.15 | 2:08.48 | 4:13.04 | 4:33.30 | 9:02.11 | 9:45.50 | 15:42.16 |
Fallback method: middle-distance Riegel `T2 = T1 * (D2/D1)^k`. The middle-distance exponents are HIGHER than the road 1.06. Verified effective exponents:
| Pair | k (DEFAULT) | range over VDOT 38 to 62 |
|---|---|---|
| mile -> 5K | 1.08 | 1.074 to 1.091 |
| 800 -> 5K | 1.087 | 1.083 to 1.087 |
| 400 -> mile | 1.07 | 1.066 to 1.083 |
| 800 -> mile | 1.09 | 1.082 to 1.097 |
| mile -> 3000 | 1.095 | 1.088 to 1.100 |
Use VDOT as primary (more robust across the range); use Riegel only when a VDOT lookup is unavailable.
### 8.2 The speed-reserve correction (the differentiator)
The same 5K runner runs a faster or slower mile depending on anaerobic speed reserve. Model:

```
mile_aero  = VDOT_equivalent(best_long_PB, MILE)          # Section 8.1
if short_PB (400) available:
    mile_speed = t400 * (1609.34/400)^1.07                # 400 -> mile Riegel
    mile_pred  = W_AERO[event]*mile_aero + (1-W_AERO[event])*mile_speed
    mile_pred  = max(mile_pred, mile_aero * (1 - CORR_CAP))   # speed cannot improve mile > CORR_CAP
else:
    mile_pred  = mile_aero                                 # balanced / default-ASR assumption
```

Constants (verified):
| Param | Value |
|---|---|
| W_AERO `[800M]` | 0.35 |
| W_AERO `[MILE]` / 1500 | 0.75 |
| W_AERO `[3000M]` | 0.85 |
| K_SPEED 400->800 | 1.05 |
| K_SPEED 400->mile/1500 | 1.07 |
| K_SPEED 400->3000 | 1.085 |
| CORR_CAP | 0.08 (speed reserve cannot make a race more than 8% faster than the aerobic prediction) |
How much ASR shifts the mile (worked below): a strong speed reserve pulls the mile roughly 10 to 25 seconds faster than the aerobic-only prediction for a 5:00 to 6:00 miler; a weak reserve leaves it at the aerobic prediction or up to ~5s slower. With no short PB, assume the tier/sex DEFAULT ASR (Section 3) which yields zero correction (balanced assumption).
For 800 / 1500 / 3000 targets, replace `mile` with the target distance, use that distance's `W_AERO` and `K_SPEED`, and use the VDOT equivalent for the aerobic term.
### 8.3 Reconciliation when both a short and a long PB exist
The mile is limited by the WEAKER link. The blend in 8.2 already encodes this for the mile (aerobic-weighted 0.75). Additional rule:
- If `mile_speed > mile_aero` (short PB slower than long PB implies, i.e. ENDURANCE-TYPE): the blend correctly pulls the prediction slower; flag the mile as SPEED-LIMITED and surface "your finishing speed is the limiter."
- If `mile_speed < mile_aero` (short PB faster, SPEED-TYPE): the blend pulls faster but capped at 8%; flag ENDURANCE-LIMITED and surface "your aerobic ceiling is the limiter."
### 8.4 Default mile by tier/sex (minimal data)
| Sex / tier | DEFAULT mile |
|---|---|
| M beginner | 7:25 |
| M intermediate | 5:50 |
| M advanced | 4:49 |
| F beginner | 8:30 |
| F intermediate | 6:30 |
| F advanced | 5:25 |
Minimum data for a credible projection: at least one valid race PB at any distance + tier. Best single anchor: a recent (within ~6 weeks) mile or 1500 race or time trial.
### 8.5 Confidence levels
| Confidence | Criteria | Range |
|---|---|---|
| LOW | single PB only (e.g. 5K alone, no short PB) or only recent-run estimates | +/- 5 to 8% (~15 to 25s on a 5:00 mile) |
| MEDIUM | a long PB + one short PB (400/800), OR a recent mile/1500 TT older than 6 weeks | +/- 3 to 4% (~9 to 12s) |
| HIGH | recent (< 6 weeks) mile or 1500 race, OR 5K + 400 + 800 all mutually consistent | +/- 1.5 to 2.5% (~5 to 8s) |
### 8.6 Worked examples (unit-test anchors, all verified)
All use W_AERO[mile]=0.75, K_SPEED=1.07, CORR_CAP=0.08.
**Case A: 20:00 5K, no short PB.**
- VDOT(5K=20:00) = 49.8.
- mile_aero = VDOT_equiv(MILE) = 5:51.0.
- No short PB -> mile_pred = 5:51.0. Confidence LOW (+/- ~20s). Diagnosis defaults to ENDURANCE-TYPE.
**Case B: 20:00 5K + 60s 400.**
- mile_aero = 5:51.0 (351.0s). Balanced 400 for VDOT 49.8 is 1:18.7, so a 60s 400 is far faster than balanced -> strong SPEED-TYPE, mile is ENDURANCE-LIMITED.
- mile_speed = 60 * (1609.34/400)^1.07 = 4:26.1 (266.1s).
- blend = 0.75*351.0 + 0.25*266.1 = 329.8s = 5:29.8. Cap floor = 351.0*0.92 = 323.0s; blend > floor, so not capped.
- mile_pred = 5:30 (correction -21s vs aerobic-only). Confidence MEDIUM (+/- ~12s). Surface: aerobic ceiling is the limiter; build the engine.
**Case C (speed-type): 17:00 5K + 56s 400.**
- VDOT = 60.2. mile_aero = 4:56.5 (296.5s). Balanced 400 = 1:07.1, so 56s is much faster -> SPEED-TYPE.
- mile_speed = 56 * (1609.34/400)^1.07 = 4:08.4 (248.4s).
- blend = 0.75*296.5 + 0.25*248.4 = 284.5s = 4:44.5. mile_pred = 4:44 (correction -12s). Confidence MEDIUM.
**Case D (endurance-type as labelled): 18:30 5K + 64s 400.**
- VDOT = 54.6. mile_aero = 5:23.6 (323.6s). Balanced 400 = 1:12.9, so 64s is still faster than balanced (this runner also has real speed) -> SPEED-TYPE by the data.
- mile_speed = 64 * (1609.34/400)^1.07 = 4:43.9 (283.9s).
- blend = 0.75*323.6 + 0.25*283.9 = 313.7s = 5:13.7. mile_pred = 5:14 (correction -10s). Confidence MEDIUM.
Reality-check note for Case C vs D: these two do NOT project the same mile (4:44 vs 5:14). The mile is ~75 to 80% aerobic, so a 90-second 5K gap dwarfs an 8-second 400 gap. The honest output is two different miles reached by different routes, not an equal time.
**Case E (a genuine same-mile pair, different routes):**
- ENDURANCE-LIMITED runner: 17:03 5K (VDOT 60) + 76s 400. Balanced 400 is 1:07, so 76s is 9s SLOWER than balanced -> true ENDURANCE-TYPE (strong engine, weak gear). mile_aero = 4:56.5; mile_speed (76s 400) = 5:37.4; blend = 0.75*296.5 + 0.25*337.4 = 306.7s but speed term is SLOWER than aero so blend pulls toward slower: mile_pred = 5:07.
- SPEED-TYPE runner: 18:40 5K (VDOT 54) + 56s 400. Balanced 400 is 1:13.5, so 56s is 17.5s FASTER than balanced -> true SPEED-TYPE (modest engine, big gear). mile_aero = 5:26.6; mile_speed (56s) = 4:08.4; blend = 0.75*326.6 + 0.25*248.4 = 307.0s = 5:07.
- Both project ~5:07 by opposite routes: the endurance type rides a strong aerobic base despite a weak finish; the speed type rides a huge reserve despite a modest engine.
---
## 9. Anti-patterns and safety rules (DO-NOT, with numbers)
- **The endurance-typed amateur trap:** too much mileage, not enough speed. If a runner is `[ENDURANCE-TYPE]` and doing 0 R-pace or speed sessions, that is the fix, not more miles. Do not pile volume on a speed-limited miler.
- **The reverse:** all speed, no aerobic support. A `[SPEED-TYPE]` running zero threshold/CV and a tiny base will fade in the back half of every mile. Add aerobic support.
- **Racing every workout / no easy days:** enforce min rest/easy days (Section 2). If 3 of the last 7 days were RPE 8+, force an easy or rest day.
- **Stacking anaerobic sessions without CNS recovery:** never two anaerobic days adjacent; 72h between lactate-tolerance sessions. Hard guardrail.
- **Ramping plyometric / sprint / spike volume too fast:** Achilles, calf, soleus, hamstring injury. Cap: add at most 1 plyo set every 2 weeks; introduce spikes 1 short session/wk and hold for 3 weeks before adding; cap weekly sprint meters increase at 10%.
- **Skipping the aerobic base:** even the mile is aerobic-base-dependent. Never enter Specific without a completed Base for that athlete.
- **Peaking too early / holding a peak too long:** the sharp window is ~4 to 8 weeks. Time the Specific phase to end at the A-race; do not start race-pace work 12+ weeks out and try to hold it.
- **Ignoring the long warmup:** the mile warmup is a performance variable. Always prescribe the full warmup (Section 6).
- **High-intensity-load / ACWR guardrail (anaerobic-specific):** track an acute:chronic workload ratio on QUALITY load (count hard-interval meters or a session RPE-by-duration load), not just total volume. Sweet spot 0.8 to 1.3; flag and cut at > 1.5. Anaerobic and sprint work spikes ACWR faster than easy volume, so weight it: count 1 meter of sprint/R-pace as ~3x an easy meter for the ratio.
---
## 10. Feasibility / sanity check
Given a goal time + weeks-to-event + current fitness, judge realism and name the lever.
### Realistic improvement rates (mile)
| Tier | Per 8 to 12 week season | Per year (structured) |
|---|---|---|
| beginner | 20 to 40s | 40 to 90s |
| intermediate | 8 to 20s | 15 to 35s |
| advanced | 2 to 8s | 4 to 12s |
DEFAULT assumed gain when judging feasibility: beginner 25s, intermediate 12s, advanced 5s per properly structured 12-week block.
### Procedure (codeable)
1. Predict current mile (Section 8).
2. gap = current_mile - goal_mile.
3. available_gain = rate_for_tier * (weeks_to_event / 12).
4. Verdict:
   - gap <= available_gain: REALISTIC.
   - gap <= 1.5 * available_gain: STRETCH (possible with everything right).
   - gap > 1.5 * available_gain: UNREALISTIC at this timeline.
5. Name the limiter (from Section 5 diagnosis): if SPEED-LIMITED, the lever is speed work and R-pace; if ENDURANCE-LIMITED, the lever is aerobic support and volume. Always pair an UNREALISTIC verdict with the specific lever, more weeks, better economy, or a softer goal.
### Minimum training to support a goal mile
- Weeks: at least 8 (12+ preferred) of structured work.
- Quality sessions: 2/wk minimum (3 for advanced in Specific).
- Speed work: present year-round (strides + 1 speed/R session in Specific) for any goal faster than the current balanced mile.
- Weekly volume: at least the lower bound of the tier/event range (Section 2). A goal that needs aerobic support without the volume to back it is UNREALISTIC; name volume as the lever.
### Gap diagnosis (speed vs endurance)
Run the Section 5 diagnosis on the GOAL: compute the balanced 400 for the goal-mile VDOT and compare to the athlete's actual 400. If the athlete's 400 is slower than the goal's balanced 400, the gap is a SPEED gap (prescribe speed). If the athlete's 5K-VDOT is below the goal-mile VDOT, the gap is an ENDURANCE gap (prescribe aerobic support and volume). State which, explicitly, in any feasibility verdict.
---
## 11. Source attribution
- Jack Daniels, Daniels' Running Formula: VDOT, R/I/T paces, the equivalent-performance model (Daniels-Gilbert VO2 and percent-max equations used to compute every pace and equivalent time in this document).
- Frank Horwill: the British five-pace system (training across 400 to 5K paces in one program).
- Sebastian and Peter Coe: multi-tier multi-pace training, the speed-end emphasis for the 800/1500.
- Renato Canova: special endurance, race-pace-anchored work.
- Arthur Lydiard: aerobic base then sharpening, the phase logic.
- Steve Magness, The Science of Running: speed-vs-endurance development and economy.
- Tom "Tinman" Schwartz: critical velocity for aerobic support.
- Anaerobic Speed Reserve literature (Bellinger, Sandford, Bachero-Mena, Billat vVO2max): the MSS / vVO2max / ASR framework and 800m runner profiling.
- Tim Gabbett: acute:chronic workload ratio guardrails.
- Pete Riegel: the endurance time-prediction exponent model (used with middle-distance-specific exponents computed here).
> Persona-scoping reminder: the factor tables in this document (VDOT pace table, ASR-by-tier, W_AERO and K_SPEED constants, Riegel exponents, volume ranges) are scoped to the middle-distance persona ONLY. Do not let them leak into the 5K/10K, half, marathon, ultra, or triathlon personas, and do not import those personas' factor tables here.
