# Marathon & Half-Marathon Reference — Part 2 (deep dive)

> Companion to coach_methodology_reference_marathon.md. [MAR vs HALF] marked. Gathered 2026-05-23 (round 2).
> Codeable summary. Much of this (adaptive §1, readiness §5, proactive §8) is already built sport-agnostically in Stryxs.

## A. EXTENSIONS / REFINEMENTS
- **R pace** ≈ I velocity ×1.05-1.06 (R pace ≈ I pace ×0.94-0.95). Never slower than ~mile pace, never faster than ~800m pace.
- **M pace %VO2max scales with ability** (not fixed 0.80): `M_pct = clamp(0.75 + (VDOT-38)*0.0035, 0.75, 0.88)`. VDOT40→0.76, 50→0.79, 60→0.83, 75→~0.88. (ENCODED in computeRunProjection.)
- **Quality volume caps (validators):** T ≤10% weekly km (continuous ≤20-25 min for <VDOT50, else cruise intervals); I ≤8% weekly, each rep ≤5 min; R ≤5% weekly, each rep ≤90-120s.
- **VDOT staleness:** flag if newest race >8 wks; widen projection range.
- **Cumulative fatigue (Pfitz):** stacking ML+long+quality so long run is on tired legs is INTENTIONAL for intermediate/advanced in Build/Peak; beginners get recovered long runs.
- **Decoupling%** = (HR:pace 2nd half)/(1st half) − 1. <5% on long run = good aerobic durability; >5% = under-trained/under-fueled/overreached. (We have drift in workout_data.)
- **Run-walk (Higdon/Galloway):** valid for beginners + marathon >4:30 (4:1 or 5:1 run:walk).
- **Detraining:** VO2max −6-7% in 2-3 wks off, −20% by 8-12 wks. Cross-training: cycling 2:1-3:1 time vs run, aqua-jog 1:1 (best injury sub), elliptical 1.5:1.

## B. GAPS A GREAT RUNNING COACH NEEDS (ranked)
1. Adaptive weekly adjustment from real data (§1) = the product.
2. **Energy availability / RED-S (SAFETY, hard-gate).** EA = (intake − exercise kcal)/kg FFM. ≥45 optimal, 30-45 subclinical, <30 clinical LEA. Red flags: rapid weight loss, lost menstruation, frequent illness/injury, stalled paces despite training. NEVER push volume into suspected LEA; flag fueling first. The fatigue+high-HR-at-pace+adequate-recovery pattern must NEVER produce a "train harder" message. (ENCODED as a system-prompt gate + proactive nudge.)
3. **Female physiology:** optional cycle logging (late-luteal = higher RHR/effort/heat sensitivity, don't misread as overtraining); iron awareness; perimenopause; postpartum graded return. Min: don't pathologize cyclical signals + surface iron.
4. **Iron/ferritin:** runners prone to low ferritin; symptoms mimic overtraining (flat legs, high HR, breathless). Suggest ferritin check when fatigue+elevated HR-at-pace persist with adequate recovery. Performance suffers <30-40 ng/mL.
5. **Masters (40+):** VO2max −0.5-1%/yr after 35; need 72+h between hard; strength non-negotiable; 2:1 cutbacks; ramp intensity more conservatively (tendons adapt slower).
6. **Gut training:** practice 60-90 g carbs/hr IN long runs over 8-12 wks (carb-transporter capacity is trainable).
7. **Hydration/sodium + hyponatremia guard:** drink to thirst, ~400-800 ml/hr ceiling unless measured; never force beyond sweat rate. Sweat rate: weigh before/after 1h run, each kg ≈ 1L.
8. **Sleep** = #1 recovery lever; nudge if key session follows bad night.
9. **Caffeine:** 3-6 mg/kg ~45-60 min pre-race (+2-4%); practice; taper habitual intake 5-7 days pre.
10. **Downhill/net-downhill prep (Boston):** eccentric quad damage is the limiter; 6-8 wks progressive downhill, last session ~10-14 days out.
11. Mental skills, durability/decoupling tracking, course/weather goal-setting, travel/circadian.

## 1. ADAPTIVE ADJUSTMENT
Inputs/run: pace_delta=(actual-target)/target, hr_at_pace, decoupling%, completed%, RPE, felt-tags, cadence, 2-3wk baseline.
Key rules: long run missed → don't stack (next long = own length, +10% cap). Easy drifting Z3 (≥2 runs >89%LTHR) → enforce ceiling, slow 10-20s/km, −1 quality. Tempo slow at correct HR → fitness gap, LOWER working VDOT, keep volume. Tempo on-pace but HR high → fatigue, cut quality 20%. Intervals fading → fewer reps/longer recovery, not slower. Sore<72h → normal. Sore>72h/localized/bony → −20-30%, drop quality, bone screen. Sick above-neck → easy only; below-neck/fever → rest until 24-48h symptom-free, return 50-60%. RPE creep +≥2 → pull cutback forward. Cadence drop >5% late on long → cap long length. PB/breakthrough → recompute VDOT up, refresh paces, DON'T also raise volume.
**Overtraining/bone flags:** RHR +5-7bpm 2+ days → swap quality→easy; HRV <base−1SD 2-3 days → cut intensity; pace-at-fixed-HR slow >3-4%/2wk → deload now; perf+RPE+HR all wrong 3wk → mandatory −40-50% week; localized bony pain worsening during run / hurts to hop / point-tender → STOP, refer (high-risk: femoral neck, anterior tibia, navicular, sacrum).
**Precedence:** 1.bone-stress/below-neck illness overrides all → 2.overtraining cluster(≥2 flags)→deload → 3.single flag→soften → 4.positive→update paces hold volume → 5.nominal→normal progression.

## 2. IN-SESSION SCALING (rep mult by VDOT: <40 ×0.7, 40-49 ×1.0, 50-59 ×1.2, 60+ ×1.4)
T: Base 2×10min→20min cont; Build 25-30min or 4×8min/5×1km; Peak [MAR] 6×1mi or 2×15min, [HALF] 3×2km/4×1.5km. Cap 10% week.
I: Base 4×3min; Build 5×3min/5×1km; Peak [HALF] 5-6×3min/6×1km, [MAR] light. Rep ≤5min, jog rec 50-90%, ≤8% week.
R: 8×200m/6×400m, rec 1:2-1:3, ≤5% week. Strides 6-8×20s relaxed-fast. Hills 8-10×60-90s @I-R.
MP long [MAR]: Base 24km w/ last 5@M; Build 28-32 w/ 12-18@M; Peak 32 w/ 20-25@M (~3wk out). MP segment ≤25km.

## 3. WEEKLY TEMPLATES (long run Sun; ≥1 easy/rest between quality, rest after long, ≤2 quality)
[MAR] 5-day: Base R/E+ST/E/E/R/E/L · Build R/T/E/E+ST/R/E/L(FF) · Peak R/T/E/I-or-MPtune/R/E/L+MP.
[HALF] 5-day: Base R/T-short/E/E+ST/R/E/L · Build R/T/E/I/R/E/L(FF) · Peak R/I/E/T-cruise/R/E+ST/L.
[MAR] anchors long+MP+ML, I minimal. [HALF] carries TWO quality (I+T), capped long.

## 4. PROJECTION DEPTH
10K is a BETTER marathon predictor than 5K (less extrapolation) — our _bestRunPB already prefers the longest PB.
Examples: 18:00 5K→VDOT~56→half 1:22:49, mar raw 2:52:38 (×1.0-1.02 on 80-100km → ~2:53-2:56). 44:00 10K→VDOT~46.5→mar 3:22:27 half 1:37:05. Half 1:35→mar Riegel 3:18, report 3:18-3:28 w/ mileage swing.
Mid-block update: tune-up race (best) → recompute VDOT; MP long run confirms (decoupling<5% RPE≤6) or nudges slower (decoupling>7%); pace-at-HR improvement → projection gain ≈0.5-0.7× the %; rising cadence 175-185 + lower HR-at-pace = tighten range.

## 5. READINESS (rolling 7-day baseline; act on deviation)
RHR: green ≤+3, amber +4-6, red ≥+7/>7%. HRV: green ±0.5SD, amber −0.5..−1, red <−1SD (2+ days). Sleep: green ≥7h, amber 6-7, red <6 or <7 for 3+ nights.
Score = 100 − max(0,RHRΔ)*4 − max(0,(HRVbase-today)/base*100)*0.8 − max(0,7-sleep)*6 − soreness*2 − (10-motivation)*1.5. GREEN≥80 AMBER 60-79 RED<60.
No devices: pace-at-fixed-HR slow >3-4%/2wk, RPE creep, decoupling trend, 1-tap wellness (sleep/soreness/motivation/stress 1-5; drop ≥2=amber, ≥4=red). Response: 1 amber proceed+watch; 2 amber/1 red swap quality→easy; 2+ red/2 consecutive → full rest; red 3+ days → cut week short, screen illness/LEA/iron.

## 6. ENVIRONMENT (use DEW POINT for heat)
Heat pace cost (hold effort): dew <13C none, 13-16 +0.5-1%, 16-18 +1-2%, 18-21 +2-3%, 21-24 +3-5%, >24C +5-8%+ (effort-based/indoor). Judge by HR/RPE. Acclimatize 10-14 days, 60-90min/day in heat (~75% in wk1).
Cold: 0-10C negligible+longer WU; <−5C +1-3%, protect airway. Altitude: VO2max −1-2%/300m above 1500m, ~3-4% slower/1000m hard; race <24h after arrival OR ≥2 wks (avoid 2-7 day window); altitude-adjusted VDOT.
Downhill [MAR]: eccentric quad damage is the limiter (Boston/REVEL); 6-8 wks progressive downhill 1-2/wk, last ~10-14 days out (repeated-bout effect); don't brake, higher cadence, soft landing. Treadmill: 1% grade ≈ outdoor for >12km/h.
Race week/morning: carb-load 8-12 g/kg/day 36-48h; shake-out+strides day before; wake 3h pre; 1-4 g/kg carbs; caffeine 3-6 mg/kg 45-60min pre; nothing new; [MAR] start 1-3% slow first 5km.

## 7. STRENGTH & INJURY
Strength by phase: Base anatomical 2-3×12-20 light 2-3/wk; Build MAX STRENGTH 3-5×3-6 @80-90% 2/wk (economy, no bulk); Peak power/plyo 3-4×3-5 explosive 1-2/wk; Taper maintenance, stop ~10d out. Lift on quality days, not before key sessions.
Lifts: squat, deadlift/RDL, hip thrust, single-leg (split squat, step-up, SL-RDL, SL calf raise both knee angles), core (plank, side plank, Pallof, dead bug, bird dog), plyo (pogo, A-skip, low box, bounding; 40-60→80-120 contacts).
Injury triad: rapid load + low EA + biomech/bone-loading. Common: shin splints, Achilles, runner's knee, plantar, ITB, bone stress. Cadence 170-185 (raise 5-10% to cut overstride/load). Shoes: rotate 2-3 pairs, replace 500-800km, super-shoes for key/race only. Vary surface, avoid all-concrete.
Return-to-run: <1wk same; 1-2wk −20-30% rebuild 1-2wk; 2-4wk −40-50% rebuild 2-4wk no quality wk1; >4wk walk-run ~50% rebuild 4-8wk. ~1 rebuild wk per wk off. Niggle: resume when pain ≤2-3/10 not worsening during/after, walk-run reintro +10-15%/session. Bone stress: medical-led, no running weeks, cross-train pain-free, address cause (load/LEA).

## 8. PROACTIVE (trigger → intent; ≤1/category/wk, ≤2/day; race week = checklist+readiness only)
Mileage spike (jump>cap) → "capping next week + cutback." Easy creeping hard (≥2 Z3 easy) → "slow easy ~15s/km." Long skipped → "won't stack." Niggle/sore>72h or bony → "cut volume, hop test, check it." Plateau at fixed HR 3-4wk → "usually fatigue/iron/fuel, deload+check." Taper anxiety → "normal, fitness banked." Race week ≤7d → checklist. New PB → "updating paces, hold volume." ≥2 missed → "no cram make-ups, re-planned forward." Readiness red → "swap quality→easy." Strong long (decoupling<5%) → "durability improving." Fueling gap (long >90min no fuel) → "practice 30-60→60-90 g/hr." Inactivity 5+ days → "gentle re-entry?" Heat forecast → "adjusted pace + fluids." **LEA/iron (fatigue+high HR-at-pace+adequate recovery, persistent) → "often under-fueling or low iron; fuel more + ask doctor for ferritin." NEVER 'train harder'.**

*Judgment calls: Sunday long runs in templates (spacing rules matter, not days); dew point for heat (need it from weather source). Female cycle-tracking deliberately minimal (its own careful build). Calibrate: mileage fade (§marathon §8.3), decoupling/RPE deload thresholds.*
