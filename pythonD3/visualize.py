import os
import jinja2 as jin
import json

from IPython.core.display import display, HTML

from . import __path__
def plot_circle(data, id=1):

    path = os.path.join(os.path.dirname(__file__), '.')
    template_env = jin.Environment(loader=jin.FileSystemLoader(path))
    index = template_env.get_template('circle.tpl')

    d3_src = '/nbextensions/d3.v3.min.js' 

    output = index.render( { 'nodes': json.dumps(data),
                            'id': id,
                            'd3_url': d3_src })

    return display(HTML(output.decode('utf-8')))

