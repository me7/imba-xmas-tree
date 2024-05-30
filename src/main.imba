global css * box-sizing:border-box bd:0px red2

let snowing = no
let snowFlakes = []

tag Toolbar
	<self[pos:abs zi:3]>
		<label> <input type="checkbox" bind=snowing /> "Is Snowing? {snowing}"

tag PlantGrid
	<self>
		<div[bg:cool2 s:500px]>

tag Snow
	def genFlakes
		for i in [0 .. 1000]
			let left = Math.random() * 2 * window.innerWidth
			let top = Math.random() * 2 * window.innerHeight
			let rate = Math.random() * 4 + 1
			let drop = {top, left, rate}
			snowFlakes.push drop

	<self @click=genFlakes>
		<%container [pos:abs t:0 l:0 w:100vw h:100vh]>
			<%snowflake [pos:abs bg:red z:2 bg:green s:15px]>

tag App
	<self[ff:sans]>
		<pre> "snowFlakes: {JSON.stringify(snowFlakes, null, 2)}"
		<Toolbar>
		<Snow>
		<PlantGrid[pos:abs l:10% t:35% zi:0]>

imba.mount <App>
