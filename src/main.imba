global css 
	* box-sizing:border-box bd:0px red2
	body bg:gray7 c:white

let snowing = no
let snowFlakes = []

tag Toolbar
	<self[zi:3]>
		<label> <input type="checkbox" bind=snowing /> "Is Snowing? {snowing}"

tag PlantGrid
	<self>
		<div[bg:cool2 s:300px]>

tag Snow
	iv = 0
	def genFlakes
		for i in [0 .. 1000]
			let left = Math.random() * 2 * window.innerWidth
			let top = Math.random() * 2 * window.innerHeight
			let rate = Math.random() * 4 + 1
			let drop = {top, left, rate}
			snowFlakes.push drop

	def step
		for drop , index in snowFlakes
			let {top, left, rate} = drop
			if top > window.innerHeight or left < 0
				snowFlakes[index] = {top: 0, left: Math.random() * 2 * window.innerWidth, rate}
			else
				snowFlakes[index] = {top: top + rate, left: left - rate, rate}
		console.log(Date())
		imba.commit!
		

	def setup
		genFlakes!

	def run
		if iv == 0
			iv = window.setInterval(step, 0)

	def stop
		clearInterval iv
		iv = 0

	<self[t:0 l:0 w:100vw h:100vh]>
		css button m:1 p:2
		<button @click=step> "Step run"
		<button @click=run> "Run {iv}"
		<button @click=stop> "Stop {iv}"
		if snowing
			step!
		for drop in snowFlakes
			<div[pos:abs l:{drop.left} top:{drop.top} bg:red s:3px]>

tag App
	<self[ff:sans]>
		<Toolbar[pos:abs t:10]>
		<pre[pos:abs t:50]> "snowFlakes: {JSON.stringify(snowFlakes[0], null, 2)}"
		<Snow[pos:abs zi:5]>
		<PlantGrid[pos:abs zi:1 l:10% t:35% zi:0 bg:red]>

imba.mount <App>
