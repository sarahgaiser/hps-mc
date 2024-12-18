Transformation to beam coordinates  {#beamcoords}
==================================
This example shows how to use beam_coords.py which transforms the input stdhep file into beam coordinates. The parameters given in the job.json file can be used to fine tune the beam position and orientation for more in depth analysis.

#### Job parameters
This table contains parameters special to the beam\_coords job. The general parameters are discussed on the [examples main page](@ref examples).
| param          |                           |
|----------------|---------------------------|
| beam\_sigma\_x | ?                         |
| beam\_sigma\_y | ?                         |
| beam\_rot\_x   | ?                         |
| beam\_rot\_y   | ?                         |
| beam\_rot\_z   | ?                         |
| target\_x      | x position of target      |
| target\_y      | y position of target      |
| target\_z      | z position of target      |
| input\_files   | beam.stdhep files         |
| output\_files  | rotated beam.stdhep files |
