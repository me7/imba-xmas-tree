global css * box-sizing:border-box bd:0px red2

let snowing = no
let snowFlakes = []
let interval

tag Toolbar
	<self[zi:3]>
		<label> <input type="checkbox" bind=snowing /> "Is Snowing? {snowing}"

tag PlantGrid
	<self>
		<div[bg:cool2 s:300px]>

tag Snow
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
			imba.commit!

	def setup
		genFlakes!

	<self[t:0 l:0 w:100vw h:100vh]>
		<button @click=step> "Step run"
		if snowing
			interval = setInterval(step, 200)
		else
			clearInterval(interval)

		for drop in snowFlakes
			<div[pos:abs l:{drop.left} top:{drop.top} bg:green s:2px]>

tag App
	<self[ff:sans]>
		<Toolbar[pos:abs t:10]>
		<pre[pos:abs t:50]> "snowFlakes: {JSON.stringify(snowFlakes[0], null, 2)}"
		<Snow[pos:abs zi:1]>
		<PlantGrid[pos:abs l:10% t:35% zi:0]>

imba.mount <App>
