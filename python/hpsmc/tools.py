import os

from hpsmc.base import Component

class StdHepTool(Component):

    def __init__(self, **kwargs):
        Component.__init__(self, **kwargs)        
        self.command = "stdhep_" + self.name

    def cmd_args(self):
        if len(self.outputs):
            self.args.insert(0, self.outputs[0])
        if len(self.inputs):
            self.args.insert(0, self.inputs[0])
        return self.args

class SLIC(Component):

    def __init__(self, **kwargs):
        self.name = "slic"
        Component.__init__(self, **kwargs)
        self.command = self.name
        if "detector" in kwargs:
            self.detector = kwargs["detector"]
        else:
            raise Exception("Missing detector argument for SLIC.")
        if self.nevents == -1:
            self.nevents = 999999999
 
    def cmd_args(self):
        if not len(self.inputs):
            raise Exception("No inputs given for SLIC.")
        detector_file = os.path.join(os.environ["HPSMC_DETECTOR_DIR"], self.detector, self.detector + ".lcdd")
        if not len(self.outputs):
            outputs.append("slic_events.slcio")
        self.args = ["-g", detector_file, "-i", self.inputs[0], "-o", self.outputs[0], "-r", str(self.nevents)]
        return self.args

    def setup(self):
        if not os.path.exists("./fieldmap"):
            os.symlink(os.environ["HPSMC_FIELDMAPS_DIR"], "fieldmap")

class JobManager(Component):

    def __init__(self, **kwargs):
        self.name = "HPS Java Job Manager"
        Component.__init__(self, **kwargs)
        self.command = "java"
        if "steering_resource" in kwargs:
            self.steering_resource = kwargs["steering_resource"]
        elif "steering_file" in kwargs:
            self.steering_file = kwargs["steering_file"]
        else:
            raise Exception("A steering resource or file was not provided to hps-java.")
        if "defs" in kwargs:
            self.defs = kwargs["defs"]
        else:
            self.defs = {}
        if "java_args" in kwargs:
            self.java_args = kwargs["java_args"]
        else:
            self.java_args = ["-Xmx500m", "-XX:+UseSerialGC"]

    def cmd_args(self):
        if not len(self.inputs):
            raise Exception("No inputs provided to hps-java.")
        self.args.extend(self.java_args)
        self.args.append("-jar")
        self.args.append(os.environ["HPSJAVA_JAR"])
        self.args.append("-i")
        self.args.append(self.inputs[0])
        if len(self.outputs):
            self.args.append("-D")
            self.args.append("outputFile="+self.outputs[0])
        for k,v in self.defs.iteritems():
            self.args.append("-D")
            self.args.append(k+"="+v)
        if self.steering_resource is not None:
            self.args.append("-r")
            self.args.append(self.steering_resource)
        elif self.steering_file is not None:
            self.args.append(self.steering_file)
        return self.args
    
class JavaTool(Component):
    
    def __init__(self, **kwargs):
        self.name = "HPS Java Tool"
        Component.__init__(self, **kwargs)
        self.command = "java"
        if "java_args" in kwargs:
            self.java_args = kwargs["java_args"]
        else:
            self.java_args = ["-Xmx500m", "-XX:+UseSerialGC"]
        if "java_class" in kwargs:
            self.java_class = kwargs["java_class"]
        elif self.java_class is None:
            raise Exception("Missing java_class argument for JavaTool.")
            
    def cmd_args(self):
        orig_args = self.args
        self.args = []
        self.args.extend(self.java_args)
        self.args.append("-cp")
        self.args.append(os.environ["HPSJAVA_JAR"])
        self.args.append(self.java_class)
        self.args.extend(orig_args)
        return self.args
    
class FilterMCBunches(JavaTool):
    
    def __init__(self, **kwargs):
        self.name = "Filter MC Bunches"
        self.java_class = "org.hps.util.FilterMCBunches"
        JavaTool.__init__(self, **kwargs)
        if "ecal_hit_ecut" in kwargs:
            self.ecal_hit_ecut = kwargs["ecal_hit_ecut"]
        else:
            self.ecal_hit_ecut = None
        if "event_interval" in kwargs:
            self.event_interval = kwargs["event_interval"]
        else:
            raise Exception("Missing required event_interval arg for FilterMCBunches.")
        if "enable_ecal_energy_filter" in kwargs:
            self.enable_ecal_energy_filter = kwargs["enable_ecal_energy_filter"]
        else:
            self.enable_ecal_energy_filter = False 
        if self.nevents == -1:
            raise Exception("Missing required nevents arg for FilterMCBunches.")
                    
    def cmd_args(self):
        if not len(self.inputs):
            raise Exception("Missing required inputs for FilterMCBunches.")
        if not len(self.outputs):
            raise Exception("Missing required outputs for FilterMCBunches.")
        orig_args = self.args
        self.args = JavaTool.cmd_args(self)
        self.args.append("-e")
        self.args.append(str(self.event_interval))
        for i in self.inputs:
            self.args.append(i)
        self.args.append(self.outputs[0])
        if self.enable_ecal_energy_filter:
            self.args.append("-d")
        if self.ecal_hit_ecut is not None:
            self.args.append("-E")
            self.args.append(str(self.ecal_hit_ecut))
        self.args.append("-w")
        self.args.append(str(self.nevents))
        return self.args

class DST(Component):
 
    def __init__(self, **kwargs):
        self.name = "HPS DST Maker"
        self.command = "dst_maker"
        Component.__init__(self, **kwargs)
        
    def cmd_args(self):
        if not len(self.outputs):
            raise Exception("Missing required outputs for DST.")
        if not len(self.inputs):
            raise Exception("Missing required inputs for DST.")
        self.args = []
        self.args.append("-o")
        self.args.append(self.outputs[0])
        if self.nevents != -1:
            self.args.append("-n")
            self.args.append(str(self.nevents))
        for i in self.inputs:
            self.args.append(i)
        return self.args
                