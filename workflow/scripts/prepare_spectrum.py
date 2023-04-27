from pathlib import Path

from sherpa_contrib.chart import save_chart_spectrum

with Path("../../resources/sherpa-model-e0102.py").open("r") as fh:
    exec(fh.read())

e_min = 0.5
e_max = 7


DATASET_IDS = [
    f"obs-id-{obs_id}" for obs_id in snakemake.config["chandra-data"]["obs_ids"]
]


for dataset_id, filename in zip(DATASET_IDS, snakemake.input):
    load_data(dataset_id, filename)
    group_counts(dataset_id, 10)

notice(e_min, e_max)

save_chart_spectrum(
    str(snakemake.output[0]), elow=e_min, ehigh=e_max, clobber=True, id=DATASET_IDS[0]
)
