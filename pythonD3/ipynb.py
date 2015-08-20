"""
Copied from http://mpld3.github.io/

"""

import os
from . import __path__

def write_ipynb_local_js(location=None, d3_src=None):

    try:
        from IPython.html import install_nbextension
    except ImportError:
        location = os.getcwd()
        nbextension = False
    else:
        nbextension = True

    d3_src = os.path.join(os.path.dirname(__file__), 'd3.v3.min.js')

    d3js = os.path.basename(d3_src)

    if not os.path.exists(d3_src):
        raise ValueError("d3 src not found at '{0}'".format(d3_src))

    if nbextension:
        try:
            install_nbextension(d3_src,user=True)
        except IOError:
            # files may be read only. We'll try deleting them and re-installing
            from IPython.utils.path import get_ipython_dir
            nbext = os.path.join(get_ipython_dir(), "nbextensions")

            for src in [d3_src]:
                dest = os.path.join(nbext, os.path.basename(src))
                if os.path.exists(dest):
                    os.remove(dest)
            install_nbextension(d3_src, user=True)

write_ipynb_local_js()
