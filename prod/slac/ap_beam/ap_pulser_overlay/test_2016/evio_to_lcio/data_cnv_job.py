"""!
@file data_cnv_job.py

Convert EVIO to LCIO and then process with HPSTR to produce a recon tuple.
"""
from hpsmc.tools import EvioToLcio, HPSTR

job.description = 'EVIO converter'

cnv = EvioToLcio(steering='recon')

job.add([cnv])
