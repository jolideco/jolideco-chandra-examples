rule run_jolideco:
    input:
        expand("results/{{config_name}}/{obs_id}/maps/{{config_name}}-{obs_id}-counts.fits", obs_id=config["chandra-data"]["obs_ids"]),
    log:
        notebook="results/{config_name}/jolideco/{config_name}-jolideco.ipynb"
    output:
        filename_jolideco_result="results/{config_name}/jolideco/{config_name}-result-jolideco.fits",
        filename_npred_stacked="results/{config_name}/jolideco/{config_name}-npred.fits",
    notebook:
        "../notebooks/jolideco-deconvolution.ipynb"