rule prepare_spectrum:
    input:
        expand("results/{{config_name}}/{obs_id}/spectra/{{irf_label}}/{{config_name}}-{obs_id}-{{irf_label}}.pi", obs_id=config["chandra-data"]["obs_ids"])
    output:
        filename_spectrum="results/{config_name}/spectral-fit/{irf_label}/{config_name}-{irf_label}-source-flux-chart.dat"
    log:
        "results/{config_name}/{irf_label}-prepare-spectrum.log",
    conda:
        "../envs/ciao-4.15.yaml"
    script:
        "../scripts/prepare_spectrum.py"