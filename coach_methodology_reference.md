# Endurance Coaching Reference: Ironman (140.6) & Half-Ironman (70.3)

> Codeable methodology reference for plan generation + race-time projection.
> Every rule maps to a function or constant. IM = Ironman 140.6, HALF = Half-Ironman 70.3.
> Differences marked **[IM vs HALF]**. Sources: Friel, Daniels (VDOT), Coggan (power/IF/TSS),
> Seiler (polarized), Sutton & Dixon (long-course race-pace), Riegel (endurance time model).
> Gathered 2026-05-23 via external research model for the Stryxs coach overhaul. Em-dash-free.

---

## 1. PERIODIZATION MODEL

### 1.1 Phase definitions (macro)
| Phase | Goal | Volume | Intensity | Key sessions |
|---|---|---|---|---|
| Base | Aerobic engine, durability, technique, general strength | High, rising | Mostly Z1-Z2 | Long aerobic rides/runs, drills, strength 2x |
| Build | Race-specific fitness | Plateaus, then slightly declines | Z3-Z4 rises, race-pace work, bricks | Threshold/sweet-spot, race-pace bricks |
| Peak | Sharpen, race-simulate | Drops 20-40% | Held high, short and sharp | Race-sim brick, short race-pace efforts |
| Taper | Shed fatigue, keep fitness | Drops 40-60% | Maintained (short doses) | Frequency kept, durations cut |
| Race | Execute | Minimal | Openers only | 1 short brick + openers |

Macro = whole plan to race day. Meso = a phase (3-5 weeks). Micro = one week.

### 1.2 Phase-duration scaling by weeks-to-race (deterministic)
```
taper_weeks  = IM  ? (weeks < 20 ? 2 : 3) : (weeks < 20 ? 1 : 2)   // includes race week
peak_weeks   = weeks >= 24 ? 2 : 1
remaining    = weeks - taper_weeks - peak_weeks
build_frac   = IM ? 0.40 : 0.45                                    // HALF skews more to Build
build_weeks  = round(remaining * build_frac)
base_weeks   = remaining - build_weeks
```
IM: 16wk→B8/Bu5/P1/T2 · 24→12/7/2/3 · 36→20/11/2/3 · 52→30/16/3/3
HALF: 16→7/6/1/2 · 24→11/9/2/2 · 36→18/13/2/3 · 52→27/19/3/3
Base ~45-50% (IM) / ~42-48% (HALF). IM gets more Base + longer Taper; HALF more Build.

### 1.3 Phase boundaries from time-to-race (count backward from race day)
```
race_week_start = race_day - 6 days
taper_start     = race_day - taper_weeks*7
peak_start      = taper_start - peak_weeks*7
build_start     = peak_start  - build_weeks*7
base_start      = build_start - base_weeks*7   // = plan start
```
weeks<12: compress, don't skip Base. Min viable: Base>=4, Build>=3, Peak 1, Taper 1-2. Below 8 weeks = "prep/damage-control", not a true build.

---

## 2. WEEKLY STRUCTURE & PROGRESSION RULES (core)

### 2.1 Max week-to-week volume increase
| Experience | % cap | Absolute cap |
|---|---|---|
| Beginner (<1 yr) | 5-8% | +2.0 h/wk |
| Intermediate (1-3 yr) | 8-10% | +2.5 h/wk |
| Advanced (3+ yr) | 10-15% | +3.0 h/wk |
Apply BOTH caps, take the smaller. 10% rule is the intermediate ceiling, not a target.

### 2.2 Deload cadence
| Profile | Cadence | Volume cut |
|---|---|---|
| Beginner / masters / time-crunched (student) | 2:1 | to 50-60% (reduce 40-50%) |
| Standard | 3:1 | to 55-65% (reduce 35-45%) |
| Advanced | 3:1 or 4:1 | to 60-70% (reduce 30-40%) |
Deload = cut duration, keep frequency + a little intensity. Next loading week resumes near pre-deload load (R7), not a fresh spike.

### 2.3 Rest days
| Experience | Base | Build/Peak | Floor |
|---|---|---|---|
| Beginner | 2 | 2 | >=1 always |
| Intermediate | 1-2 | 1 | >=1 always |
| Advanced | 1 | 1 (0 only in deliberate peak w/ easy substitutes) | >=1 strongly preferred |
EVERY week has >=1 full rest day for age-groupers, every phase. Non-negotiable.

### 2.4 Sessions/day & doubles
Hard cap 2/day for age-groupers; 3+ forbidden. Double OK when: within daily cap AND differ in sport/intensity AND >=1 is Z1-Z2. Harmful when: two hard same day (non-advanced), stacked back-to-back, or only to inflate volume.

### 2.5 Daily duration caps
| Experience | Max single | Max total/day |
|---|---|---|
| Beginner | 2.5 h | 3.0 h |
| Intermediate | 4.0 h | 5.0 h |
| Advanced | 6.0 h | 7.0 h |

### 2.6 Weekly hours -> sessions + sport split
| Weekly hrs | Sessions | Doubles |
|---|---|---|
| <6 | 5-6 | none |
| 6-9 | 7-9 | 0-1 |
| 9-12 | 9-11 | 1-2 |
| 12-15 | 11-13 | 2-4 |
| 15-20 | 13-16 | required |
Sport split by time: IM Swim 20-25 / Bike 50-55 / Run 25-30. HALF Swim 20-25 / Bike 45-50 / Run 28-32.

### 2.7 Intensity distribution by phase (measure by time-in-zone)
| Phase | Z1-Z2 | Z3 | Z4-Z5 | Model |
|---|---|---|---|---|
| Base | 88-92% | 3-5% | 5-8% | Polarized |
| Build | 78-82% | 8-12% | 8-12% | Pyramidal-leaning |
| Peak | 72-78% | 8-10% | 14-18% | Polarized + sharpen |
| Taper | 80-85% | 5-10% | 8-12% | Maintain |

### 2.8 GUARDRAILS (the rest-spike fix) — boolean validators, week N vs N-1
- R1: rest_days(week) >= 1 always. Never 0 for age-groupers.
- R2: abs(rest_days(N) - rest_days(N-1)) <= 1.
- R3: sessions_per_day <= 2 everywhere. Reject 3+.
- R4: sessions(N) - sessions(N-1) <= 2.
- R5: hours(N) <= hours(N-1)*(1+pct_cap) AND hours(N)-hours(N-1) <= abs_cap (2.1).
- R6: no two consecutive days each with a key/hard session of the same sport/energy system; insert easy/rest.
- R7: after a deload, baseline R5 off pre_deload_hours, not the dip.
- R8: max consecutive training days before rest: 3 (beg), 4 (int), 5-6 (adv).
- R9: long session grows <=20%/wk (and <= +25 min run / +30-45 min ride).
- R10: Z3+ time <= phase ceiling (never >~20% in any non-peak week).
Example caught: wk N = 3 rest/5 sess/6h; proposed N+1 = 0 rest/18 sess/14h violates R1,R2,R4,R5,R8. Validator caps it to ~2 rest/7 sess/6.5h.

---

## 3. ZONES

### 3.1 HR from LTHR (run & bike separate; bike LTHR ~5-10 bpm lower)
Run %LTHR: Z1 <85 · Z2 85-89 · Z3 90-94 · Z4 95-99 · Z5 >=100
Bike %LTHR: Z1 <81 · Z2 81-89 · Z3 90-93 · Z4 94-99 · Z5 >=100
Power (Coggan %FTP) preferred for bike: Z1<55 Z2 56-75 Z3 76-90 SS 88-94 Z4 91-105 Z5 106-120 Z6>120.
Example (run LTHR 182, bike 168): Run Z1<155 Z2 155-162 Z3 164-171 Z4 173-180 Z5>=182; Bike Z1<136 Z2 136-150 Z3 151-156 Z4 158-166 Z5>=168.

### 3.2 Swim from CSS
CSS_speed = (400-200)/(t400-t200); pace s/100m = 100/CSS_speed.
Z1 CSS+6..+10 · Z2 CSS+4..+6 · Z3 CSS+1..+3 · Z4 CSS-2..+2 · Z5 CSS-3..-6.
Example (CSS 1:56=116s): Z1 2:02-2:06 Z2 2:00-2:02 Z3 1:57-1:59 Z4 1:54-1:58 Z5 1:50-1:53.

---

## 4. SESSION LIBRARY (durations Base/Build/Peak)

### 4.1 Swim
Technique Z1-Z2 1500/1500/1200m. Endurance Z2 2000-2500/2500/2000m. CSS/threshold Z4 8-10x100/6-8x150-200/10x100@CSS. VO2 Z5 8-12x50/10x50-75/8x50. Long Z2 2500/3000/2500 [IM]; 2000-2500 [HALF]. Open-water/race-pace Z3-Z4 1500-3800[IM]/1500-1900[HALF]. IM swim 3.8km, HALF 1.9km. Build >=1 continuous swim to ~80-100% race distance before taper.

### 4.2 Bike
Recovery Z1<55% 30-45min. Endurance/long Z2 56-75% (below). Tempo Z3 76-90% 2-3x15/3x20/2x20. SweetSpot 88-94% 2-3x12/3x15-20/2x20. Threshold Z4 91-105% 3x8/2-3x15/3x10. VO2 Z5 106-120% 5-6x3/5x4/4x4. Race-pace IM IF 0.68-0.75 / HALF 0.80-0.85, 60-120/90-180/60-90min.
Long ride: IM Base 3.0-3.5h, Build 5.0-6.0h. HALF Base 2.0-2.5h, Build 3.0-3.5h.

### 4.3 Run (Daniels E/M/T/I/R)
Recovery E/Z1 25-40. Easy E/Z2 40-60. Long E-M/Z2 (below). Tempo M/Z3 20-30/30-40/20-30. Threshold T/Z4 3x5/4-5x5-6/3x6. VO2 I/Z5 5x3/6x3/5x3. Strides R 6-8x20s. Brick run race-pace Z2-Z3 15-45min off bike.
Long run: IM Base 1:30-1:45, Build 2:15-2:45 (cap ~2:45-3:00). HALF Base 1:00-1:15, Build 1:30-1:45. Cap by TIME not distance; never exceed ~3:00.

### 4.4 Bricks
Base every 2-3wk: 90min+15 [IM] / 60min+15 [HALF]. Build weekly: 3-5h+30-45 @racepace [IM] / 2.5-3h+30 [HALF]. Peak 1-2 total: race-sim 3-4h+45-60 [IM] / 2-2.5h+30-40 [HALF]. Brick run at race effort or EASIER, never a hard interval.

### 4.5 Strength
Base 2x/wk compound 3-4x6-10. Build 1x/wk maintenance+light plyo/core. Peak/Taper 0-1x/wk core+light. NO heavy legs within 48h of a key bike or long run; never the day before a long ride/run. If one fixed gym slot (e.g. Thursday legs): seat key run/ride >=48h away, day after gym = easy/rest.

---

## 5. ADAPTATION TO THE ATHLETE

### 5.1 Days/week
5d: Swim1 Bike2 Run2 (drop low-priority swim; protect long ride+run). 6d: 2/2/2 +1 brick. 7d: 2-3/3/2-3 (doubles; still 1 rest).

### 5.2 Hours budget
Allocate by sport split (2.6), fill from hours->sessions. Seat long ride + long run FIRST, then key swim, then aerobic volume, then intensity.

### 5.3 Experience/fitness
LTHR/CSS/FTP set absolute zones. PBs + longest recent sessions set STARTING long ride/run, grow per R9. Beginners: more frequency/lower duration, more rest, 2:1 deload, cap intensity. Advanced: more duration, 3:1/4:1, more Z4-Z5.

### 5.4 Injuries/equipment
Run injury -> bike/aqua-jog matched zone+duration. No pool -> open water or dryland cords+technique. No power -> HR+RPE sweet-spot. No trainer -> outdoor+terrain. Joint flag -> cut Z5 plyo, raise low-impact.

### 5.5 Default 6-day skeleton (1 rest; hard/long separated by easy)
Mon Rest · Tue Bike threshold/VO2 (key) + easy swim · Wed easy run + technique swim · Thu Strength(legs) + easy swim · Fri Run threshold (key) or easy · Sat LONG RIDE (+short brick run) · Sun LONG RUN (easy if Sat big).
Long ride+long run on consecutive weekend days only for intermediate+; beginners separate or make Sunday easy. Never two key same-system back-to-back (R6). Hard day -> easy/rest next (R8).

---

## 6. TAPER
IM: 2-3 wk. T-3 ~70%, T-2 ~55%, race wk ~35% of peak. Intensity maintained. Keep frequency, cut duration only.
HALF: 1-2 wk. T-2 ~60%, race wk ~40%. Intensity maintained.
40-60% volume cut + maintained intensity over 8-14 days = ~2-3% gain (Mujika/Coggan). Don't go flat. Race week: 1 short brick + daily openers (10-20min easy w/ 3-4x short race-pace pickups).

---

## 7. RACE-DAY EXECUTION

### 7.1 Pacing per leg
Swim: IM Z2 RPE6 smooth ("smallest time share; overswimming taxes bike+run for no payoff"). HALF Z2-Z3 RPE7 ("controlled, but you can spend a bit more, day is shorter").
Bike (power if avail; HR drifts): IM 0.68-0.75 NP, VI<1.05, low Z2 ("bike sets up the run; too hard = marathon collapses"). HALF 0.80-0.85 NP, VI<1.05, Z2-Z3 ("shorter run tolerates harder bike, but steady beats surging").
Run: IM start Z2/conservative first 8-10km, IM marathon effort, ~10-20%+ slower than open-marathon PR ("cumulative fatigue huge; even/negative split only thing that works"). HALF Z3/half tempo, ~10-20s/km slower than open-half PR ("start controlled, build; first 5km feels too easy on purpose").
VI = NP/AP; keep <1.05.

### 7.2 Fueling/hydration
Carbs/hr: IM 60-90 (up to 90-120 if gut-trained) · HALF 60-90. Fluid 500-750ml/hr. Sodium IM 500-1000mg/hr, HALF 400-800.
Bike = the eating leg (solid+liquid, bulk of fuel). Run = sips+gels. Start fueling on bike within 15-20min. IM gut-training to 90-120g/hr matters more (8-15h). Never trial new nutrition on race day.

---

## 8. RACE-TIME PROJECTION METHODOLOGY

### 8.1 Core formulas
Riegel: T2 = T1*(D2/D1)^1.06 (use 1.07-1.08 for less-trained / long extrapolations like 5K->marathon).
Daniels VDOT: v=dist_m/time_min; VO2=-4.60+0.182258*v+0.000104*v^2; pct=0.8+0.1894393*e^(-0.012778*t)+0.2989558*e^(-0.1932605*t) (t=min); VDOT=VO2/pct.
Critical Power/Speed: P(t)=W'/t+CP (CP~FTP). Bike race power target_NP=FTP*IF.

### 8.2 Tri projection
Run split (swingiest): from recent 5K/10K get VDOT or Riegel -> open marathon(IM)/open half(HALF), then apply tri fatigue factor:
- IM marathon: well-trained ~1.10, moderate ~1.15, first-timer 1.20-1.25.
- HALF run: well-trained ~1.05, moderate ~1.08-1.10, under-prepared 1.12-1.15.
Bike split: best = historical speed at target NP on similar terrain; else physics model P=0.5*rho*CdA*v^3+Crr*m*g*v+m*g*grade*v (rho~1.225, CdA 0.20-0.25 TT/0.25-0.32 road, Crr 0.004-0.005). Solve v at target_NP, time=dist/v, add wind/elevation buffer.
Swim split: race pace ~CSS + a few s/100m (IM slightly slower than HALF). time=(3800 or 1900)/pace, +2-4% sighting/non-wetsuit.
Transitions: T1+T2 ~3-10 min total (more for IM). finish = swim+T1+bike+T2+run.

### 8.3 Minimum data
Recent (<=8wk) run TT/race (5K/10K); FTP or recent long-ride NP/speed on known terrain; CSS test; longest recent ride+run; weeks of consistent volume.

### 8.4 Confidence (all must hold)
HIGH: all 3 sport benchmarks <=6-8wk; >=12wk consistent; long ride >=85% race duration + long run >=80% target done; prior same-distance race OR successful full race-sim brick.
MEDIUM: 2 of 3 benchmarks; 6-12wk data; some long sessions but not full target.
LOW: <6wk data, or >=1 missing benchmark, or no long sessions, or no race/brick history.

### 8.5 Communicating uncertainty
Always a RANGE not a point: HIGH +-3%, MEDIUM +-6-8%, LOW +-12-15%. State the label + exactly which data raises it ("add a recent 10K and a 4h ride -> HIGH"). Never present LOW as a promise; phrase as a current-fitness estimate that improves with data.

---

## 9. ANTI-PATTERNS (DO-NOT)
1. Don't raise volume above the experience % cap or absolute hours cap.
2. Don't schedule 0 rest days. Floor >=1/wk every week.
3. Don't schedule >2 sessions/day. 3-4/day forbidden.
4. Don't swing rest days by >1 week-to-week (R2).
5. Don't place two key/hard same-system sessions on consecutive days (R6).
6. Don't exceed ~20% weekly time in Z3+ outside peak.
7. Don't grow any long session >20%/wk (R9).
8. Don't skip deloads beyond a 3-4 week cadence.
9. Don't do heavy-leg strength within 48h of a key bike or long run.
10. Don't crash-taper (IM <10 days) or fully rest into a race.
11. Don't introduce new gear/shoes/nutrition on race day.
12. Don't prescribe IM bike >0.80 IF or HALF >0.88 IF (run-killer).
13. Don't treat a deload trough as the new baseline (R7).

---

## 10. FEASIBILITY / SANITY CHECK

### 10.1 Minimum training by goal
| Goal | Min wk hrs | Peak wk hrs | Long ride | Long run |
|---|---|---|---|---|
| IM finish (<17h) | 8-10 | 12-15 | 5-6 h | 2:30-2:45 |
| IM competitive (sub-12->sub-10) | 12-15 | 15-20+ | 5-6 h | 2:30-3:00 |
| HALF finish | 6-8 | 9-11 | 3-3.5 h | 1:30-2:00 |
| HALF competitive (sub-5) | 10-12 | 12-14 | 3-3.5 h | 1:30-1:45 |

### 10.2 Feasibility algorithm
```
predicted = project_finish(current_fitness)
gap_pct   = (predicted - goal) / predicted     // + = goal faster than current
realistic_improvement(weeks, experience):
  beginner ~0.6-1.0%/wk, cap ~12-15%/season
  intermediate ~0.3-0.5%/wk, cap ~6-8%/season
  advanced ~0.1-0.3%/wk, cap ~2-5%/season
if gap_pct > realistic_improvement: FLAG "goal unlikely"
if available_weekly_hours < min_hours(goal): FLAG "insufficient volume"
weeks_needed = (required_long - current_long)/max_safe_increment(R9); +25% for deloads
if weeks_needed > weeks_available: FLAG "cannot build endurance safely in time"
```

### 10.3 Verdict
No flags + conf HIGH/MED = Realistic. gap within 1.5x realistic + volume OK = Stretch but doable. Volume short OR long-build too slow = Adjust goal/add weeks. gap > 2x realistic = Unrealistic this cycle (propose finish goal + faster target next season).
Always pair "unrealistic" with the specific lever: more weeks, more hours, or softer goal. Truth even when it disappoints.

---
*Each table/formula maps to a constant, lookup, or validator in the plan generator + projection engine. First encoded for Ironman + 70.3; reuse the research workflow for marathon+half, 5K/10K+general, sprint/olympic next.*
