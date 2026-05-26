# Endurance Coaching Reference, Part 3: Short Course (Sprint & Olympic), Adaptive + Advanced

> Round-2 research (Noah-run, 2026-05-24). Companion to the short_tri round-1 reference (`coach_methodology_reference_short_tri.md`) and the long-course Parts 1-2. SPRINT = 750m swim / 20km bike / 5km run. OLY = 1500m / 40km / 10km. Differences marked **[SPRINT vs OLY]**. Every rule keys off real athlete fields and maps to code. No em-dashes.
> Grounding: Friel (TTB), Sutton (short-course intensity), Dixon (Purple Patch race-specificity), Seiler (polarized), Coggan (power/NP/IF/TSS), Daniels (VDOT/run paces), Riegel (time model).
> Base athlete used in worked examples: 5K PB 21:12 (1272s, VDOT 46.5), FTP 210 W, aerobic ~26 km/h, CSS 1:56/100m (116 s/100m), intermediate, 75 kg. Physics model: `P = 0.18375*v^3 + 3.679*v` (CdA 0.30, Crr 0.005, m 75, rho 1.225); race speed = flat speed * course_factor (default 0.85, range 0.80 hilly/windy to 0.92 flat/fast).

> ENCODE STATUS (2026-05-24, rounds 17-18): ENCODED — (1) §1.1 adaptive intensity-vs-volume fork (generatePlan priorWeekContext, gated to short_tri); (2) §A3/B2/§7 run-speed/speed-reserve rule (short_tri plan block); (3) §8 proactive triggers for short course = the SWIM-NEGLECTED (any triathlete, no swim in 14 days) and BRICK-NEGLECTED (sprint/olympic, no same-day bike+run in 14 days) nudges in the FRONTEND `buildProactiveNudges` (index.html v88); (4) §4.6 BRICK-RUN OVERRIDE in `_brickFatigue`/`computeTriProjection` — a recent (<=28d) race-effort brick run (same-day as a bike, >=50% of race-run distance, avg HR >= 90% run LTHR, measured factor clamped to [1.00,1.15]) replaces the modeled fatigue factor with the measured one and bumps short-course confidence to HIGH (run leg now measured); verified additive (no brick = round-16 numbers unchanged) and the HR/distance gates reject easy/short bricks. STILL DEFERRED (Noah's call): (a) the §4 physics bike model + revised constants — round-16 projection deployed+verified to the second, sub-minute difference, switching = churn + breaks round-1 unit tests; (b) §8 over-biking / transition-lag / no-speed-reserve nudges (need brick-vs-plan pacing, transition timing, or projection-pace-vs-PB data not cleanly available in the nudge context); (c) §2 in-session / §3 weekly day-by-day templates (engine adapts placement via prompt + R1/R3/R6 guardrails); (d) §5/§6 recovery+environment detail (chat knowledge + needs RHR/HRV we do not reliably have).

---

## CORE DIFFERENCE: SHORT COURSE IS INTENSITY-DRIVEN
Long course (Parts 1-2) is durability-limited: the lever is **volume**. Short course is power/threshold-limited: the lever is **intensity and frequency**, and weekly hours are far lower.

| | Sprint | Oly | (contrast: IM) |
|---|---|---|---|
| Typical weekly hours | **4-8** (default 6) | **6-10** (default 8) | 8-20 |
| Limiter | VO2max, threshold, speed, transitions | threshold + aerobic | aerobic durability + fueling |
| Race bike IF (default) | **0.95** | **0.88** | 0.70 |
| Race run effort | ~5K race pace (off bike) | ~10K race pace (off bike) | marathon effort |
| Biggest "free" time | **transitions** | transitions + pacing | fueling + pacing |

**[SPRINT vs OLY]:** Sprint is run roughly 20-25% above Oly intensity across all three legs. Sprint rewards top-end speed and transition slickness; Oly rewards threshold and pacing discipline.

---

## A. REVIEW & EXTENSIONS

### A1. Running Critical Speed (CS)
From two run TTs (e.g. 1200m and 2400m, rested): `CS = (d2-d1)/(t2-t1)`, `D' = d1 - CS*t1`, predict `t(d) = (d-D')/CS`. CS ~= threshold ~= Daniels T pace. Default if only a 5K PB exists: T pace ~= 5K pace + 12-18 s/km (default +15).

### A2. Bike anaerobic capacity W'
`P(t) = W'/t + CP`, CP ~= FTP, W' typ. 15-25 kJ (default 20). A 30s surge at 150% FTP costs `(1.5*210-210)*30 = 3150 J`; ~6 matches before depletion. **[SPRINT vs OLY]:** draft-legal Oly = W' management is a real tactic; non-draft = ride steady, irrelevant.

### A3. Speed reserve (anti-pattern detector)
`speed_reserve = open_5K_pace / max_velocity_pace_from_strides`. If tri run pace is within ~5% of open 5K pace, NO reserve, will fade. Rule: open 5K should be comfortably faster than goal tri-run pace; if not, the limiter is run speed/economy, prioritize R-pace strides + VO2.

### A4. Open-water penalty
`ow_race_pace = CSS + dist_buffer + ow_penalty - wetsuit_bonus`. dist_buffer SPRINT +2 / OLY +3 s/100m; ow_penalty calm +2 / choppy +5 / rough +8 (default +2); wetsuit_bonus -3 to -5 (default -4 when legal); sighting +1.5% to swim time for poor sighting.

### A5. Transitions are a trained, measured field
Store T1/T2 as athlete metrics with targets. In an 80-min sprint, 90s saved is ~1.9%, larger than most 4-week fitness gains. First-class.

### A6. Cadence/economy
Run cadence 170-185 (default 180). Bike 85-95 rpm steady, 95-105 surges. Flag run cadence < 165 sustained.

### A7. Confidence can run HIGHER in short course
Short events compound less error than IM, so a well-benchmarked Sprint/Oly projection can legitimately reach HIGH. New variance source is **tactical** (draft-legal pack), not endurance. Draft-legal Oly caps at MEDIUM unless pack-making history exists. [NOTE re our encode: round-1 caps short course at MEDIUM because the app cannot verify a logged brick + open-water swim; revisit if we add those signals.]

---

## B. EXPERT OPINION (ranked by impact)
1. **Transition training as a discipline.** Target AG: [SPRINT] T1 45-90s, T2 30-60s; [OLY] T1 60-120s, T2 45-75s; elites sub-45s. Prescribe transition reps in Build/Peak, track actual vs target.
2. **Run-speed / neuromuscular development.** Strides (6-10x20s @R), hill sprints (6-8x8-10s), VO2/3K-pace. These ARE the run engine for a 5K off the bike.
3. **Open-water race craft.** Mass-start positioning, drafting on feet/hip (saves 10-20%), sighting every 6-10 strokes, buoy turns, dolphin dives. Pool-fit athlete loses 1-3 min to poor craft.
4. **Pacing discipline on a short bike.** Hard ceiling + first-5-min-controlled rule. Highest-yield pacing rule in short course.
5. **Draft-legal vs non-draft profile flag.** Completely different bike training + race model. Generator must branch.
6. **Female-athlete cycle module (optional).** Follicular (d1-14): higher intensity capacity. Luteal (d15-28): +2-5 bpm RHR, heat sensitivity, more fatigue/fueling/iron needs. Schedule key VO2/threshold/testing in follicular; do not misread luteal HRV/RHR shifts as overtraining; raise carb/fluid in luteal + heat.
7. **Masters (40+).** 3:1 or 2:1 deload, +24-48h between hard, keep intensity (use-it-or-lose-it for VO2/power) but lengthen recovery + protect with strength/mobility. +1 recovery day vs younger same-tier.
8. **Youth / draft-legal development (<18).** Skills/speed/enjoyment over volume; cap weekly hours; watch RED-S/bone. Do not generate adult volume for a minor.
9. **Mental/tactical racing.** Positioning into T1, who to ride with, when to surge, sprint finish. Race-plan rehearsal + speed reserve.
10. **Heat hits faster at short-course intensity.** Near-threshold effort accumulates thermal load fast. Heat pacing + pre-cooling matter even in a 1-hour race.

---

## 1. ADAPTIVE ADJUSTMENT (core engine for short course)
Inputs: per-session HR drift %, actual vs target pace/power/speed, completed-vs-planned, RPE + felt-tags, load model (CTL/ATL/TSB/ACWR), 2-3 week trend.

### 1.1 The short-course-specific decision (volume vs intensity) [ENCODED round 17]
```
diagnose():
  aerobic_ok   = (drift <= 6% on majority of Z2 sessions) AND (TSB > -20)
  quality_fade = key threshold/VO2 output down >3% at equal-or-higher RPE for 2 consecutive same-type sessions
  if quality_fade AND aerobic_ok:
      # intensity-specific fatigue, NOT global
      reduce INTENSITY next week: cut quality reps/volume 20-30% OR convert one of two weekly quality sessions to aerobic Z2.
      KEEP easy aerobic volume unchanged.
  elif drift high (>8% majority Z2) OR TSB < -25:
      reduce VOLUME 10-15%, intensity untouched (aerobic/global fatigue)
  elif both:
      early deload (1.3)
```

### 1.2 Full rule table
| Signal | Threshold (default) | Adjust NEXT week |
|---|---|---|
| Aerobic decoupling high | >8% majority Z2 | cut volume 10-15%, no intensity added |
| Quality fading, aerobic fine | key output -3% at >= RPE, 2 sessions | cut intensity 20-30% or 2 quality days -> 1 |
| Hit pace but RPE +2 | any key session | treat as fatigue, hold load, no progress |
| Easy creeping hard | >=2 "easy" with >15% time Z3+ | enforce easy (cap HR), cut volume 10% |
| Missed key BRICK | not done | do NOT stack; shortened brick on an easy day if <=2 days slack, else carry target to next week |
| Missed key bike/long ride | not done | no stacking; repeat target, hold progression |
| Completion < 70% | sessions missed | repeat week, no progress |
| Completion < 50% over 2 wks | sustained | step back one level; rebuild via detraining formula `last_load*0.97^days_off` |
| "sore" diffuse >=2 | symmetric DOMS | reduce eccentric/impact + recovery day |
| "sore" sharp/localized | any | injury flag: stop that sport, refer |
| "sick" tagged | any | above-neck easy only, below-neck no training |
| "flat" >=2, no other flags | + no RHR/HRV red | likely under-fuel/under-sleep, check before cutting |

### 1.3 Load-model red flags
| Metric | Amber | Red | Response |
|---|---|---|---|
| TSB | -20 to -25 pre-quality | < -30 | Amber defer quality, Red force 1-2 rest/easy |
| ACWR | 1.3-1.5 | > 1.5 | Amber hold no new long/brick, Red cap to <= chronic, no new quality |
| CTL ramp | 6-8/wk | > 8/wk | reduce so ramp <= 5-7 |
| Drift | 6-8% majority | > 8% 2 wks | early deload (-40 to -50%, intensity off, 5-7 days) |
| RHR/HRV | 1 day off | 2 days RHR +7 OR HRV below range | Red rest today; if persists, deload week |

Early-deload trigger (any one): Red TSB, ACWR > 1.5, drift > 8% two weeks, 3+ overreach flags, or quality-fade + flat/sore together.

### 1.4 Worked example
Oly Build, base athlete. Z2 runs drift 4-5%; TSB -12; two key bike thresholds 198/195 W vs 205 W target (down 3-5%) at RPE 8 (expected 7); a VO2 run faded last 2 reps; ACWR 1.25; no sore/sick; sleep normal. Diagnosis: aerobic_ok true, quality_fade true => INTENSITY-specific fatigue. Action: keep easy volume; bike 3x12 -> 2x12; second hard run -> easy aerobic (2 quality -> 1); brick at easier end; re-test bike threshold next week; no deload. Contrast: drift 10% + TSB -28 => opposite (cut VOLUME 10-15%, keep reduced intensity).

---

## 2. IN-SESSION STRUCTURE (templates + phase scaling)
WU/CD Z1-low Z2. These become workout-description strings.

### 2.1 Swim
| Session | WU | Main (default) | CD |
|---|---|---|---|
| Technique | 200 easy | 6x50 drill + 6x50 build @Z2, 15s | 100 easy |
| Endurance | 300 | 1-3x(300-600) Z2, 20s | 100 easy |
| CSS/threshold | 400 + 4x50 build | 10x100 @CSS, 10-15s (or 6x150) | 200 easy |
| VO2/speed | 400 + 4x25 fast | 16x50 @Z5 (CSS -3 to -6), 20-30s | 200 easy |
| OW race-craft | 300 + 4x50 build | 4-6x(100-200) race-pace + sighting/buoy turns + 1 mass-start surge | 200 easy |

### 2.2 Bike
| Session | WU | Main (default) | CD |
|---|---|---|---|
| Endurance | 15 min Z1->Z2 | Z2 steady | 10 min Z1 |
| Tempo | 15 min + 3x1 min | 2-3x15 min @Z3 (76-90% FTP), 5 min easy | 10 min Z1 |
| Threshold | 15 min + 3x1 min | (scaling below) | 10 min Z1 |
| VO2max | 15 min + 4x30s | 5-6x3 min @110-120% FTP, equal rec | 10 min Z1 |
| Anaerobic/surges (DL) | 15 min | 10-15x(30s @150% / 30s easy) | 10 min Z1 |
| Race-pace | 15 min | SPRINT 2-3x8-10 min @IF 0.95-1.0 / OLY 2x20 min @IF 0.85-0.90 | 10 min Z1 |

Threshold-bike scaling (FTP 210): Base 2x10 @95-100% (200-210 W); Build 3x12 @98-102% (206-214 W); Peak [OLY] 2x20 @100-105% (210-220 W); Peak [SPRINT] 3x8 @105-110% (220-231 W).

### 2.3 Run (Daniels)
| Session | WU | Main (default) | CD |
|---|---|---|---|
| Easy | 10 min ease | Z2 steady | 5 min |
| Tempo | 15 min E + 4 strides | 20-30 min @Z3/M | 10 min E |
| Threshold | 15 min E + 4 strides | 4-5x5-6 min @T, 60-90s jog | 10 min E |
| VO2 | 15 min E + 6 strides | (scaling below) | 10 min E |
| Strides/speed | within easy | 6-10x20s @R, full rec | within |
| Hill sprints | 10 min E | 6-8x8-10s max hill, walk down | 10 min E |
| Brick run | none (off bike) | settle cadence 5 min then race effort | 5 min walk |

VO2-run scaling (VDOT 46.5; I ~4:02/km, R ~3:42/km): Base 5x2 min @I; Build 5x3 min @I (or 6x800m); Peak [SPRINT] 8-10x400m @3K-5K pace; Peak [OLY] 5x1000m @5K-10K pace.

### 2.4 Brick (keystone)
| Phase | Freq | [SPRINT] | [OLY] |
|---|---|---|---|
| Base | every 2 wk | 45 min bike + 10 min run | 60 + 15 |
| Build | weekly | 40-50 min bike (last 15 @race IF) + 15-20 min run @race pace | 75-90 (last 30 @IF) + 20-30 |
| Peak | weekly | race-sim 25-35 min @0.95 + 12-15 min @5K effort | 55-70 @0.88 + 25-30 @10K effort |
First 5 min settle cadence then lock race effort. Never run the brick as intervals. Counts as BOTH hard bike + hard run.

---

## 3. KEY-SESSION PLACEMENT

### 3.1 Energy-system buckets
| Bucket | Includes | Min gap to repeat |
|---|---|---|
| HI-Run | run threshold/VO2/hills/race-pace/strides-heavy | 48 h |
| HI-Bike | bike threshold/VO2/surges | 48 h |
| Brick | bike->run at race intensity (counts as both) | 72 h to next HI-Run |
| Hard swim | CSS/VO2 (low systemic) | 24 h (can sit near hard bike/run) |
| Long-aerobic | longest ride/run | 48 h |
HI-Run capped 2/wk, never within 48h. Hard day -> next easy/rest (non-advanced). Heavy-leg strength >= 48h from key bike/run. Hard swim = flex.

### 3.2 Weekly templates (R rest, E easy, bold key; S swim B bike RUN run Br brick)
**6-day (default)**
| Phase | Mon | Tue | Wed | Thu | Fri | Sat | Sun |
|---|---|---|---|---|---|---|---|
| Base | R | **B thr** + S tech | RUN easy + S endur | E + Strength | RUN easy | **B endur (longest)** | **RUN longest** + strides |
| Build | R | **B thr** + S CSS | **RUN VO2** | S endur + Strength | E spin | **Br (race pace)** | RUN easy / **OW swim** |
| Peak | R | **B race-pace** + S | **RUN 5K/10K reps** | E + S race-pace | E | **Race-sim Br** | E or short **RUN** + strides |
| Deload | R | B easy + S | RUN easy | E + light Strength | R | B mod + short Br | E |

**5-day:** drop a swim + lowest-priority easy; protect brick + 1 key run + 1 key bike.
**7-day:** add doubles, keep >=1 true rest (masters keep 2). Logic: Tue HI-Bike + Wed HI-Run = different buckets (24h OK); Br Sat with 72h to next HI-Run; hard swim alongside hard days; Mon universal rest; no two HI-Run within 48h.

---

## 4. PROJECTION ENGINE: WORKED CASES (round-2 model; DEFERRED in code, see ENCODE STATUS)
> These use a physics bike model + slightly revised constants and produce numbers ~1 min off the round-1 engine that is currently deployed and verified. Kept here for reference; NOT encoded to avoid churn/regression. Revisit if switching to the physics model.

### 4.0 Base athlete reference
Open 5K 1272s; open 10K = 1272*2^1.06 = 2652s (44:12).
| Leg | SPRINT | OLY |
|---|---|---|
| Swim | (116+2)*7.5 = 885s (14:45) | (116+3)*15 = 1785s (29:45) |
| T1 | 90s | 120s |
| Bike NP | 210*0.95 = 200 W | 210*0.88 = 185 W |
| Bike speed | flat 34.7 *0.85 = 29.5 | flat 33.7 *0.85 = 28.6 |
| Bike time | 2442s (40:42) | 5035s (1:23:55) |
| T2 | 60s | 75s |
| Run factor | 1.06 | 1.07 |
| Run time | 1348s (22:28) | 2838s (47:18) |
| Total | 4825s = 1:20:25 | 9853s = 2:44:13 |
MEDIUM +/-7%: SPRINT 1:14:46-1:26:01; OLY 2:32:43-2:55:43. Run-fatigue defaults: [SPRINT] 1.04/1.06/1.08; [OLY] 1.05/1.07/1.10 (well-trained/default/under-prepared).

### 4.1 Swim-limited (CSS 2:15): SPRINT swim 17:08 (+2:23), total 1:22:48. Swim = cheapest time.
### 4.2 Strong cyclist/weak runner (FTP 280, 5K 26:00) OLY: bike 1:15:17, run 58:00. Run dominates; prioritize run.
### 4.3 Draft-legal vs non-draft OLY: non-draft 2:44:13; draft-legal IF pack made ~2:36:10 (bike *0.92, run factor 1.04). Bimodal: if dropped, often slower than steady non-draft. Cap confidence MEDIUM unless pack-making history.
### 4.4 Sprint->Oly step-up: bike feels easier (IF 0.95->0.88), run becomes the decider (10K off bike).
### 4.5 Mid-block FTP 210->225 OLY: bike 1:21:41, total 2:41:59 (saves 2:14). Re-run on any benchmark update.
### 4.6 Brick-run override [ENCODED round 18]: `measured_factor = actual_brick_pace / open_race_pace`. A recent (<=28d) race-effort brick run (same-day as a bike, >=50% race-run distance, avg HR >= 90% run LTHR, factor clamped [1.00,1.15]) replaces the default and narrows the run band + bumps confidence to HIGH. Verified additive: no brick = unchanged round-16 numbers; easy/short bricks rejected by the gates.

---

## 5. RECOVERY & READINESS
With sensors: RHR (+4-6 amber 1 day / +7 sustained 2 days red), HRV (1 day below range amber / 2-3 days red), sleep, mood (Hooper), TSB. Require 2+ corroborating signals before Red (unless illness). For cycling females expect a luteal shift, do not misread. Without sensors: pace/power at fixed HR declining, RPE creep, decoupling rising, TSB deeply negative, monotony >2.0, completion <70%, flat/sore tags. Response: Green proceed; Amber convert next hard to Z2; Red full rest, if persists convert week to deload + re-test.

---

## 6. ENVIRONMENT & LOGISTICS
Heat: cut power/pace 3-8% above ~20C; HR +~1 bpm/1C over 20C; hydrate 0.5-1.0 L/hr; pre-cool even for a 1-hr race; heat acclimation 60-90 min/day 10-14 days. Cold/wetsuit: legal cutoff ~24.5C (config), bonus -3 to -5 s/100m (default -4); below ~14C safety guidance. Altitude: above ~1500 m VO2max -1-2%/300 m, drive by HR/RPE; race <24h or >=14 days. Travel: ~1 day/zone. Hilly bike: control by NP, VI<1.05. Hot run: GAP + even effort, start 3-5% slower + negative split. Race week + race-morning checklist + the warm-up that matters (short course starts near threshold, so prime with surges + a pre-race jog/strides).

---

## 7. STRENGTH PROGRESSION (short course weights max-strength + power/plyo more than IM)
| Phase | Freq | Sets x reps | Load | Intent |
|---|---|---|---|---|
| Anatomical Adaptation (early Base) | 2-3 | 2-3 x 12-20 | 40-60% | tissue prep, 3-4 wks |
| Max Strength (late Base) | 2 | 3-5 x 3-6 | 80-95% | neural force, economy, 4-8 wks |
| Power/Conversion (Build) | 1-2 | 3-5 x 3-6 + plyo | 50-70% explosive | usable power + leg speed |
| Maintenance (Build->Peak) | 1 | 2-3 x 6-10 | 60-75% | maintain |
| Taper | 0-1 | core/bodyweight + jumps | light | sharp; stop heavy ~10 days out |
Lifts: squat, deadlift/RDL, single-leg, hip thrust, calf raise, Pallof, plank. Plyo in Build/Peak. Skip upper-body hypertrophy. Heavy legs >= 48h from key bike/run. Injury prevention per sport: run (10%/wk, cadence 170-185, calf/glute-med), bike (fit first, core), swim (high-elbow, rotator-cuff/scap).

---

## 8. PROACTIVE COACHING (FRONTEND: buildProactiveNudges; round 18 encoded swim-neglected + brick-neglected; rest deferred)
Throttle ~1-2/wk, suppress dupes within 14 days, pair every flag with a concrete action.
| Situation | Trigger | Intent |
|---|---|---|
| Brick neglected | 2-3 planned bricks missed in a row | keystone of short course; reschedule, do not stack |
| Swim neglected | no swim in 14 days | protect the cheapest time leg; slot 2 swims |
| Easy creeping hard | >=50% "easy" with >15% Z3+ over 2 wks | easy-day discipline |
| Threshold stalling | key output flat-or-down 2-3 sessions at >= RPE | back off intensity (rule 1.1) |
| ACWR spike | ACWR > 1.5 or CTL ramp > 8/wk | cap next week, no new long/brick |
| Form red | TSB < -30 or RHR/HRV Red 2 days | recovery day; probe sleep/stress/fuel |
| Over-biking | brick/race run pace fades while bike power above plan | controlled bike buys a faster run |
| No speed reserve | tri-run goal pace within ~5% of open 5K | add strides/VO2 |
| Transition lag | T1/T2 actual > target by >30s, 2 races | trainable free time |
| Race week | within 7 days | race-week + race-morning checklist + warm-up |
| New PB | benchmark improvement | reinforce; recompute projection |

---

*End of Part 3. Calibrate the two softest constants against real Stryxs data first: the run fatigue factors (4.0) and the quality-fade / drift thresholds that switch the coach between cutting intensity vs cutting volume (1.1-1.3).*
