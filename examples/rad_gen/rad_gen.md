Radiative event generation {#radgen}
==========================

This is an example of how to use rad_gen_job.py. The job generates rad events using MadGraph5 and transforms the output from lhe to stdhep to then tag the mother particle and rotate the events to beam coordinates.
 
#### Job parameters
There are no special run parameters that need to be set for this job other than the general ones discussed on the [examples main page](@ref examples).

#### Job template
This example includes a job template. The variables used in this template mostly have the same name and meaning as the job parameters above. Their values are set in `vars.json`.