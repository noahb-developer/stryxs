# Projection Engine: Constants, Fallback Defaults, and Unit-Test Anchors

Companion to the methodology spec. Every worked example was computed in Python and is internally consistent (assert with the Part C tolerances: ~2 s sub-hour, ~15 s multi-hour). No em-dashes. Tags: [EST]=established model/formula, [CONV]=coaching convention in a researched range, [EST*]=defensible estimate, not one canonical source.

Physics constants for all cycling math (expose these, they dominate output):
- rho = 1.225 kg/m^3 sea level [EST]; g = 9.81; Crr = 0.005 good road tire [EST*]
- CdA = 0.32 hoods, 0.30 tri/aero bars [EST*]; mass = rider+bike (examples 78 kg)
- Power: `P = 0.5*rho*CdA*v^3 + Crr*m*g*cos(theta)*v + m*g*sin(theta)*v`, NO drivetrain-loss term, solve v by bisection.

## Part A: Exact constants

### A.1 Riegel k by sport/level [formula EST, k-by-level EST*]
`T2 = T1 * (D2/D1)^k`. Riegel 1981 original k=1.06 (3.5-230 min).
| Level (running) | k 5K..HM | k HM..Marathon |
|---|---|---|
| Elite / high mileage | 1.05 | 1.06-1.07 |
| Trained | 1.06 (DEFAULT) | 1.08-1.10 |
| Recreational | 1.07-1.08 | 1.10-1.13 |
Women fade slightly less: subtract ~0.01-0.02 from marathon k. Do NOT use Riegel below 1500m or past ~4 h.

### A.2 VDOT [EST, Daniels] gold standard 1500m-HM; more conservative than Riegel k=1.06 at marathon. Use Riegel as live mechanism, VDOT as sanity bound. Don't hard-code invented VDOT cells.

### A.3 CSS fade (swim) [formula EST; fades EST*]
CSS=(D2-D1)/(t2-t1) m/s from 400+200 TT; pace/100=(t400-t200)/2.
| Distance vs CSS test | Pace adj per 100m |
|---|---|
| 50-100 sprint | CSS minus 8-12 s (faster) |
| 200-1500 | on line |
| 1900 (70.3) | +2 s |
| 3800 (IM) | +4 s |
| OW wetsuit | distance fade, then x0.94-0.97 |

### A.4 Tri race-pace targets [CONV: Friel, Sutton, Coggan IF]
| Distance | Swim vs CSS | Bike IF (NP/FTP) | Run (fraction of fresh open pace) |
|---|---|---|---|
| Sprint | ~100% | 0.90-0.95 | 0.95-1.00 open 5K |
| Olympic | 95-100% | 0.80-0.88 | 0.92-0.96 open 10K |
| 70.3 | 95% | 0.78-0.83 | 0.88-0.92 open HM |
| Ironman | ~95% | 0.68-0.75 | 0.80-0.88 open-marathon equiv |
Run fraction 0.84 means race pace = open_pace / 0.84 (slower). DEFAULT to conservative end when durability thin.

### A.5 Cycling sustainable %FTP by duration [CONV: Coggan/Allen]
| Duration | IF |
|---|---|
| ~20 min | 1.02-1.06 |
| 40 km TT (~50-70 min) | 0.90-1.00 |
| 2 h | 0.80-0.85 |
| 100 mi fondo (4-6 h) | 0.65-0.72 |
| IM bike (5-6 h) | 0.68-0.75 |
FTP: 60-min max [EST]; 20-min x0.95 [CONV]; CP from P=CP+W'/t over 3+ [EST]; ramp ~75% 1-min peak [EST*].

### A.6 Terrain/heat/wind/altitude [magnitudes EST*, mechanisms EST]
| Factor | Effect | Magnitude |
|---|---|---|
| Run heat | slows pace | +2-3% per 5C above ~15C (Ely et al.) |
| Ultra vert | flat-equiv | ~100 m ~0.6-1.0 km (GAP Minetti 2002); hike >15-20% |
| Cycling wind/gradient | physics | cubic drag / m*g*sin term |
| Altitude | lowers VO2max/power | -1-2% per 300 m above ~1500 m |
| Cycling draft | lowers CdA | group saves 25-40% power; CdA x0.6-0.75 |
| Swim wetsuit | buoyancy | 3-7% faster (~5-10 s/100) |
| Tri transitions | flat add | T1/T2 30 s-4 min each |

## Part B: Fallback defaults
Order best->worst: PB at goal distance -> PB other distance (convert) -> modeled threshold from maximal effort -> speed/power at LTHR from clean steady data -> population prior by tier (last resort, wide band).

### B.1 Last-resort priors [EST*, band +/-10-20%]
| Tier | Run threshold | FTP W/kg | Swim CSS /100 |
|---|---|---|---|
| Beginner | 6:00-6:45/km | 2.0-2.7 | 2:10-2:30 |
| Intermediate | 4:30-5:30/km | 2.8-3.5 | 1:45-2:05 |
| Advanced | 3:40-4:20/km | 3.6-4.5 | 1:25-1:45 |
Women ~6-12% slower run/swim, ~15-20% lower absolute FTP at same tier (W/kg gap smaller).

### B.2 LTHR defaults [CONV Friel]: LTHR=avg HR final 20 min of 30-min TT. If only HRmax: LTHR ~0.92-0.95 x HRmax run, ~0.90-0.93 x HRmax bike [EST*].

## Part C: Worked examples (input -> expected output). Assert +/-2 s sub-hour, +/-15 s multi-hour.

### C.1 Running (Riegel unless noted)
1. 5K 20:00, trained k=1.06 -> 10K **41:42**
2. 5K 20:00, k=1.06 -> HM **1:32:00**
3. 5K 20:00, trained k=1.06 -> Marathon **3:11:49** (FLAG optimistic)
4. 5K 20:00, recreational k=1.12 -> Marathon **3:38:01**
5. 10K 40:00, k=1.06 -> HM **1:28:15**
6. 10K 40:00, k=1.10 -> Marathon **3:14:55**
7. HM 1:30:00, trained k=1.08 -> Marathon **3:10:16**
8. HM 1:30:00, recreational k=1.12 -> Marathon **3:15:37**
9. HM 1:45:00, k=1.10 -> Marathon **3:45:04**
10. 5K 20:00 -> Mile, Riegel k=1.06 = **6:01 (DO NOT USE: underpredicts)**; correct path anchors mile from 400/800 reps
11. Marathon target 3:00:00 at 25C (~+5% heat) -> **3:09:00**
12. Training-only threshold 4:00/km from 30-min TT -> HM x1.04 = **1:27:46**; Marathon x1.10 = **3:05:39**
13. Ultra 50K 1000 m vert, base flat M pace 5:00/km: flat-equiv 57 km (vert x0.7), ultra pace 5:45/km (x1.15) -> **5:27:45**

### C.2 Cycling (physics; CdA noted; FTP examples mass 78 kg)
1. FTP 250 W, flat solo, CdA 0.32 -> **36.9 km/h**
2. FTP 250, 40 km TT at 95% (238 W), CdA 0.32 -> **36.2 km/h, 1:06:20**
3. FTP 300, 40 km TT at 95% (285 W) -> **38.7 km/h, 1:01:59**
4. Fondo 100 mi, FTP 250, IF 0.70 (175 W), SOLO, CdA 0.32 -> **32.2 km/h, 4:59:32**
5. Same fondo IN GROUP (CdA x0.70) -> **36.0 km/h, 4:28:30** (this gap is the usual "too slow" cause)
6. 10 km climb 5% grade, 225 W (0.90 FTP) -> **17.4 km/h, 34:31**
7. CP from 5-min 320 W and 20-min 270 W -> **CP 253 W, W' 20.0 kJ**, FTP ~0.95xCP = **241 W** (FLAG CP != FTP)
8. Training-only best 20-min 263 W -> FTP **250 W**
9. FTP 250 at 2400 m (~-4.5%) -> **239 W**
10. Speed-only: 30 km/h at LTHR flat solo -> 40 km TT ~**1:20:00**, band **1:12:44 to 1:28:53** (+/-8-15%)

### C.3 Swimming (CSS test 400=6:00, 200=2:50 -> CSS 1.053 m/s, pace 1:35/100)
1. 1500 at CSS -> **23:45**
2. 1900 at CSS+2 s/100 -> **30:43**
3. 3800 at CSS+4 s/100 -> **1:02:42**
4. 3800 OW wetsuit (x0.94) -> **58:56** (1:33/100)
5. 100 sprint ~CSS-10 s -> **1:25/100**
6. Training-only 400=6:00 + best 100=1:18 -> CSS ~**1.06 m/s, 1:34/100** (FLAG: 100 anaerobic biases fast; prefer 400+200)

### C.4 Triathlon (full assembly; CdA 0.30 aero bars, FTP 250, CSS 1:40/100, open paces 5K 4:00, 10K 4:10, HM 4:25, M 4:45 /km)
1. SPRINT (750/20/5): swim 12:30, T1 1:00, bike 32:46 (36.6 km/h, 232 W IF0.93), T2 0:45, run 20:37 (4:07/km) -> **1:07:38**
2. OLYMPIC (1500/40/10): swim 25:15, T1 1:30, bike 1:07:47 (35.4 km/h, 212 W IF0.85), T2 1:00, run 44:20 (4:26/km) -> **2:19:51**
3. 70.3 (1900/90/21.1): swim 32:18, T1 2:30, bike 2:36:02 (34.6 km/h, 200 W IF0.80), T2 2:00, run 1:43:32 (4:54/km, 0.90 open HM) -> **4:56:23**
4. IRONMAN (3800/180/42.2): swim 1:05:52, T1 4:00, bike 5:28:25 (32.9 km/h, 175 W IF0.70), T2 3:00, run 3:58:36 (5:39/km, 0.84 open M) -> **10:39:54**
5. Brick (IM run): fresh open M 4:45/km=3:20:30; IM run at 0.84 = 5:39/km = **3:58:36**
6. Training-only IM: FTP from 20-min (263->250), threshold run 4:30/km from tempo, CSS from 400+200, conservative ends (IF 0.68, run 0.82, swim ~CSS), wider band

## Part D: Guards to encode
- Anchor from peaks not averages. Assert anchor effort >= 95% of best matching-duration effort in window.
- ONE correction stack. Never multiply a threshold anchor by both a race % and a separate durability fade for the same effect.
- Scope all Part A tables per persona. Tri bike IF + run fraction must NOT apply in standalone cyclist/runner personas.
- Confidence band by anchor quality (see Appendix A).
- Every projection ships its one-line why string naming the factor that moved it most.

KEY: bike % is on POWER not speed (power ~ v^3). Apply IF to power, then physics-solve for speed. Speed-only fallback = wide band, flagged. CdA/Crr dominate cycling output: expose as inputs, widen band when assumed.
