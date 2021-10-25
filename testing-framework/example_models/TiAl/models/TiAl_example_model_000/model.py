# Model for Stillinger-Weber with original parameters for Si (Z=14)

#make sure you've got these installed!
from quippy.potential import Potential
from utilities import path_of_file


# A module defining a module needs to define only one variable,
# named `calculator`, which should be an instance of the ase.calculator.Calculator,
# a subclass of this, or a compatible class implementing the calculator interface.

#in this folder you should have your TiAl.xml and all other relavent files. TiAl.xml.sparseX.GAP_number_with_the_data_on_it.

#this is where we are attaching our GAP model as a calculator. If you change the name of your GAP output
#to something_different.xml  Make sure you make the changes here too!
calculator = Potential(param_filename=(path_of_file(__file__)+"/TiAl.xml"))
no_checkpoint = True

#make sure the name of the model matches the folder name the model is contained in.
name = 'TiAl_example_model_000'
