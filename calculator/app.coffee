express = require("express")
noflo = require("noflo")
jade = require("jade")

app = express()

app.set "views", __dirname + "/"
app.set "view engine", "jade"
app.use express.bodyParser()

app.get "/", (req, res) ->
  res.render "./calc.jade", resulttext: 0

app.post "/", (req, res) ->
	graph = noflo.graph.createGraph "calc"
	graph.addNode "Calc", "Calc"
	graph.addNode "Display", "Display"
	graph.addEdge "Calc", "out", "Display", "in"
	eval_string = req.body.eval_string
	console.log eval_string
	graph.addInitial [eval_string, res], "Calc", "in"
	noflo.createNetwork graph

app.listen 3000
console.log "Listen on port 3000"