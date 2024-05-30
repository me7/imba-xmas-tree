global css * box-sizing:border-box bd:0px red2

let snowing = no
let interval
let snowFlakes = []

tag Toolbar
	<self[zi:3]>
		<label> <input type="checkbox" bind=snowing /> "Is Snowing? {snowing}"

tag PlantGrid
	<self>
		<div[bg:cool2 s:300px]>

tag Snow
	iv
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
		iv = window.setInterval(step, 1000)

	def stop
		clearInterval iv

	@observable snowF = snowFlakes
	<self[t:0 l:0 w:100vw h:100vh]>
		css button m:1
		<button @click=step> "Step run {interval}"
		<button @click=run> "Run {iv}"
		<button @click=stop> "Stop {iv}"
		for drop in snowF
			<div[pos:abs l:{drop.left} top:{drop.top} bg:green s:2px]>

tag App
	<self[ff:sans]>
		<Toolbar[pos:abs t:10]>
		<pre[pos:abs t:50]> "snowFlakes: {JSON.stringify(snowFlakes[0], null, 2)}"
		<Snow[pos:abs zi:1]>
		<PlantGrid[pos:abs l:10% t:35% zi:0]>

imba.mount <App>
