# This file contains a simple example of creating and modifying a hypergraph using the
# SimpleHypergraphs module.
#
# The python stuff is used only for plotting the hypergraph with the HyperNetX python module.
using Pkg

pkg"add SimpleHypergraphs"
pkg"status SimpleHypergraphs"
pkg"add GraphPlot"
pkg"add PyCall Conda"

using PyCall
using Conda
Conda.runconda(`install matplotlib --yes`)
Conda.runconda(`install networkx --yes`)
run(`$(PyCall.python) -m pip install hypernetx`)

using SimpleHypergraphs
import LightGraphs

h = Hypergraph{Float64}(5,4)
h[1:3,1] .= 1.5
h[3,4] = 2.5
h[2,3] = 3.5
h[4,3:4] .= 4.5
h[5,4] = 5.5
h[5,2] = 6.5
add_vertex!(h)
add_hyperedge!(h)
h[5,5] = 1.2
h[6,5] = 1.3

fig = SimpleHypergraphs.plt.figure(figsize=[5, 5])
ax = SimpleHypergraphs.plt.gca()
draw(h, HyperNetX; width=5, height=5, no_border=true, ax=ax)
display(fig)
