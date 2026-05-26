# Short-Course Triathlon Methodology Reference (Sprint + Olympic)

> Research-backed reference (Noah-run, 2026-05-24, round 16). Encode into the `short_tri` persona. Distances: **Sprint** = 750 m swim / 20 km bike / 5 km run. **Olympic** = 1500 m swim / 40 km bike / 10 km run.
> Core framing: short course is raced **AT or ABOVE threshold**. It is intensity-driven, not volume-driven. Every rule below tilts hotter than Ironman. Three tiers throughout: **beginner / intermediate / advanced**.
> Sources keyed inline: Friel (short-course), Sutton, Dixon (Purple Patch), Seiler (intensity distribution), Coggan (power/IF), Daniels (VDOT run paces), Riegel (run prediction).
> No em-dashes in any of this (house rule), so it is safe to surface in Coach output.
> PERSONA-SCOPED: these factor tables (fatigue, race factor, swim buffer, T1/T2, defaults) are SHORT COURSE ONLY. Do NOT let them leak into ironman / ironman_70_3 (they use 1.12-1.20 fatigue and sub-threshold pacing).

---

## 1. PERIODIZATION MODEL

**Phase order:** Base -> Build -> Peak -> Taper -> Race. (Friel short-course, Dixon.)

- **Base:** aerobic engine, technique, durability, strength. Mostly Z1-Z3.
- **Build:** the meat of short course. Threshold + VO2 race-specific work, bricks come online.
- **Peak:** sharpening. Lower volume, race-pace specificity, full speed at race intensity.
- **Taper:** shed fatigue, keep sharpness.

### Phase durations by weeks-to-race

| Weeks to race | Base | Build | Peak | Taper |
|---|---|---|---|---|
| 8  | 3 | 3 | 1 | 1 |
| 12 | 4 | 5 | 2 | 1 |
| 16 | 6 | 6 | 2 | 2 |
| 24 | 9 | 9 | 3 | 3 |

**Phase-boundary rule (codeable):** Taper = last 1 week (Sprint) or 1 to 1.5 weeks (Olympic). Peak = the (Taper) weeks before that, sized 1 (8 wk) up to 3 (24 wk). Base = `round(0.40 * remaining)`. Build = whatever is left. Floor any phase at 1 week; if total is too small to fit Base+Build+Peak+Taper, collapse Peak into late Build first, then shrink Base.

**Minimum viable build (first-timer):**
- Sprint: 8 weeks absolute floor, 12 weeks realistic.
- Olympic: 12 weeks floor, 16 weeks realistic.
- Below the floor, the plan is a "complete the distance" plan, not a "perform" plan. Flag it.

### Intensity mix shift vs Ironman

| | Ironman (reference) | Short course |
|---|---|---|
| Base | ~85-90% easy | ~80% easy |
| Build | ~80% easy (polarized) | ~65% easy, 20%+ at/above threshold |
| Peak | ~80/20 | ~60% easy, 28%+ at/above threshold |
| Race intensity | sub-threshold (Z2-low Z3) | at/above threshold (Z4-Z5) |

Short course inverts the Ironman emphasis: protect aerobic base in Base phase, then deliberately run hot in Build/Peak because the race itself is held above threshold.

---

## 2. WEEKLY STRUCTURE & PROGRESSION RULES (hard numbers)

### Max safe week-to-week volume increase

| Tier | Max weekly volume ramp |
|---|---|
| Beginner | 5 to 8% |
| Intermediate | 8 to 10% |
| Advanced | 10 to 12% |

Guardrail: never ramp two consecutive weeks at the tier max. Pattern is ramp, ramp, hold-or-deload. Cap any single-week jump at +12% regardless of tier.

### Deload cadence and cut

| Tier | Cadence | Volume cut |
|---|---|---|
| Beginner | every 3rd week (2:1) | cut 30 to 40% |
| Intermediate | every 3rd to 4th week (3:1) | cut 25 to 35% |
| Advanced | every 4th week (4:1) | cut 20 to 30% |

On a deload, hold or slightly reduce intensity frequency but keep one or two short race-pace touches so sharpness is not lost. Cut duration, not the quality stimulus entirely.

### Rest days per week

| Tier | Base | Build | Peak | Taper |
|---|---|---|---|---|
| Beginner | 2 to 3 | 2 | 2 | 2 to 3 |
| Intermediate | 1 to 2 | 1 | 1 | 2 |
| Advanced | 1 | 1 | 0 to 1 (active) | 1 to 2 |

At least 1 full rest day per week for everyone, always. Active recovery (very easy spin or swim) does not count as a rest day for beginners.

### Sessions per day / doubles

- Beginner: **1 session/day**. No doubles.
- Intermediate: doubles OK 1 to 2 days/week (for example AM swim + PM easy run). Never two hard sessions on the same day.
- Advanced: doubles OK 2 to 4 days/week. At most one quality session per day.

**Doubles are harmful when:** two intensity sessions stacked same day, total sleep under 7 h, or the second session is added to "make up" a missed one. A double is fine only when the second is clearly aerobic/technique and recovery is intact.

### Weekly hours budget -> sessions

Confirmed ranges: **Sprint ~5 to 9 h**, **Olympic ~7 to 12 h** are typical. Floors for "perform" (not just finish): Sprint 5 h, Olympic 7 h.

| Hours/wk | Total sessions | Swim | Bike | Run |
|---|---|---|---|---|
| 5 | 6 to 7 | 2 | 2 | 2 to 3 |
| 7 | 7 to 9 | 2 to 3 | 3 | 3 |
| 9 | 9 to 10 | 3 | 3 to 4 | 3 to 4 |
| 11 | 10 to 12 | 3 to 4 | 4 | 4 |
| 12 | 11 to 13 | 3 to 4 | 4 to 5 | 4 |

Per-session duration rule of thumb: swim 30 to 60 min, bike 45 to 120 min (one longer ride/wk), run 30 to 75 min (one longer run/wk). Keep at least one short ride and one short run for quality.

### Sport-time split (% of weekly training time)

| | Swim | Bike | Run |
|---|---|---|---|
| Sprint | 25% | 40% | 35% |
| Olympic | 20% | 45% | 35% |

Swim is slightly over-weighted vs its race-time share because swim returns come from technique frequency, not volume.

### Intensity distribution by phase (% of weekly TIME)

Hotter than 80/20 in Build and Peak (Seiler polarized, pushed up for short course).

| Phase | Z1-Z2 (easy/aerobic) | Z3 (tempo) | Z4-Z5 (threshold/VO2) |
|---|---|---|---|
| Base | 80% | 12% | 8% |
| Build | 65% | 15% | 20% |
| Peak | 60% | 12% | 28% |
| Taper | 68% | 12% | 20% |

[SPRINT vs OLY] Sprint can run the hot end (Build hard share up to 25%, Peak up to 32%) because the race is shorter and more anaerobic. Olympic stays at the table values; pushing the hard share higher over 40 km/10 km risks under-fueling the aerobic base.

### Explicit load guardrails (codeable)

1. Weekly volume ramp <= tier max (above).
2. Hard time-in-zone (Z4-Z5) <= 30% in Build, <= 35% in Peak. Never exceed 35%.
3. No more than 3 quality (Z3+) sessions in any 7-day window for beginners, 4 for intermediate, 5 for advanced.
4. At least 48 h between any two same-sport hard sessions.
5. Mandatory deload if 3 consecutive build weeks done without one (force the cut).
6. At least 1 full rest day every 7 days, no exceptions.
7. Longest single session <= 50% of weekly volume.

---

## 3. ZONES

### Run HR zones from run LTHR (Friel)

| Zone | % run LTHR | Use |
|---|---|---|
| Z1 | < 85% | recovery |
| Z2 | 85 to 89% | aerobic endurance |
| Z3 | 90 to 94% | tempo |
| Z4 | 95 to 99% | threshold |
| Z5a | 100 to 102% | just over threshold |
| Z5b | 103 to 106% | VO2 |
| Z5c | > 106% | anaerobic |

### Bike HR zones from bike LTHR (Friel)

| Zone | % bike LTHR | Use |
|---|---|---|
| Z1 | < 81% | recovery |
| Z2 | 81 to 89% | aerobic endurance |
| Z3 | 90 to 93% | tempo |
| Z4 | 94 to 99% | threshold |
| Z5a | 100 to 102% | just over threshold |
| Z5b | 103 to 106% | VO2 |
| Z5c | > 106% | anaerobic |

Note: bike LTHR is typically 5 to 10 bpm below run LTHR for the same athlete. Never reuse run LTHR for bike zones.

### Bike power zones from FTP (Coggan, if FTP known)

| Zone | % FTP |
|---|---|
| Z1 Active recovery | < 55% |
| Z2 Endurance | 56 to 75% |
| Z3 Tempo | 76 to 90% |
| Z4 Threshold | 91 to 105% |
| Z5 VO2 | 106 to 120% |

### Swim zones from CSS (pace per 100 m; "+" = slower, "-" = faster)

| Zone | Offset from CSS | Use |
|---|---|---|
| Z1 recovery | CSS + 10 to 15 s/100 | easy |
| Z2 aerobic | CSS + 6 to 10 s/100 | endurance |
| Z3 tempo | CSS + 3 to 5 s/100 | sustained |
| Z4 threshold | CSS - 2 to + 2 s/100 | at CSS |
| Z5 VO2 | CSS - 2 to - 5 s/100 | fast reps |

### RACE zone held per leg

| Leg | Sprint | Olympic |
|---|---|---|
| Swim | Z4 (CSS to slightly above) | high Z3 to low Z4 |
| Bike | Z4 (IF ~0.93) | Z3 to Z4 (IF ~0.87) |
| Run | Z4 to Z5a (5K pace) | Z3 to Z4 (10K pace) |

---

## 4. SESSION LIBRARY

Zone targets reference Section 3. Durations are typical; scale by tier and hours budget.

### Swim

| Session | Zone | Base | Build/Peak | Purpose |
|---|---|---|---|---|
| Technique / drills | Z1-Z2 | 30 to 45 min, 1 to 2x/wk | 20 to 30 min warmup add-on | stroke economy, the cheapest swim gains |
| CSS intervals (threshold) | Z4 | 6 to 8 x 100 @ CSS | 8 to 12 x 100, or 3 to 4 x 200 @ CSS | raise critical swim speed |
| VO2 reps | Z5 | n/a | 10 to 16 x 50 fast / 15 to 20 s rest | top-end, race start speed |
| Aerobic endurance | Z2 | 1 x 800 to 1500 continuous | 1 x 1000 to 2000 | durability |
| Open-water skills | Z2-Z3 | as available | weekly in Build | sighting, drafting, start chaos |
| Race-pace swim | Z3-Z4 | n/a | race-distance set at goal pace | pacing calibration |

### Bike

| Session | Zone | Base | Build/Peak | Purpose |
|---|---|---|---|---|
| Endurance | Z2 | 60 to 120 min | 60 to 90 min | aerobic base, fat metabolism |
| Tempo | Z3 | 2 to 3 x 10 min | 3 to 4 x 12 min | sustained-effort durability |
| Threshold (FTP) | Z4 | 3 x 8 min @ 95% FTP | 3 to 4 x 10 to 15 min @ 95 to 100% FTP | raise FTP, the bike's currency |
| VO2 | Z5 | n/a | 5 to 6 x 3 min @ 110 to 120% FTP | top-end power |
| Over-unders | Z3-Z4 | n/a | 3 x (2 min over / 2 min under) FTP | clearing lactate at race surges |
| Race-pace TT | Z4 | n/a | race-distance at target IF | pacing + position practice |

### Run

| Session | Zone | Base | Build/Peak | Purpose |
|---|---|---|---|---|
| Easy aerobic | Z1-Z2 | 30 to 60 min | 30 to 45 min | base, recovery |
| Tempo | Z3 | 15 to 20 min continuous | 25 to 35 min | threshold support |
| Threshold (cruise intervals) | Z4 | 3 x 5 min | 4 to 5 x 5 to 8 min @ threshold | lactate threshold |
| VO2 / track (Daniels I-pace) | Z5 | n/a | 5 to 6 x 800 m or 5 x 1000 m | the engine for the run-off-bike |
| Strides | Z5 | 6 x 20 s after easy run | 6 to 8 x 20 s | neuromuscular, cheap and safe |
| Long run | Z2 | 60 to 75 min | 60 to 75 min (capped, short course) | durability, not the priority it is in IM |
| Race-pace run | Z4 | n/a | race-distance at goal pace | pacing |

### BRICK workouts (the short-course keystone)

- **Frequency:** Base 0 to 1 per 2 weeks (introduce late Base). Build 1/week. Peak 1/week including the race-pace simulation.
- **Why they matter more in short course:** the run-off-bike is held above threshold, so the bike-to-run transition is where short course is won or lost.

**Standard brick structure:** bike main set -> immediate transition (under 60 s) -> run. Build the run portion from short to race-relevant:
- Early Build: 45 to 60 min bike Z3 -> 10 to 15 min run building to Z4.
- Mid Build: race-distance bike portion at race IF -> 15 to 20 min run at race pace.

**Race-pace brick simulation [SPRINT vs OLY]:**
- Sprint: 20 to 25 min bike at race IF (~0.93) -> 3 to 5 km run at 5K race pace. Run the full 5K once or twice in Peak.
- Olympic: 40 to 60 min bike at race IF (~0.87) -> 4 to 6 km run at 10K race pace (do not run the full 10K off the bike in training more than once, fatigue cost is high).

**"Jelly legs" adaptation:** the heavy/wobbly feeling in the first 800 to 1500 m of the run is real (blood pooling, cadence mismatch). Train it: spin a higher cadence (90+ rpm) in the last 3 to 5 min of the bike, then run the first km at a deliberately controlled, slightly quick cadence. The adaptation comes from frequency of exposure, not one heroic brick.

### Transitions (T1/T2)

- Train them as their own drills. Rehearse the full sequence (wetsuit strip, helmet on before bike off rack, mount/dismount line, rack the bike, shoes/race belt) 5 to 10 reps in Peak.
- **Typical time cost (seconds), used as projection inputs in Section 8:**

| | Beginner | Intermediate | Advanced |
|---|---|---|---|
| T1 Sprint | 120 | 75 | 50 |
| T1 Olympic | 150 | 100 | 60 |
| T2 Sprint | 60 | 40 | 25 |
| T2 Olympic | 75 | 50 | 30 |

T1 is longer than T2 (wetsuit removal, longer run from water). Olympic T1/T2 are longer (bigger transition area, more disorientation after a longer swim).

### Strength

- Volume: Base 2x/week, Build 1x/week, Peak 0 to 1x/week (maintenance only), Taper 0.
- What: compound lower-body (squat, hinge, single-leg), core/hip stability, light plyometrics for run economy.
- Placement: on the same day as a hard bike/run if anything (consolidate hard days), never the day before a key bike or run.
- Avoid: heavy legs within 48 h of a key threshold/VO2 bike or run, or within 72 h of race.

### Open water vs pool skills

- **Sighting:** lift eyes every 6 to 8 strokes, "alligator eyes," practice in pool by sighting a fixed point.
- **Drafting:** legal in the swim and on draft-legal bike courses. Swim on feet or hip of a slightly faster athlete to save 5 to 10% energy.
- **Mass start:** practice starting hard then settling, contact tolerance, and a controlled first 100 to 200 m to avoid going anaerobic too early.

---

## 5. ADAPTATION TO THE ATHLETE

### Scale to available days/week

| Days/wk | Approach |
|---|---|
| 3 | one quality per sport, no doubles, bricks combine bike+run. Sprint only realistically. |
| 4 to 5 | full short-course plan, 1 to 2 doubles, weekly brick. Both distances. |
| 6 to 7 | advanced volume, multiple doubles, 2 quality bike + 2 quality run. |

### Scale to hours budget

Use the hours -> sessions map in Section 2. If hours are tight, cut **volume** (long easy work) first and protect the **quality** sessions (threshold/VO2/brick), because short course rewards intensity per hour.

### Scale to experience and current fitness

- Set zones from real benchmarks: run LTHR, bike LTHR (or FTP), swim CSS, recent run PB.
- If a benchmark is missing, use tier defaults (Section 8) and label confidence LOW until measured.
- Recent run PB drives the run projection and the run paces; refresh it every 4 to 6 weeks.

### Injuries / equipment

- Injury: shift load to the uninjured sports (swim is the usual safe harbor), drop run volume first since it carries the most impact load, keep aerobic stimulus via bike.
- Pool-only (no open water): add sighting drills and one "chaos" set; flag the swim projection one confidence step lower.
- Indoor trainer only: power-based bike work is fine and arguably better controlled; add 0 to 1 outdoor handling session before race if course is technical.

### Weekly placement (protect recovery)

Template (5 to 6 day week), spreading hard days and keeping easy/rest adjacent to them:

| Day | Session |
|---|---|
| Mon | Rest or easy swim (technique) |
| Tue | Key threshold/VO2 bike (+ optional easy run) |
| Wed | Easy run + CSS swim |
| Thu | Key run (threshold or VO2 track) |
| Fri | Easy swim or rest |
| Sat | Long ride or **brick** (the week's centerpiece) |
| Sun | Long run (capped) or 2nd swim/run |

Rules: key swim spread across the week (frequency matters), threshold bike and key run on separate days, brick and long ride consolidated, never two hard days back to back for beginners.

### Draft-legal (ITU) vs non-draft

- **Non-draft (most age-group):** ride at a steady race IF (Section 8), pacing discipline matters, aero position and sustained power win. Train steady threshold and TT efforts.
- **Draft-legal (ITU):** the bike becomes surge-and-coast in a pack; train repeatability (over-unders, 30/30s, repeated hard accelerations out of corners) and bike-handling in a group. The run, not the bike, decides the race, so weight run quality higher. The steady-state bike projection in Section 8 understates draft-legal bike speed; treat it as a floor.

---

## 6. TAPER

Short races over-taper easily: cutting too much volume or dropping intensity leaves athletes flat. Keep the sharpening.

| | Sprint | Olympic |
|---|---|---|
| Length | 5 to 7 days | 7 to 10 days |
| Volume cut | 40 to 50% | 40 to 60% |
| Frequency | keep (same number of sessions, shorter) | keep |
| Intensity | keep, 2 to 3 short race-pace touches | keep, 2 to 3 short race-pace touches |

Taper rules:
1. Cut duration, not frequency. Keep touching all three sports.
2. Keep short, sharp efforts (for example 3 to 4 x 90 s at race pace per sport across the week) to hold neuromuscular readiness.
3. Last hard session: Sprint 3 to 4 days out, Olympic 4 to 5 days out.
4. Do not introduce anything new (gear, fueling, sessions) in taper.
5. Slightly increase carbohydrate intake in the final 24 to 48 h, especially for Olympic.

---

## 7. RACE-DAY EXECUTION

### Pacing per leg

| Leg | Sprint target | Olympic target | One-line why |
|---|---|---|---|
| Swim | Z4, controlled first 150 m | high Z3 to low Z4 | swim is short, do not redline and blow the bike; settle fast |
| Bike | IF ~0.93, Z4 | IF ~0.87, Z3-Z4 | push hard but leave enough that you can still run fast; over-biking is the classic run-killer |
| Run | 5K race pace, Z4-Z5a | 10K race pace, Z3-Z4 | this is where the race is decided; negative-split the back half if anything |

Bike-to-run rule: aim to finish the bike feeling you could have gone "a little" harder. The cost of over-biking shows up exponentially in the run.

### Transition strategy

- T1: sight your bike rack location before the swim, wetsuit off in motion, helmet on before unracking, mount past the line.
- T2: rack, helmet off, shoes/belt, go. Practiced sequence saves 20 to 60 s of free time.

### Fueling / hydration per leg

| | Sprint | Olympic |
|---|---|---|
| Total race time | ~1 to 1.5 h | ~2 to 3 h |
| Carbs | 0 to 30 g/h (often just pre-race + water) | 30 to 60 g/h, mostly on the bike |
| Fluid | sip on bike, ~250 to 500 ml/h | 500 to 750 ml/h |
| Sodium | minimal | 300 to 700 mg/h, more in heat |

Sprint: pre-race carbs (1 to 2 g/kg in the 1 to 3 h before) usually cover the race; do not over-drink. Olympic: take most fuel on the bike where the gut tolerates it, run fueling is harder.

---

## 8. RACE-TIME PROJECTION METHODOLOGY (exact, unit-testable)

Total = Swim + T1 + Bike + T2 + Run. Compute each leg in seconds.

### Swim split

`swim_seconds = (CSS_s_per_100 + buffer) * (distance_m / 100)`

Buffer (s/100 m) added to CSS:

| | Beginner | Intermediate | Advanced |
|---|---|---|---|
| Sprint | +8 | +4 | +2 |
| Olympic | +10 | +6 | +3 |

Default CSS when missing (s/100 m): beginner 135 (2:15), intermediate 116 (1:56), advanced 95 (1:35). Drop confidence one step when a default is used.

### T1 / T2

From the transition table in Section 4 (seconds), keyed by tier and [SPRINT vs OLY].

### Bike split

Two paths; use ride data if available, else default speed.

`bike_speed_kmh = aerobic_speed_kmh * race_factor`
`bike_seconds = (distance_km / bike_speed_kmh) * 3600`

Race factor (multiplies the athlete's typical aerobic/Z2 speed):

| | Beginner | Intermediate | Advanced |
|---|---|---|---|
| Sprint | 1.08 | 1.13 | 1.18 |
| Olympic | 1.05 | 1.09 | 1.13 |

Bike IF (NP/FTP) the race is ridden at, for sanity-checking the speed:

| | Beginner | Intermediate | Advanced |
|---|---|---|---|
| Sprint | 0.88 | 0.93 | 0.98 |
| Olympic | 0.82 | 0.87 | 0.91 |

Default aerobic speed when no ride data (road bike, km/h): beginner 24, intermediate 28, advanced 32. Drop confidence one step when defaults are used. Draft-legal: treat the result as a floor (real speed higher).

### Run split

`open_run_seconds = PB_seconds * (target_dist / PB_dist) ^ 1.06`  (Riegel, exponent 1.06)
`run_seconds = open_run_seconds * fatigue_factor`

Short-course fatigue factor (much smaller than Ironman's 1.12 to 1.20):

| | Beginner | Intermediate | Advanced |
|---|---|---|---|
| Sprint | 1.06 | 1.03 | 1.01 |
| Olympic | 1.10 | 1.06 | 1.03 |

For Sprint the target run is 5 km; if the PB is a 5 km, Riegel returns the same time and only the fatigue factor applies.

### Minimum data + confidence

Minimum for a credible projection: at least a recent run benchmark (PB or LTHR-derived pace). Without it, run projection uses tier defaults and is LOW.

| Confidence | Criteria | Range |
|---|---|---|
| HIGH | all 3 benchmarks current (< 6 wk), >= 12 wk consistent, >= 1 race-pace brick logged, >= 1 open-water swim | beginner +/-6%, intermediate +/-4%, advanced +/-3% |
| MEDIUM | 2 to 3 benchmarks, 8 to 12 wk consistent, some brick work | beginner +/-9%, intermediate +/-6%, advanced +/-5% |
| LOW | < 2 benchmarks, < 8 wk data, or any default used | beginner +/-12%, intermediate +/-9%, advanced +/-8% |

NOTE (encode): the app does not track logged bricks or open-water swims, so HIGH is effectively unreachable and short course caps at MEDIUM when benchmarks are present. This matches the worked example.

### WORKED EXAMPLE

Athlete: 5K PB 21:12 (1272 s), bike 26 km/h aerobic (FTP ~210 W), swim CSS 1:56/100 m (116 s), ~10 weeks consistent, **intermediate**. Has all 3 benchmarks but no logged brick/open-water -> **MEDIUM, +/-6%**.

**SPRINT**

- Swim: (116 + 4) * (750/100) = 120 * 7.5 = **900 s = 15:00**
- T1 (intermediate, Sprint): **75 s = 1:15**
- Bike: speed = 26 * 1.13 = 29.38 km/h. time = (20 / 29.38) * 3600 = **2451 s = 40:51**. (Sanity: IF ~0.93 -> NP ~195 W, consistent with ~29 km/h on a road bike.)
- T2 (intermediate, Sprint): **40 s = 0:40**
- Run: target 5K = PB 5K, Riegel factor (5/5)^1.06 = 1. open = 1272 s. * 1.03 = **1310 s = 21:50**
- **Total = 900 + 75 + 2451 + 40 + 1310 = 4776 s = 1:19:36**
- MEDIUM +/-6% -> **~1:14:49 to ~1:24:22**

**OLYMPIC**

- Swim: (116 + 6) * (1500/100) = 122 * 15 = **1830 s = 30:30**
- T1 (intermediate, Olympic): **100 s = 1:40**
- Bike: speed = 26 * 1.09 = 28.34 km/h. time = (40 / 28.34) * 3600 = **5081 s = 1:24:41**. (Sanity: IF ~0.87 -> NP ~183 W over 40 km.)
- T2 (intermediate, Olympic): **50 s = 0:50**
- Run: target 10K. Riegel (10/5)^1.06 = 2^1.06 = 2.0848. open 10K = 1272 * 2.0848 = 2652 s = 44:12. * 1.06 = **2811 s = 46:51**
- **Total = 1830 + 100 + 5081 + 50 + 2811 = 9872 s = 2:44:32**
- MEDIUM +/-6% -> **~2:34:40 to ~2:54:24**

All values above are exact under the formulas; unit-test against them.

---

## 9. ANTI-PATTERNS / SAFETY RULES (DO-NOT, with numbers)

1. **Do not bury the plan in slow aerobic volume.** Opposite of the Ironman mistake. If Build/Peak hard time-in-zone is under 18%, the plan is too soft for short course. Target 20%+ (Build) and 28%+ (Peak).
2. **Do not go all-intensity with no base.** Hard time-in-zone over 35% in any week, or a Base phase under 2 to 3 weeks, leads to stagnation and injury. Keep Base aerobic at ~80% easy.
3. **Do not neglect the swim because it is "only 10 to 15% of the race."** A bad swim costs you the bike (anaerobic, panicked) and the run. Keep >= 2 swims/week, frequency over volume.
4. **Do not skip bricks/transitions.** At least 1 brick/week in Build and Peak; rehearse transitions 5 to 10 times before race. Untrained transitions cost 30 to 90 s of free time and a worse run-off-bike.
5. **Do not over-taper.** Cutting more than 60% volume or dropping intensity entirely leaves the athlete flat. Keep frequency and 2 to 3 race-pace touches.
6. **Do not spike load or skip recovery.** No weekly ramp over tier max (8/10/12%), no more than 3 build weeks without a deload, never zero rest days in a week.
7. **Do not over-bike.** Riding Sprint over IF ~0.98 or Olympic over ~0.92 trades a few bike seconds for a blown run that costs far more.
8. **Do not project off stale data.** Benchmarks older than 6 weeks drop confidence; flag it rather than overstate the prediction.

---

## 10. FEASIBILITY / SANITY CHECK

Given goal time + weeks-to-race + current fitness:

1. Project current best (Section 8). Compare goal to projection.
2. **Verdict bands:**
   - Goal within current projection +/- the confidence range -> **realistic now**.
   - Goal 0 to 8% faster than projection, with >= 8 weeks to train -> **achievable with the right plan**.
   - Goal 8 to 15% faster -> **stretch**, needs near-ideal training and time.
   - Goal > 15% faster, or weeks-to-race below the build floor -> **unrealistic for this race**; pair with a lever.

3. **Minimum training a goal requires:**

| | Sprint "perform" goal | Olympic "perform" goal |
|---|---|---|
| Weeks | >= 8 (12 ideal) | >= 12 (16 ideal) |
| Weekly hours | >= 5 | >= 7 |
| Quality sessions/wk | >= 3 (1/sport) | >= 4 |
| Longest brick | race-distance bike + 3 to 5 km run | 40 to 60 min bike + 4 to 6 km run |

4. **Always pair an "unrealistic" verdict with the specific lever**, do not just say no:
   - Not enough weeks -> "add N weeks" (move the goal race).
   - Volume too low -> "raise to X h/week."
   - Aerobic-heavy, soft plan -> "add threshold/VO2, raise hard share to 20%+."
   - Genuinely out of range -> "soften the goal to [projected time + small stretch]."

Reality-check rule (house): say the true verdict even if it disappoints, then immediately hand back the most useful lever.
