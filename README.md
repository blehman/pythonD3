# IPython & D3
(HUGE thanks to [Monte Lunacek](https://twitter.com/MonteLunacek) for
teaching me his hack with the custom D3 module!)  
<br>
Let's start with reviewing a few of the ideas for using JavaScript in IPython. We'll then work with some data in python and then build a few d3 visualizations. We'll conclude by crafting a custom module that can receive data and render the d3 viz! 

### JS with IPython?
The nice thing about ipython is that we can write in almost any lanaguage. For example, we can use javascript below and pull in the D3 library.

### Python data | D3 Viz
A basic method is to serialze your results and then render html that pulls in the data. In this example, we save a json file and then load the html doc in an IFrame. We're now using D3 in ipython!  

The example below is adapted from: 
* Hagberg, A & Schult, D. & Swart, P. Networkx (2011). Github repository, https://github.com/networkx/networkx/tree/master/examples/javascript/force

### Passing data from IPython to JS
Let's create some random numbers and render them in js (see the [stackoverflow explanation](http://stackoverflow.com/questions/26207668/how-to-use-python-defined-variables-in-javascript-code-within-ipython-notebook) and discussion).

### Passing data from JS to IPython
We can also interact with js to define python variables (see [this example](https://jakevdp.github.io/blog/2013/06/01/ipython-notebook-javascript-python-communication/)).

### Custom D3 module.
Now we're having fun. The simplicity of this process wins. We can pass data to javascript via a module called visualize that contains an attribute `plot_circle`, which uses jinja to render our js template. The advantage of using jinja to read our html is apparent: we can pass variables directly from python!  
<br>
**Now we just need to learn how to write useful javacript!**
(Enter Jason)
