# stats2data-publications

Scripts and data that support the results reported in the manuscript
"Simulating Raw Data from Reported Summary Statistics: A Non-parametric
Approach", which introduces the R package
[stats2data](https://github.com/sebastian-lortz/stats2data).

## Contents

| File/ folder | Purpose |
|---|---|
| `simulation_study.R` | Simulation study for the descriptives (`optim_vec`) and regression (`optim_mlr`) modules; figures |
| `aov_simulation_study.R` | Simulation study for the ANOVA module (`optim_aov`); figures |
| `empirical_example.R` | Empirical example (ANOVA module; Reynolds & Besner, 2008, Experiment 5) |
| `plot_theme.R`, `moment_plane_graph.R` | Plot theme and helpers, sourced by the simulation scripts |
| `compile_jobs.R` | Writes the 100 HPC job scripts in `hpc/` from `aov_simulation_study.R` |
| `hpc/batch1.R` to `batch100.R` | ANOVA simulation jobs as run on the HPC (job *i* uses seed 310779 + *i*) |
| `merge_jobs.R` | Merges the 100 job results into `results/aov_mc_res` |
| `install.R` | Installs stats2data from source on the HPC + other packages |
| `results/` | Stored simulation results (`.rds` objects read with `readRDS()`) |
| `plots/` | Figures as produced by the scripts |

Stored results:

- `results/vec_mc_res`: descriptives module (N = 300, R = 1e5)
- `results/lm_mc_res`: regression module (N = 300, 500 conditions, R = 100)
- `results/3e4_aov_mc_res_001` ... `_100`: ANOVA module, one file per HPC job
- `results/aov_mc_res`: merged ANOVA results (500 conditions, n = 75, R = 100)
- `results/var_tbl`: variance partition table, created by `aov_simulation_study.R`
- `results/out_parallel_aov.rds`: empirical example

## Requirements

- R and stats2data version `0.0.1.000`, the version used for the reported results:

  ```r
  remotes::install_github("sebastian-lortz/stats2data")
  ```

## Reproducing the figures

Open `stats2data-publications.Rproj` (the scripts use the project folder as
working directory) and run `simulation_study.R`, `aov_simulation_study.R` or
`empirical_example.R`. By default (`HPC <- FALSE`, `run_vec`, `run_mlr` and
`run_aov` set to `FALSE`), the simulation scripts load the stored results from
`results/` and write the figures to `plots/`. `empirical_example.R` always
reruns the example and overwrites its results and figures.

## Rerunning the simulations

The simulations ran on an HPC cluster (Habrok, University of Groningen). The
script headers give the resources used

- Descriptives and regression: set `run_vec <- TRUE` and/or
  `run_mlr <- TRUE` in `simulation_study.R` (and `HPC <- TRUE` on the cluster,
  with the repository cloned to the `root_dir` path given in the script).
- ANOVA: run `compile_jobs.R` to write the job scripts to `hpc/` (they set
  `HPC <- TRUE` and `run_aov <- TRUE`), run each `hpc/batch*.R` on the
  cluster, copy the job results to `results/` and run `merge_jobs.R`.

All simulations are seeded (seed 310779; ANOVA job *i*: 310779 + *i*).