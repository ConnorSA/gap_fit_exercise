import os.path, lattice

properties = lattice.do_lattice(os.path.abspath(os.path.dirname(__file__)), 'orthorhombic', n_steps=(-2,2))
