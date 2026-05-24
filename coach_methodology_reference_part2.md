# Endurance Coaching Reference, Part 2: Adaptive Coaching, Projection & Advanced Systems

> Companion to Part 1 (coach_methodology_reference.md). IM = Ironman 140.6, HALF = 70.3.
> Differences marked [IM vs HALF]. Every rule maps to code. Em-dash-free.
> Gathered 2026-05-23 (round 2). Calibrate the two softest constants against real Stryxs data
> first: the run fatigue factors (§4.4) and the decoupling/RPE deload thresholds (§1).

---

## A. EXTENSIONS TO PART 1

### A1. Load model (PMC) — the missing spine. Track load, not just hours.
Per-session load (best available source):
```
Bike (power):  TSS = (sec * NP * IF) / (FTP * 3600) * 100,  IF = NP/FTP
No power:      hrTSS / rTSS from threshold pace; OR
sRPE (Foster, universal fallback): load = sessionRPE(1-10) * duration_min
```
Rolling (Banister/Coggan), daily:
```
CTL (fitness) = 42-day EWMA of daily load
ATL (fatigue) = 7-day  EWMA of daily load
TSB (form)    = CTL_yesterday - ATL_yesterday
```
| TSB | Meaning | Use |
|---|---|---|
| +15..+25 | Fresh/tapered | race day |
| +5..+15 | Recovered | post-deload |
| -10..+5 | Neutral/productive | normal training |
| -30..-10 | Productive overload | peak loading only |
| < -30 | Danger | force recovery |
Ramp guardrail: weekly CTL rise <= 5-7 pts/wk (>8 = high injury/illness risk). Load-based twin of R5.

### A2. ACWR (Gabbett) — primary injury-risk metric
```
acute = load last 7 days; chronic = avg weekly load last 28 days; ACWR = acute/chronic
```
| ACWR | Zone | Action |
|---|---|---|
| 0.8-1.3 | Sweet spot | proceed |
| <0.8 | Undercooked | progress gently |
| 1.3-1.5 | Caution | hold, don't add |
| >1.5 | High risk | cap next week, no new long session |
Add as a hard validator alongside R1-R10.

### A3. Aerobic decoupling (precise "cardiac drift")
```
Split a Z2 session in half. efficiency = output/HR (power/HR bike; speed/HR run).
decoupling% = (eff_first - eff_second)/eff_first * 100
```
<5% well-developed · 5-8% acceptable/watch · >8-10% base gap OR fatigue OR heat/dehydration.

### A4. NP / IF / VI (bike control)
```
NP = 4th-root of 30s-rolling avg of power^4;  IF = NP/FTP;  VI = NP/avg_power (race < 1.05)
```

### A5. Periodization variants
Reverse periodization (Sutton; intensity-first in Base, volume later) for limited base-season weather/daylight or speed background. Block periodization (concentrated 1-3 wk single-quality blocks) for advanced plateau. Default = linear (Part 1). Expose as a profile flag.

### A6. Testing protocols (keep benchmarks fresh, re-test every 4-8 wk)
FTP: 20-min max * 0.95 (or ramp * 0.75 of 1-min peak). Run threshold: 30-min TT, last-20-min avg HR = LTHR, avg pace = T-pace. CSS: 400+200 TT (Part 1 §3.2). VDOT: recent 5K/10K. Stale (>8 wk) lowers projection confidence.

---

## B. EXPERT OPINION — gaps we didn't ask for (ranked)
1. **Load model (A1)** is the single biggest gap; everything adaptive hangs off it.
2. **Fueling/energy-availability periodization** (not just race-day). Daily carbs scale with load: 3-5 g/kg easy, 6-10 g/kg big, 8-12 g/kg race-prep. **Energy Availability EA = (intake_kcal - exercise_kcal)/FFM_kg; below 30 kcal/kg FFM/day risks RED-S** (hormonal/bone/immune).
3. **Return-from-illness/detraining/life-interruption.** VO2max falls ~6-7% in 2-3 wks off. Rebuild rule: after N days off resume at `last_load * 0.97^days_off`, never jump to peak. Above/below-neck illness rule (§1.2).
4. **Data-quality/sensor-trust layer.** Optical wrist HR lags/cadence-locks, GPS pace noisy, 1500 W = dropout not sprint, single-day HRV meaningless. Smooth, clamp outliers, prefer power>HR>pace on bike, pace>HR on flat runs, HRV/RHR as TRENDS.
5. **Psychology/adherence/confidence.** Plans fail on adherence. Track completion, detect avoidance, normalize taper anxiety, build race confidence via rehearsal. (Proactive msgs §8.)
6. **Long-term/multi-season + race hierarchy** (A/B/C races, off-season, year-over-year).
7. **Female-athlete physiology** (menstrual-cycle-aware loading; follicular = more intensity capacity, luteal = more fatigue/heat/fuel needs; cycle as recovery signal).
8. **YOUTH-ATHLETE SAFETY (flagged explicitly).** Full-IM training under ~18 carries real bone-development, RED-S, overtraining risk. Cap youth volume, watch EA hard, prioritize long-term development over one early A-race, SURFACE it rather than silently generating an adult 15h/wk plan for a minor. Build an age-band profile.

---

## 1. ADAPTIVE ADJUSTMENT (core engine)
Inputs/week: per-session decoupling, actual vs target pace/power, completed/missed, sRPE, felt-tags (easy/hard/strong/flat/sore/sick), 2-3 wk trend.

### 1.1 Decision rules
| Signal (this week) | Threshold | Adjust NEXT week |
|---|---|---|
| Decoupling high | >8-10% on majority Z2 | hold/cut volume 10-15%, no intensity, extend base, don't progress long |
| Decoupling creeping | +2-3 pts wk/wk same benchmark, 2 wks | early deload (-40-50%), re-test |
| Pace/power below target | key sessions >5% under at correct HR/RPE | if fresh: re-test (stale zones). if tired: cut intensity volume 1 notch |
| Hit pace but RPE high | RPE +2 over expected | treat as fatigue, hold load |
| Easy too hard | RPE>=6 on >=2 "easy" | enforce easy (cap HR), cut volume 10% |
| Missed key long | long ride/run not done | DON'T stack. <=2 days late: swap w/ easy day same week. Week gone: repeat that long next week, don't jump progression |
| Missed >30% | completion <70% | repeat week, don't progress, investigate cause |
| Missed 2 weeks | <50% over 2 wks | step back one level; rebuild via 0.97^days_off |
| "sore" >=2 | diffuse/symmetric = DOMS | cut eccentric/impact, recovery day. Sharp/localized/asymmetric = injury flag, stop sport, refer |
| "sick" | any | illness rule §1.2 |
| "flat" >=2 + no red flags | likely under-fuel/under-sleep | check fuel/sleep BEFORE cutting training |

### 1.2 Illness (above/below neck)
Above neck only (sniffles, no fever): easy Z1-Z2 reduced, no intensity. Below neck (chest/cough/GI) OR fever OR body aches: no training until 24h symptom-free, then ladder: D1 easy 30 Z1, D2 45-60 Z1-Z2, D3 light tempo, D4 resume if no relapse. Resume at `pre-illness load * 0.97^days_off`.

### 1.3 Overreaching/OTS tiers
Flags: perf decline at same workload, RHR up, HRV down, poor sleep, mood, persistent soreness, repeated illness, motivation loss, RPE creep, appetite/weight change.
Tier 1 (1-2 mild flags): proactive easy day, fuel+sleep, hold. Tier 2 (3+ flags OR 1 strong: RHR +7 sustained / perf drop): immediate deload -40-50%, intensity off, 5-7 days. Tier 3 (weeks of decline persisting through deload): 1-2+ wks easy/rest, medical referral, rebuild slow.

### 1.4 Worked example
3/4 Z2 runs decoupling 11-13%; easy runs RPE 6 + "sore" x2 diffuse; long ride MISSED; 2nd consecutive rising-RPE week; ACWR 1.4. → (1) early deload ~-45%, intensity off. (2) don't add missed long; carry its progression to the week after the deload, same target, no jump. (3) confirm DOMS not injury (sharp/localized → pull run, refer). (4) check fuel/sleep. (5) re-test decoupling on benchmark Z2 run before resuming.

---

## 2. IN-SESSION STRUCTURE (WU / Main / CD; WU+CD = Z1-low Z2)

### 2.1 Swim
Technique: WU 200; Main 4x50 drill + 4x25 build + 6x50 stroke Z2 (15s); CD 100.
Endurance: WU 300; Main 1-3x(400-800) Z2 (20s); CD 100-200.
CSS: WU 400 + 4x50 build; Main 8-10x100 @CSS (10-15s) or 6x150; CD 200.
VO2: WU 400 + 4x25 fast; Main 12-16x50 @Z5 (CSS-3..-6); CD 200.
Race/OW: WU 300 + 4x50; Main continuous race-fraction @race effort + sighting; CD 200.

### 2.2 Bike
Endurance/long: WU 15m Z1->Z2; Main Z2 steady (opt last 30-45m low tempo @IM watts); CD 10m.
Tempo: WU 15m + 3x1m; Main 2-3x15-20m @Z3 (76-90% FTP, 5m easy); CD 10m.
SweetSpot: 3x12-20m @88-94% FTP (5m easy). Threshold: 2-3x12-15m @95-105% (6-8m easy). VO2: 5-6x3-4m @110-120% (equal rec). Race-pace: 60-180m @target IF (IM 0.68-0.75/HALF 0.80-0.85), VI<1.05.

### 2.3 Run
Easy: ease in 10m, Z2. Long: WU 10-15m, Z2 (opt last 20-30m @M effort IM), CD 5m walk.
Tempo: WU 15m E + 4 strides; Main 20-30m @Z3 (M); CD 10m E.
Threshold: 4-5x5-6m @T (Z4, 60-90s jog). VO2: 5-6x3m @I (Z5, 2-3m jog). Brick run: off bike, 15-45m @race effort (Z2 IM/Z3 HALF), settle cadence first 5m.

---

## 3. KEY-SESSION PLACEMENT

### 3.1 Same energy system buckets
HI-Run (run Z4-Z5/race-pace intervals) = highest cost. HI-Bike (bike Z4-Z5/VO2) = high. Threshold/Tempo (sustained Z3-Z4 any sport) = mod-high. Long-Endurance (long ride/run) = high.

### 3.2 Spacing rules
Same bucket twice: >=48h apart (one full easy/rest between). Different bucket low-interference (HI-Bike → easy swim): 24h OK. HI-Run cap 2/wk, never within 48h. Hard day → next day easy/rest. Long ride+long run consecutive: intermediate+ only, day after = easy/rest; beginners separate or replace one w/ brick. Heavy-leg strength >=48h from key bike/run.

### 3.3 Weekly templates (R=rest E=easy S=swim B=bike RUN=run; **bold**=key; LR=long ride Lr=long run Br=brick)
**6-day**
| Phase | Mon | Tue | Wed | Thu | Fri | Sat | Sun |
|---|---|---|---|---|---|---|---|
| Base | R | **B tempo**+S easy | RUN easy+S tech | E+Strength | RUN easy | **LR Z2** | **Lr Z2** |
| Build | R | **B SS/thr**+S easy | **RUN threshold** | S CSS+Strength(maint) | E spin | **LR+Br run** | **Lr** (easy if Sat big) |
| Peak | R | **B race-pace**+S | RUN easy | S race-pace | E | **Race-sim Br** | E or **Lr** short |
| Deload | R | B easy+S | RUN easy | E+light Str | R | LR short Z2 | E |
HALF Build: replace one easy run with a 2nd quality (tempo) run; shorter LR/Lr (Part 1 HALF targets).
**5-day** (drop a swim + lowest-priority easy; protect LR+Lr)
| Phase | Mon | Tue | Wed | Thu | Fri | Sat | Sun |
|---|---|---|---|---|---|---|---|
| Base | R | **B tempo**+S | RUN easy | Strength | R | **LR Z2** | **Lr Z2** |
| Build | R | **B SS/thr**+S | **RUN threshold** | Strength(maint) | R | **LR+Br** | **Lr** |
| Peak | R | **B race-pace**+S | RUN easy | R | E | **Race-sim Br** | **Lr** short |
**7-day** (doubles + recovery day if advanced; still >=1 true rest)
Base: Mon E-swim(rec), Tue **B tempo**AM+RUN easy PM, Wed S+RUN easy, Thu E+Strength, Fri S tech+RUN easy, Sat **LR**+Br, Sun **Lr**. Build/Peak analogous.
Deloads (every 2-4 wks per §2.2): same skeleton, cut durations ~40-50%, drop to Z2, keep 1-2 short race-pace touches in Peak deloads only.

---

## 4. PROJECTION ENGINE, WORKED
Athlete: 5K PB 21:12; FTP ~210 W (avg ~26 km/h); CSS 1:56/100m (116 s/100m); 12 wk consistent; mass ~75 kg.

### 4.1 Run engine (VDOT + Riegel)
5K=1272s, v=235.85 m/min. VO2 = -4.60 + 0.182258v + 0.000104v^2 = 44.18. pct = 0.8 + 0.1894393 e^(-0.012778*21.2) + 0.2989558 e^(-0.1932605*21.2) = 0.9495. VDOT = 46.5.
Riegel (1.06): open marathon = 1272*(42195/5000)^1.06 = 12201s = 3:23:21. Open half = 1272*(21097.5/5000)^1.06 = 5853s = 1:37:33.

### 4.2 Swim (CSS+buffer)
IM Z2 wetsuit CSS+6 = 122 s/100m → 38*122 = 4636s = 1:17:16. HALF CSS+5 = 121 → 19*121 = 2299s = 38:19.

### 4.3 Bike (FTP/NP → speed → time)
NP = FTP*IF: IM 210*0.70=147W, HALF 210*0.82=172W.
Physics flat: P = 0.5*rho*CdA*v^3 + Crr*m*g*v; rho=1.225, CdA=0.30, Crr=0.005, m=75 → P=0.18375 v^3 + 3.679 v. 147W→8.56 m/s=30.8 km/h; 172W→9.10 m/s=32.8 km/h.
Apply ~8-10% real-course haircut + sanity vs empirical 26 km/h training: IM race ~27 km/h (conservative, protects run), HALF ~30 km/h. IM bike=180.25/27=6.676h=6:40:33. HALF bike=90/30=3:00:00. The physics (30.8) and empirical (26) BRACKET the truth; empirical anchor more trustworthy w/o confirmed weight/CdA/long-ride → this is why it's MEDIUM.

### 4.4 Run split (open * tri fatigue factor)
IM run = 12201*1.15 = 14031s = 3:53:51 (5:33/km). HALF run = 5853*1.09 = 6380s = 1:46:20 (5:02/km).
Factor ranges: IM 1.12-1.20, HALF 1.05-1.12 (1.15/1.09 for moderately-trained 12-wk).

### 4.5 Totals
IM: T1 240, T2 180 → 4636+240+24033+180+14031 = 43120s = 11:58:40. HALF: T1 180, T2 120 → 2299+180+10800+120+6380 = 19779s = 5:29:39.

### 4.6 Confidence + range
Run benchmark + 12wk + CSS present, FTP approx, NO confirmed long ride/run at race duration, no prior race/full brick → MEDIUM (not HIGH). Half-width ±7%: IM 11:08-12:49; HALF 5:07-5:53. To reach HIGH: recent 10K/threshold run + 4-5h ride (IM)/3h (HALF) w/ power + one race-pace brick.

### 4.7 Per-leg "why" (data-grounded, one line)
Swim 2:02/100m IM: "CSS+6 keeps you Z2 and saves your legs; 5s/100m faster buys seconds in water, costs minutes on the run." Bike 147W/0.70 IM: "70% of your 210 FTP, the ceiling that still lets you run a marathon; every 10W over IM pace costs more run time than it saves." Run 5:33/km IM: "Your 3:23 open-marathon fitness becomes ~3:54 off the bike (x1.15); holding 5:33 from the gun is what makes it real." HALF bike 172W/0.82: "82% FTP, hard but repeatable 3h, leaves enough to run 5:02/km off it."

---

## 5. RECOVERY & READINESS
### 5.1 With sensors (trends, not single days; need 2+ corroborating for Red unless illness logged)
RHR: amber +4-6 bpm 1 day, red +7 sustained 2 days. HRV (ln rMSSD): amber 1 day below range, red 2-3 days below / CV rising. Sleep: amber 1 poor night (<7h or eff<85%), red 2+ poor nights. Wellness (Hooper: sleep+fatigue+stress+soreness 1-7 each).
### 5.2 Without sensors
RPE creep at fixed workload, decoupling rising, pace/power at fixed HR declining, sRPE strain + monotony (mean daily load/SD; >2.0 + high strain = risk), completion rate, felt-tags.
### 5.3 Response
Green: proceed. Amber: convert next hard → aerobic Z2, keep easy volume, reassess AM. Red: full rest today; if still Red tomorrow → deload week (-40-50%).
### 5.4 Example
RHR 48→56 (+8); HRV 4.2±0.2 → 3.7 (below, 2nd day); slept 6h → Red. Replace threshold bike w/ rest; if still Red tomorrow, pull week to deload + re-test benchmark Z2 before resuming.

---

## 6. ENVIRONMENT & LOGISTICS
### 6.1 Heat
Pace slows ~2-5% per 5C above ~15C WBGT; HR drifts ~1 bpm per ~1C above ~20C. Reduce target power/pace 3-8%; fluid 0.7-1.0 L/hr; sodium 700-1000 mg/hr; pre-cool. Heat acclimation: 60-90 min/day in heat 10-14 days (~75% by day 7); re-acclimate within 2-4 wks of race.
### 6.2 Altitude
Above ~1500m VO2max drops ~1-2% per 300m; drive by HR/RPE. Race arrival: <24h OR >=14 days; avoid the 3-10 day window.
### 6.3 Travel
Jet lag ~1 day/time zone; arrive ~1 day early per zone for >3 zones; manage light/hydration/melatonin; travel day = rest/easy.
### 6.4 Hilly courses
Bike: control by NP not avg; climbs cap ~110-120% target IF (short), never exceed FTP on long IM climbs; recover+fuel on descents; VI<1.05. Run: pace by effort/HR, use Grade-Adjusted Pace; even effort = uneven pace (correct).
### 6.5 Race-week
7d out: last moderately-long session, begin sharpening, bike service. Throughout: taper (Part 1 §6), daily short openers, bank sleep, hydrate, nothing new. Carb load: IM 8-12 g/kg/day final 2-3d (10-12 last 1-2); HALF 7-10 g/kg final 1-2d. 2-3d out: course recon, swim in race conditions, transition rehearsal. Day before: short opener (15-20m + 3-4 pickups), rack bike, lay out gear, light meal.
### 6.6 Race morning
Wake 3h before. Breakfast 3h out, 2-4 g/kg carbs (150-200g), low fiber/fat. Pre-start gel/drink + sip ~15 min before. WU: IM minimal (5-10m swim), HALF a bit more + pickups. Check: bottles/nutrition, tire pressure, transition, chip, body-marked, wetsuit, anti-chafe.

---

## 7. STRENGTH & INJURY PREVENTION
### 7.1 Season phases (Friel)
Anatomical Adaptation (early Base): 2-3x/wk, 2-3x12-20 @40-60%, 3-4 wks. Max Strength (late Base): 2x, 3-5x3-6 @80-95%, 4-8 wks. Power/Conversion (early Build): 1-2x, 3-5x3-6 + plyo @50-70% explosive. Maintenance (Build→Peak): 1x, 2-3x6-12 @60-75%. Taper: 0-1x core/bodyweight, stop heavy ~10-14d out.
Lifts: squat, deadlift/RDL, single-leg, hip thrust, calf raise, horizontal pull, anti-rotation core (Pallof), plank, dead bug. Skip upper hypertrophy. Heavy legs >=48h from key bike/run.
### 7.2 Injury prevention
Run: runner's knee/ITB/Achilles/plantar/shin — 10%/wk cap, cadence 170-185, calf+glute-med strength, eccentric calf, gradual shoe/surface, protect EA (bone). Bike: knee/back/neck/saddle — fit first, gradual position change, core. Swim: shoulder impingement — high-elbow technique, body roll, rotator-cuff+scap work, cautious paddle/volume.

---

## 8. PROACTIVE COACHING (notice + message unprompted; throttle ~1-2/wk, suppress dupes within 14 days)
| Situation | Trigger | Intent |
|---|---|---|
| Sport abandoned | 3 consecutive planned sessions of one sport missed | surface barrier, offer reschedule/rebalance |
| Easy runs creeping hard | >=50% of easy/Z2 runs over 2wks spend >15% time in Z3+ | teach easy-day discipline |
| Aerobic fatigue/base gap | decoupling >8-10% majority aerobic 2wks | flag fatigue/base gap, propose hold/deload |
| Under-recovery | RHR/HRV Red 2 days | recommend rest, probe sleep/stress/fuel |
| Injury risk | ACWR >1.5 OR CTL ramp >8/wk | warn, cap next week, no new long |
| Endurance not ready | entering Peak/Taper w/o long ride/run >=85% target | flag readiness gap |
| Energy availability | rapid weight loss + low fuel + fatigue/flat | RED-S caution, encourage fueling, refer if persistent (escalate for youth) |
| Plateau | no pace/power gain at fixed HR over 4-6wks | review stimulus, suggest change |
| Taper anxiety | taper week + flat/sluggish/worried tags | reassure "taper tantrums" normal, don't add training |
| RPE spike | sessionRPE +2 above expected at fixed workload | probe illness/life stress before progressing |
| Sleep limiter | sleep <7h for >=3 nights | flag biggest controllable recovery lever |
| Positive reinforcement | new PB or consistency milestone | reinforce, build confidence |
| Pre-race | race within 7 days | trigger race-week checklist + fueling reminders |

---
*End Part 2. Calibrate first against real data: run fatigue factors (§4.4) + decoupling/RPE deload thresholds (§1).*
