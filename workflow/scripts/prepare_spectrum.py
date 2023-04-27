from pathlib import Path

from sherpa_contrib.chart import save_chart_spectrum

with Path("resources/sherpa-model-e0102.py").open("r") as fh:
    exec(fh.read())

e_min = 0.5
e_max = 7
e_width = 0.01

save_chart_spectrum(
    str(snakemake.output[0]),
    elow=e_min,
    ehigh=e_max,
    ewidth=e_width,
    clobber=True,
)
