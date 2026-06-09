# STRYXS COACH REFERENCE: STANDALONE CYCLIST PERSONA (`cyclist`)

Scope: road cycling only. No swim, no run. This persona's factor tables must NOT leak into `ironman`, `ironman_70_3`, or `short_tri` (and vice versa: tri bike rules assume run-off-the-bike fatigue management, which does not apply here).

Goal tags used throughout:
- [ENDURANCE]: century (160 km), 100 km, gran fondo, sportive, audax
- [PERFORMANCE]: FTP development, road race, criterium, time trial
- [CLIMBING]: W/kg, sustained climbs
- [FITNESS]: no event, general aerobic health

Sources: Coggan & Allen, Friel (Cyclist's Training Bible), Seiler (polarized), Overton/FasCat (sweet spot), Cusick (WKO), British Cycling.

Tier definitions (DEFAULT = intermediate):
| Tier | History | Typical FTP W/kg (M / F) | Typical hours/wk |
|---|---|---|---|
| beginner | <1 yr structured | 1.8-2.5 / 1.5-2.2 | 3-6 |
| intermediate (DEFAULT) | 1-3 yr, some structure | 2.5-3.5 / 2.2-3.0 | 6-10 |
| advanced | 3+ yr, races/long events done | 3.5-4.5+ / 3.0-3.8+ | 10-16 |

## 1. PERIODIZATION
Phase order: Base -> Build -> Peak -> Taper -> Event.
Phase allocation by weeks-to-event:
| Weeks | Prep | Base | Build | Peak | Taper |
|---|---|---|---|---|---|
| 8 | 0 | 3 | 3 | 1 | 1 |
| 12 | 0 | 5 | 4 | 2 | 1 |
| 16 | 0 | 8 | 5 | 2 | 1 |
| 24 | 2 | 11 | 7 | 2 | 2 |
| 36 | 4 | 16 | 10 | 4 | 2 |
Boundary formulas (W = weeks-to-event): taper=clamp(round(W*0.08),1,2); peak=clamp(round(W*0.10),1,4); build=clamp(round(W*0.30),3,10); prep=W>=24?clamp(round(W*0.10),0,4):0; base=W-taper-peak-build-prep (floor 3).
Emphasis: ENDURANCE=Z2 volume+long-ride progression; PERFORMANCE=threshold/VO2; CLIMBING=torque+climbs at W/kg. FITNESS=rolling 3 load:1 deload, twice/yr a 6-8wk build block.
Min viable build: 100km=6wk; century/fondo=8 (DEFAULT 12); 40km TT/first crit=8; >5% FTP=8-12wk.

## 2. WEEKLY STRUCTURE & PROGRESSION
Ramp caps/wk: beginner +8% hrs / +3 CTL; intermediate +10% / +5 (DEFAULT +8%/+4); advanced +12% / +7. ACWR stay 0.8-1.3 (block >1.3).
Deload: beginner 2:1 (Base) then 3:1, cut -40%; intermediate 3:1 cut -45%; advanced 3:1/4:1 cut -50%.
Rest days/wk: beginner Base 3 / Build 2-3 / Peak 2 (min 2); intermediate 2/1-2/1-2 (min 1); advanced 1-2/1/1 (min 1).
Guardrails C1-C10: C1 rest days within +/-1 of prior week; C2 rest>=tier min every week incl race week; C3 hours_N<=hours_(N-1)*(1+rampcap); C4 max 1 session/day except permitted two-a-days; C5 max Z4+ sessions/wk = 2 beg / 2 int / 3 adv; C6 no consecutive hard days (beg/int); C7 long ride <=1.5x longest of prior 3 wks and <= cap; C8 a deload in every 4-wk window past Base wk3; C9 ACWR 0.8-1.3 before emit; C10 if 0 key sessions completed, repeat week at -20%.
Two-a-days: advanced only, hrs>=10, Build/Peak, 2nd session Z1-Z2<=60min, not consecutive, max 1/wk (DEFAULT 0).
Hours by goal: ENDURANCE 5-7/7-10/10-14; PERFORMANCE 4-6/6-9/9-14; CLIMBING 5-7/7-10/10-14; FITNESS 3-5/5-7/7-10.
Hours->rides: 3-4h=3 rides (2x45-60+1x90); 5-6h=3-4; 7-8h=4 (+2.5-3h long); 9-10h=5; 11-13h=5-6; 14+=6.
Intensity distribution: hours<8 -> sweet-spot model; >=10 -> polarized; 8-10 blend. ENDURANCE Base 85/10/5/0, Build 78/14/6/2, Peak 80/14/5/1. PERFORMANCE Base 82/12/6/0, Build 72/10/12/6, Peak 70/8/14/8 (Z1-Z2/Z3/Z4/Z5+).
Long ride: 30-40% weekly hours (DEFAULT 35%), +15-20min/wk, caps ENDURANCE 5.5h / PERFORMANCE 3h / CLIMBING 4h / FITNESS 2.5h. Peak long = 70-80% event duration, 2-3 wks out.

## 3. ZONES (Coggan, % FTP / % bike LTHR / RPE)
Z1 recovery <55% / <68% / 1-2; Z2 endurance 56-75% / 69-83% / 3-4; Z3 tempo 76-90% / 84-94% / 5-6; Z4 threshold 91-105% / 95-105% / 7; Z5 VO2max 106-120% / >106% / 8-9; Z6 anaerobic 121-150% / n/a / 9-10; Z7 neuromuscular max / n/a / 10.
Sweet spot = 88-94% FTP (~95-100% LTHR, RPE 6). No-power: prescribe Z1-Z4 by %LTHR, Z5+ by RPE+duration.
FTP: 20min*0.95; ramp 1min*0.75; 40-60min NP ~= FTP. Retest every 6-8wk + each phase boundary.

## 4. SESSION LIBRARY (targets + WU/MAIN/CD)
Recovery spin Z1 30-60min. Endurance/Z2 (backbone) 56-75% 1-5.5h. Tempo 76-87% 2-3x15-20min. Sweet spot 88-94% (2x12->2x20->3x15). Threshold/FTP 95-105% (4x8,3x12,2x20). VO2max 106-120% RPE8-9 (5x4,4x5,30/30). Anaerobic/sprints Z6-Z7 (6-10x15-30s). Over-unders 2min95%/1min105-110%. Big-gear 50-60rpm 80-90% (skip if knee history). Hill repeats 4-8% grade. Long ride + event-IF finish. Opener 45-60min w/ 3x1min@105%.
Indoor: indoor duration = outdoor*0.8 for Z2; ERG ON for SS/threshold/Z2, OFF for sprints/30-30s; cap indoor long 2.5h.

## 5. ADAPTATION
Placement: 3d Tue Q/Thu Z2/Sat LR; 4d +Sun recovery; 5d Tue Q1/Wed Z2/Thu Q2/Sat LR/Sun Z2; 6d Mon recovery/Tue Q1/Wed Z2/Thu Q2/Sat LR/Sun Z2. LR on long-day (default Sat). Never Q day after LR.
No power -> %LTHR (Z1-Z4) + RPE (Z5+), projection confidence capped MEDIUM. Gym 1x/wk Base (squat 3x6-8 + core). Knee flag -> remove big-gear, cadence floor 85. Back/neck -> cap 2.5h. Age 50+ -> +1 rest day, deload 2:1 Build, VO2 reps <=4min.
W/kg = FTP/kg. Climbing target W/kg from VAM. If gap>0.4, 70% power / 30% weight messaging (deficit <=300-500 kcal, never Peak/race wk, off entirely if disordered-eating flag).

## 6. TAPER
ENDURANCE 7-10d (DEFAULT 7), -30 to -40% volume, 1 short SS early; last big LR 2-3wk out, taper LR=90min Z2. PERFORMANCE 10-14d, wk1 -40% race wk -55 to -60%, keep full-intensity low-volume + openers. Carb-load final 36-48h for events>3h: 8-10 g/kg/day. Frequency stays, intensity touches stay, opener 24h pre.

## 7. EVENT-DAY
ENDURANCE century/fondo: IF 0.65-0.75 (beg 0.62-0.68, int DEFAULT 0.70, adv 0.72-0.78); first hour <= goal NP -5%; climbs cap upper Z3 (<=90% FTP); VI<=1.10; draft when possible; fuel 60-90 g/h, 500-750ml/h, 500-800mg sodium/L.
PERFORMANCE TT %FTP by duration: 10min 105-110%, 20min 100-105%, 40km/~60min 95-100%, 90min 88-92%; neg-split first 25% at -2-3%. Crit/road: below threshold in wheels, Z6 matches for position.
CLIMBING: pace at %FTP for climb duration (8.1), seated 80%, cadence 70-85, surges at gradient changes.

## 8. PROJECTION ENGINE (deterministic)
### 8.1 Sustainable % of FTP by duration & tier (interp linearly)
| Duration | beg | int (DEFAULT) | adv |
|---|---|---|---|
| 20 min | 100% | 103% | 105% |
| 1 h | 92% | 95% | 100% |
| 2 h | 80% | 85% | 88% |
| 3 h | 73% | 78% | 82% |
| 4 h | 67% | 72% | 77% |
| 5 h | 63% | 68% | 73% |
| 6 h | 60% | 65% | 70% |
| 8 h+ | 55% | 60% | 65% |
### 8.2 Power -> speed: P = 0.5*rho*CdA*v^3 + Crr*m*g*v + m*g*grade*v. Solve v by bisection on [1,25] m/s.
Constants: rho 1.225; g 9.81; Crr 0.005; CdA hoods 0.32 (endurance DEFAULT), drops/aero road 0.28 (TT on road bike), TT bike 0.25 (equipment flag); system mass m = rider_kg + 10 (+2 for events>4h). Convention: NO drivetrain-loss term (the worked examples omit it; unit-test against this convention).
Terrain: solve at grade 0 then multiply flat speed by factor: flat 1.00 (<5 m/km), rolling 0.93 (DEFAULT, 5-12 m/km), hilly 0.85 (12-20), mountainous 0.78 (>20).
Group/fondo draft: solo DEFAULT 1.00; mass-start fondo 1.05 (beg 1.03, adv 1.07).
### 8.3 No-power defaults by tier (projection only)
beg FTP 170/135W, W/kg 2.2/1.9, flat solo 26 km/h; int 230/180W, 3.0/2.6, 31 km/h; adv 300/235W, 3.9/3.3, 36 km/h. Prefer observed avg speed * (terrain_event/terrain_observed) when rides exist. Default terrain rolling.
### 8.4 Confidence
HIGH (+/-4%): FTP test <=6wk + >=3 rides >=60% event duration w/ power in 8wk. MEDIUM (+/-8%): FTP <=12wk + >=1 ride >=50% event duration in 8wk. LOW (+/-15%): defaults or HR/speed only. Cross-check promotion: if predicted speed of a completed comparable ride within 5% of observed, narrow one step (MED->6%, LOW->10%), never past HIGH.
### 8.5 WORKED EXAMPLE A (100km gran fondo, rolling, solo): intermediate FTP 250W, 75kg (3.33 W/kg), m=85, CdA 0.32 -> a=0.196, b=0.005*85*9.81=4.169. Converges: 191 W (IF 0.76), 33.1 km/h flat -> 30.8 km/h rolling, **3h 15min (195 min)**, MEDIUM(+) range 3:03-3:27.
### 8.6 WORKED EXAMPLE B (flat 40km TT, drops): same athlete, CdA 0.28 -> a=0.1715, factor 1.00. Converges: 236 W (IF 0.94), 37.4 km/h, **64 min**, MEDIUM range 59-69.
UNIT-TEST ANCHORS: b=4.169; fondo 191W/33.1 flat/195min; TT 236W/37.4/64min.

## 9. ANTI-PATTERNS (DO-NOTs)
1 grey-zone (>20% wk time in 76-90% outside SS) -> repolarize. 2 never exceed Z4+ cap. 3 Z1-Z2 never <70% wk time. 4 no 5 consecutive load wks w/o deload. 5 max FTP jump +8%/retest (beg may +10-12 early; never auto-raise from one outdoor spike). 6 every ride>90min has carbs/h line. 7 contact/knee: cap ride duration +30min/wk; knee pain -> remove big-gear, cadence floor 85, bike fit. 8 no back-to-back hard (beg/int). 9 indoor-only 4wk + outdoor event -> >=1 outdoor ride/wk final 6wk. 10 block ACWR>1.3 / hours over cap. 11 heat/altitude first week -5-8%.

## 10. FEASIBILITY
Min training: 100km=6wk/4h/70km long/1 Q; century/fondo=8(DEFAULT 12)/6h/110-120km long/1-2 Q; century ~5h=16wk/8h/2Q; +5% FTP=8wk/2Q; +0.3 W/kg=12-16wk.
Improvement rates per 12wk: FTP beg +8-15% / int +4-8% / adv +2-4%. W/kg/12wk: +0.25-0.40 / +0.15-0.25 / +0.05-0.15.
Verdict: required power for goal time (reverse 8.2) -> required FTP = P/sustainable_pct; vs projected FTP at event date (capped at ceiling). REALISTIC if required<=projected; STRETCH within +5%; UNREALISTIC beyond. Name ONE lever with a number.

---
# PART 2 (round 2 deepening)

## A. Precision additions
NP = 4th-root of mean of 30s-rolling power^4. IF=NP/FTP. VI=NP/avg (fondo<=1.10, crit 1.15-1.30). TSS=(s*NP*IF)/(FTP*3600)*100. CTL=42d EWMA of TSS, ATL=7d, TSB=CTL-ATL (yesterday). kJ~=kcal.
No-power TSS: hrTSS/h by zone Z1 30/Z2 55/Z3 75/Z4 100/Z5 120; or sRPE TSS=RPE*min/8. Tag the source.
TSB targets: Build -10 to -25; red <-30 5+ days; ENDURANCE event +5 to +15; PERFORMANCE race +10 to +20; detrain >+25 2wk.
W'~=20kJ (match counting). Ramp-test bias: diesel riders -3%. FTP staleness: no test 12wk -> stale; CTL drop>15 -> decay FTP 1%/5 CTL (projection only). Count commutes (Z1-Z2), subtract from Z2 budget.

## B. Expert additions
Durability: fade after 2,000 kJ: <5% excellent, 5-10% good (DEFAULT), 10-20% typical, >20% poor. Prescription: finish LR w/ 2-3x8min SS or final 45-60min at event IF. Hook: if event>3h, no ride>60% duration, fade>15% -> knock sustainable %FTP -3 pts for >3h.
Cadence: self-select 85-95; drills 4x3min@105-110rpm. Female: same model; late-luteal HR+2-5, judge by power/RPE, fasted OFF default, carb floor 5g/kg; iron flag -> see doctor. Masters 50+: +1 rest day, 48-72h between Z4+, strength 2x/wk year-round, keep intensity (30/30s). Indoor FTP 3-7% lower -> store indoor_ftp if gap>3%; fan mandatory. Carb periodization: 3-5/6-8/8-10 g/kg easy/hard/load; fasted Z1-Z2<=90min, 2x/wk, Base, male default. Gravel/ultra: Crr 0.008-0.012, IF 0.55-0.62, extend power-duration 10h=55/58/62% 12h=52/55/60%. Bike fit: saddle 0.883*inseam, flag-and-refer.

## C. ADAPTIVE ENGINE (AC1-AC18; safety first, first-match-wins per block, safety only reduces)
AC1 SICK: zero intensity 48h symptom-free; below-neck -> full rest; resume 70% volume, lost week not made up. AC2 TSB<-30 3d -> rest day + cap next wk 80%. AC3 ACWR>1.3 -> scale to <=1.25; <0.8 2wk -> detrain msg. AC4 EARLY DELOAD: RPE>=+2 on 3 sessions, or sore/flat on>=3, or weekly felt-score<=-4 (easy/strong +1, hard/flat -1, sore -2, sick -3) -> deload next wk. AC5 DRIFT RED: drift>8% on 2+ Z2 rides -> next wk -15%, no progression. AC6 THRESHOLD FADE: power at equal HR down>=3% across 2 threshold/SS -> cut INTENSITY not volume (1 Q at -1 zone, keep Z2). AC7 MISSED LR: never stack, cap by C7; 2 consecutive -> step back 2. AC8 MISSED Q: 1 let go; 2+ -> repeat week. AC9 LOW COMPLIANCE <70% 2wk -> rebuild at 80% + 1 fewer session. AC10 DRIFT AMBER 5-8% on most -> hold volume flat 1wk. AC11 GREY-ZONE >=50% Z2 ridden Z3 2wk -> re-anchor caps. AC12 TARGET SHORTFALL >5% normal RPE -> check FTP staleness/retest. AC13 BREAKTHROUGH >5% over target lower RPE 2 sessions + drift<3% -> retest within 10d. AC14 GREEN WEEK >=90% completion, drift<5%, felt>=0, TSB>-25 -> progress. AC15 EASY FLAGS -> upper ramp bound. AC16 DELOAD RESPONSE -> resume pre-deload load. AC17 PLATEAU FTP flat 2 retests -> change stimulus (SS->threshold->VO2 block). AC18 LIFE-STRESS counts as sore tag.

## D. IN-SESSION SCALING
Threshold Base->Peak: 3x8@92-95 / 4x8@95 / 2x15@95-98 / 2x10@92(deload) / 2x20@95-100 / 3x15@95-100 / 2x12@100-102. VO2 Build->Peak: 4x3@110-115 / 5x3 / 3x2(deload) / 5x4@108-113 / 6x4 / 3x3@113-115. ERG OFF for 30/30; even pacing, end set if rep drops>5%.

## E. WEEKLY TEMPLATES
3d Tue/Thu/Sat; 4d +Sun Z2; 5d Tue Q1/Wed Z2/Thu Q2/Sat LR/Sun Z2 (rest Mon+Fri); 6d Mon recovery/Tue Q1/Wed Z2 90-120/Thu Q2/Fri rest/Sat LR/Sun Z2 (advanced). 7-day availability -> plan MAX 6 rides, 7th = rest (adv may convert to 30-45 Z1 in Peak).

## F. PROJECTION DEPTH (anchors)
C heavy rider (adv FTP 320, 95kg, m=105, b=5.150): hilly fondo 120km 248W/30.6/235min; flat century 160km 240W/35.6/270min. D no-power int from 28.0 km/h flat @ HR 82% LTHR: flat 100km 28.2 km/h/213min LOW +/-15%. E FTP 250->262 re-projection fondo: 201W/31.4/191min (+4.8% W -> ~2% time). F flat vs hilly TT: flat 64min vs hilly 76min (231W/31.6). Anchors: C 248/30.6/235 + 240/35.6/270; D 28.2/213; E 201/31.4/191; F 231/31.6/76.

## G. RECOVERY/READINESS
Wearable: RHR +5-7 amber / +8 red; HRV -10-20% amber / >-20% red; sleep <6.5h move quality / <5h rest; 2 ambers = 1 red. Training-only: EF (NP/avgHR Z2) down>5% 2wk -> AC5/AC10; RPE creep +2 3 sessions -> AC4; drift 5-8/>8 -> AC10/AC5; TSB <-25/<-30. Red -> rest today, never drop LR first.

## H. ENVIRONMENT
Heat -2% FTP/5C above 20C (+ -2% if humidity>70%), HR+5-10, fluids 750-1000ml/h>28C; acclimation 10-14d. Cold <5C warmup +5-10min, cover knees<15C. Wind: +5% into/-5% with. Altitude -2%/500m above 1000m, race <24h or after 10d. Indoor: fan mandatory, separate indoor FTP if gap>3%. Event-week: Mon rest, Tue 2x6 SS, Wed-Thu Z1-Z2, Fri rest/spin, Sat opener, carb-load 8-10 g/kg final 36-48h. Morning: breakfast 2-3 g/kg carbs 2.5-3h before, warmup matched to start.

## I. STRENGTH (2x Base, 1x Build, 0-1 Peak; masters 2x year-round)
AA 2-3x12-15 light; max strength 3-4x4-6 @ 80-85% (biggest FTP carryover, Ronnestad); maintenance 2x6; Peak core only. Core 2x/wk 10min. Knees/back/neck/saddle injury-prevention per fit.

## J. PROACTIVE TRIGGERS (P1-P12)
P1 grey-zone creep; P2 2 missed LR; P3 threshold stalling; P4 ACWR>1.3; P5 PB/FTP up (+ updated projection); P6 drift improving; P7 taper anxiety; P8 event week (checklist + pacing card); P9 detraining; P10 fueling gap; P11 stale FTP 12wk; P12 post-event (reverse taper). Message rule: one number, one action, one line; no alarm language for amber.

(Persona-scoped to `cyclist`; AC rules extend C1-C10; projections share 8.2 constants, NO drivetrain-loss convention.)
