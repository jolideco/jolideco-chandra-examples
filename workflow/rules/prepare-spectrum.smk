rule prepare_spectrum:
    input:
        "resources/sherpa-model-e0102.py",
    output:
        filename_spectrum="results/{config_name}/spectral-fit/{irf_label}/{config_name}-{irf_label}-source-flux-chart.dat"
    log:
        "results/{config_name}/{irf_label}-prepare-spectrum.log",
    conda:
        "../envs/ciao-4.15.yaml"
    script:
        "../scripts/prepare_spectrum.py"