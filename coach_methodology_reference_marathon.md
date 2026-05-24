# Marathon & Half-Marathon Coaching Reference (Stryxs)

> Encodable reference for the `marathon` (Pfitzinger + Daniels) and `half_marathon` (Daniels + Pfitzinger) personas.
> `[MAR vs HALF]` marks divergences. Pace in min/km, HR as %LTHR. Gathered 2026-05-23 (round 1).
> Tags: D=Daniels/VDOT, P=Pfitzinger, S=Seiler/polarized, R=Riegel, C=Canova.

## 0. CORE CONSTANTS
```
RIEGEL_EXPONENT=1.06 (road, within ~3x); RIEGEL_EXPONENT_MAR=1.07 (>25km extrapolation)
HALF_KM=21.0975  MAR_KM=42.195  FIVEK=5  TENK=10
POLARIZED_EASY=0.80 (build/peak); 0.90 base
TEN_PCT_RULE=0.10 weekly volume cap; CUTBACK_EVERY=3 wks (2 for masters/beginners); CUTBACK=0.30
LONG_RUN_FRAC 0.20-0.30 of weekly; Daniels: <=150 min OR 30% vol, whichever LESS
MAR_LONG_RUN_KM_CAP=35; HALF_LONG_RUN_KM_CAP=24
```

## 1. PERIODIZATION (Base/foundation -> Build/specific -> Peak/sharpen -> Taper -> Race)
Base: aerobic volume, strides, hills, light threshold (~90/10). Build: threshold volume rises, long runs lengthen, [MAR] marathon-pace work appears (80/20). Peak: [MAR] longest runs + biggest MP segments; [HALF] VO2/I intervals + threshold sharpening, less raw volume. Taper. Race.
**Phase tables (weeks: Base/Build/Peak/Taper):**
[MAR]: 24→10/7/4/3 · 18→7/6/3/2 · 16→6/5/3/2 · 12→4/4/2/2
[HALF]: 24→10/8/4/2 · 18→7/7/2.5/1.5 · 16→6/6/3/1 · 12→4/5/2/1
Boundary algo: taper=MAR?clamp(round(W*0.12),2,3):clamp(round(W*0.08),1,2); peak=clamp(round(W*0.18),2,4); base=round((W-taper-peak)*(MAR?0.58:0.55)); build=rest.
Min viable build: [HALF] 8 wks w/ base ≥25km/wk; [MAR] 12 wks w/ base ≥40km/wk + a ≥18km long run already.

## 2. WEEKLY STRUCTURE & PROGRESSION
Volume increase cap: beginner 8-10%, intermediate 10-12%, advanced ≤15% but abs jump ≤8-10 km/wk. Validator: next ≤ cur*(1+cap) AND next-cur ≤ 12 km.
Cutback 3:1 (2:1 beg/masters), cut 25-35% off recent peak; resume at pre-cutback peak after.
Rest days: beginner 2-3, intermediate 1-2, advanced 0-1. Never two quality days back-to-back without easy/rest between.
Doubles: only if >100-110 km/wk AND advanced; 2nd run short easy. Never <65 km/wk or beginners.
Volume→runs: 25-35km→3-4 · 35-50→4-5 · 50-65→5-6 · 65-90→6-7 · 90-120→7-10(doubles).
Long run = clamp(week_km*0.25, 0, cap); cap 35 MAR/24 HALF, also ≤150min. Quality total (incl WU/CD) ≤30% of week.
Long run [MAR] 32 typical/35 hard cap/~3:00 time cap (never >3:30); [HALF] 21-22 typical/24 cap/~2:00. Long-run wk-over-wk increase ≤2-3 km (≤10%); cut hardest on cutback (-30-40%).
Intensity by phase (by time): Base 88-92% easy · Build 80% · Peak 78-82% · Taper 85-90%. Validator: easy/total ≥0.78 build/peak.
Smoothness asserts: ≥1 easy/rest between quality; ≥1 rest/recovery in 2 days after long run; long-run jump ≤3km/10%; cutback every 2-3 wks; ≤2 quality (≤3 advanced); easy days truly easy.

## 3. ZONES & PACES (Daniels VDOT)
Paces: E (easy, 65-79%LTHR, base/recovery), M (marathon, 89-94%LTHR, [MAR] race economy), T (threshold, 95-99%LTHR, cruise 5-15min or 20-40min tempo), I (interval, 100%+, VO2 reps 3-5min), R (rep, speed, 30-90s).
**VDOT formulas (encode):** v=D_m/t_min; VO2=-4.60+0.182258v+0.000104v²; pctMax=0.8+0.1894393·e^(-0.012778t)+0.2989558·e^(-0.1932605t); VDOT=VO2/pctMax.
Pace from VDOT: targetVO2=pct·VDOT (E~0.70 M~0.80 T~0.88 I~1.00); v=(-0.182258+√(0.182258²+4·0.000104·(targetVO2+4.60)))/(2·0.000104) m/min; pace_min_km=1000/v. R≈I·0.95.
HR %LTHR: Z1≤81 · Z2 82-88 · Z3 89-93 · Z4 94-99 · Z5a 100-102(T) · Z5b 103-106(I) · Z5c ≥107(R).
**Worked: 21:12 5K → VDOT≈46.5.** Paces: E 5:11-5:45, M 4:52, T 4:31, I 4:04, R 3:52 /km.

## 4. SESSION LIBRARY (WU+main+CD; WU/CD 10-20min E + strides before quality)
Recovery (E slow/Z1 20-40m), Easy (E/Z1-Z2 40-75m), Steady (low M/high E), Long run (E→steady, §2 caps), [MAR] MP long run (finish 8-25km @M), Medium-long (P, 18-25km midweek), Tempo (T 20-40m), Cruise intervals (5×1km or 4×1.5km @T, 60s jog), VO2 (I, 5-6×3min or 4-5×1km), Strides (6-8×20s), Hill reps (8-10×60-90s), Progression (E→M→T), Fast-finish long run.
[MAR] prioritize MP long runs, medium-longs, T volume; I minor. [HALF] prioritize T + a block of I in peak; long run capped lower.

## 5. ADAPTATION
Days: 3=long+tempo+easy · 4=long+1Q+2easy · 5=long+2Q+2easy · 6=long+ML+2Q+2easy · 7=+recovery/double.
Placement: long Sat/Sun; long+1=rest/recovery; Q1(T) ~3 days from long; Q2(I/MP) ~2-3 from Q1, never adjacent; easy surrounds every quality.
Experience: beginner cap 1 quality/wk + more rest + conservative VDOT (recent race not goal); advanced 2-3 quality + ML + doubles. Set paces from MOST RECENT race (≤6wks). Injury/bone-stress history → ≤5%/wk jumps, more rest, cross-train, lower long cap. Heat >24C: slow E/M ~10-20s/km, judge by HR.

## 6. TAPER [MAR vs HALF]
[MAR] 2-3 wks: vol →70%(2wk)/→50%(1wk)/→30%(race wk); keep intensity (short T + few km @M); last real long ~3wks out. [HALF] 1-1.5 wks: vol →60-70%; keep a short I/T sharpener 3-4 days out. Cut VOLUME, preserve intensity+frequency.

## 7. RACE-DAY
[MAR] even or slight negative split; first 5km at goal pace or 1-2% SLOWER (never bank time); wall ~30-35km = glycogen → even pace + fuel. First km ≈100-103% goal pace. [HALF] even/mild negative; first km ≈100-101% goal.
Carb load: [MAR] 8-12 g/kg/day 36-48h pre; [HALF] 6-8 g/kg day before. Race AM 1-4 g/kg 1-4h before.
In-race: [MAR] 60-90 g carbs/hr (start by 45-60min), fluid 400-800ml/hr, Na 300-700mg/hr heat. [HALF] 30-60 g/hr (often 1 gel halfway; <75min maybe none).
Why [MAR]: "MP is what you hold aerobically 3+hrs without depleting glycogen, not your 5K fitness; start 1-2% slow." [HALF]: "half pace = at/just under threshold, fastest you hold 60-90min; even effort beats fast first 5km."

## 8. PROJECTION (the headline)
Riegel: T2 = T1·(D2/D1)^1.06 (use recent 5K/10K; 1.07 for marathon). VDOT equivalency cross-check (§3.2). Riegel & VDOT agree ~1-2% for trained runners.
**Marathon fade factor [MAR]** (Riegel/VDOT assume volume to honor it; low mileage fades more). Multiplier on marathon time by build-phase avg weekly volume:
≥90km ×1.00 · 70-90 ×1.01-1.03 · 55-70 ×1.03-1.05 · 40-55 ×1.05-1.08 · <40 ×1.08-1.12.
[HALF] far less sensitive: ≤×1.00-1.03 for <40km/wk, else ~1.0. Long-run penalty: +1-2% if longest <28km [MAR]; +1% if <18km [HALF].
Min data: race/TT ≥3km within 6 wks; volume trend ≥4 wks; longest recent long run; [MAR] ≥1 long ≥25km in last 4wks for above-LOW.
Confidence: HIGH = race ≤4wk ≥10km (or 2 consistent) + volume adequate for goal + race-specific long run ([MAR]≥30/[HALF]≥18) + ≥8wk training. MEDIUM = recent 5-10K ≤6wk + volume within one band + some long-run + ≥6wk. LOW = old/short race only, or volume well below goal, or no long-run, or <4wk.
Range: HIGH ±1.5%, MEDIUM ±3%, LOW ±5-6% (label indicative). Always show range + confidence + limiter.
**Worked (21:12 5K, ~50km/wk):** Half Riegel 1272·(21.0975/5)^1.06 ≈ 5852s ≈ 1:37:30, ~adequate vol → 1:37-1:40 MED-HIGH. Marathon Riegel 1272·(42.195/5)^1.06 ≈ 12200s ≈ 3:23:20, but 50km/wk → fade ×1.05-1.08 (+long-run penalty) → center ≈3:35, range 3:32-3:48 LOW-MED, limiter=mileage.

## 9. ANTI-PATTERNS (DO-NOT, numbers)
No >cap weekly increase / >+12km/wk; layoff >2wk → restart 60-70% prior. 10% rule on volume AND long run. Easy MUST be ≤E ceiling/≤89%LTHR (flag any easy run in Z3+, the #1 error). Long run never >caps/150min/3hr or >10%/wk spike. Long runs E/steady (optional planned M finish), not raced. Quality ≤20% time, ≤2/wk (≤3 adv), never adjacent. Enforce cutbacks (≤3 straight build weeks). Don't race the workouts. Injury triad: rapid jumps + low energy availability + low cadence → cadence 170-180, rotate ≥2 shoes, vary surface, replace shoes ~600-800km, fuel (RED-S), deload at first localized bony pain (pain worsening mid-run / hurts to hop = STOP).

## 10. FEASIBILITY
**[MAR] min/peak km/wk + longest by goal:** sub-3:00 (4:16/km, VDOT~54+) 70/90-110/32-35km · sub-3:30 (4:58,~46) 55/70-85/30-34 · sub-4:00 (5:41,~39) 40/55-65/28-32 · sub-4:30 (6:24,~34) 30/40-50/26-30.
**[HALF]:** sub-1:30 (4:16,~54) 55/70-85/20-24 · sub-1:45 (4:58,~46) 40/55-65/18-22 · sub-2:00 (5:41,~39) 30/40-50/16-20.
Algo: current VDOT from recent race; goal VDOT from goal time; dVDOT=goal-current; feasible_gain=weeks/3.5 (≈1 VDOT pt/3-4wk, ~0 if already high+short runway); volume gap = min_km - current. REALISTIC if dVDOT≤feasible_gain AND volume reachable by ramps; STRETCH if dVDOT≤feasible_gain·1.3 or tight; else UNREALISTIC. Always pair unrealistic with binding lever (more weeks / more mileage / softer goal to the §8 projected range) + one concrete adjusted target.

*Judgment calls: HR zones use Friel %LTHR bands (we store run_lthr); marathon long-run hard cap 35km/3hr. Tune the fade multipliers (§8.3) against real Stryxs finish data.*
