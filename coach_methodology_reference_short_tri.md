# Coach Reference: short_tri (Sprint / Olympic triathlon)

> `short_tri` = Friel short-course (Triathlete's Training Bible) + general multisport. Race AT or ABOVE threshold.
> Pair 4. Compiled 2026-05-24 (round 15). Compact, codeable summary. Most of the engine (capped ramp, R1/R3/R6 guardrails, deload cadence, adaptive adjustment, load model, projection) is shared with the IM/70.3 tri build (`coach_methodology_reference.md` + `_part2.md`) — this doc only captures what is DIFFERENT for short course.

## 0. Shared with long-course tri
Same projection engine (`computeTriProjection` / `_triFinish`), same deterministic guardrails, same Friel zone language (LTHR-based). `_TRI_DIST`: olympic = swim 1500 / bike 40km / run 10k / T1 120s / T2 90s; sprint = swim 750 / bike 20km / run 5k / T1 90s / T2 60s. Same assessment-week-if-no-LTHR behavior (isFrielPersona).

## 1. THE KEY DIFFERENCE vs long course
Short course is **raced at or above threshold**, so training carries a HIGHER hard fraction than Ironman.
- INTENSITY: ~30-35% of weekly time moderate-hard or higher (Z3-Z5), rest genuinely easy. (IM is ~20%, polarized.)
- Olympic ≈ a sustained threshold race → anchor quality on THRESHOLD. Sprint is above threshold → tilt more toward VO2max + race-pace.
- Still keep easy easy and hard hard; the larger hard share does NOT mean grey-zone everything.

## 2. STRUCTURE / VOLUME
- VOLUME: Olympic 7-12 h/wk, Sprint 5-9 h/wk. (Code: `max_volume_for_experienced` 11, `first_timer` 7; min 2.5.)
- Phases prep→base1-3→build1-2→peak→taper→race (already in PERSONAS short_tri.phases). Deload every 4 wks (cut 30%), taper cut 35%.
- SPORT SPLIT (by time): Olympic swim 15-20 / bike 45-50 / run 30-35; Sprint swim 15-20 / bike 45-50 / run 32-38 (more run-weighted, more intensity). Bike still the biggest block.

## 3. SIGNATURE SESSION = THE BRICK
- 1-2 bricks/wk (bike straight into run), 45-90 min total. The defining short-course session.
- From Build on, at least one is a RACE-PACE brick simulation:
  - Sprint: ~30-40 min bike @ race watts + 10-15 min run @ 5K-race effort.
  - Olympic: ~40-60 min bike @ race effort + 15-25 min run @ 10K-race pace.
- Always write the transition cue ("run first km controlled, legs settle by km 2").

## 4. QUALITY (threshold-priority)
- Weekly threshold in each sport: bike cruise intervals 3-4x8-10 min @ 95-105% FTP; run T-pace cruise intervals or 20-30 min tempo; swim CSS sets 8-10x100 @ CSS (15s rest).
- VO2max in Build 2 / Peak for top-end (bike 5x3 min, run 5x1000m) — heavier for sprint.
- LONG STAYS MODEST: long ride Sprint 1.5-2 h / Olympic 2-3 h; long run Sprint 45-75 min / Olympic 60-90 min. Do NOT chase IM volume — short course rewards intensity, speed, economy.

## 5. RACE-PACE TARGETS (Friel, %LTHR)
- Sprint: run 95-100% LTHR, bike 92-100% LTHR.
- Olympic: run 92-97% LTHR, bike 88-95% LTHR.
- Easy days <82% LTHR; threshold 100-103% LTHR.

## 6. TRANSITIONS + SWIM
- Practice T1/T2 in Build/Peak (wetsuit strip, mount/dismount, shoe changes). Short course is often won/lost in transitions + first km off the bike.
- Swim short and fast. Open-water sessions w/ sighting if the race is OW; else CSS pool intervals. Swim is the smallest time slice — protect the legs but build speed.

## 7. PROJECTION (already coded, verified vs IM/70.3 examples)
- `_triFinish`: run = best run PB via Riegel × tri-fatigue (short course: adv 1.03 / int 1.05 / beg 1.08 — much smaller than IM 1.12-1.20 because the run leg is short). Bike = aerobic speed × race factor (olympic 1.11, sprint 1.14 — ridden well above Z2). Swim = CSS + 3s buffer (else tier default ~118s/100m, sprint -). Bike default 32 km/h base.
- Confidence: HIGH needs CSS + bike measured + ≥10 wk; MEDIUM = one + ≥5 wk; range HIGH ±3 / MED ±7 / LOW ±13%.

## 8. STRENGTH / AUX
- Strength 2x/wk Base, 1x/wk Build/Peak, none race week. Single-leg, core, compound. Mobility 10 min daily.

## ENCODED 2026-05-24 (round 15)
generatePlan prompt: added `isShortTri`/`isSprint` flags, short-course sport-split line, and a short-course plan-rule block (§1-6 above). Projection (§7) was already live via computeTriProjection. Voice/intensity_targets already in PERSONAS.short_tri. Round-2 depth (open-water specifics, draft-legal vs non-draft Olympic pacing, brick periodization detail) optional/deferred.
