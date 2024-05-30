global css * box-sizing:border-box bd:0px red2

let snowing = no
tag Toolbar
	<self[pos:abs zi:3]>
		<label> <input type="checkbox" bind=snowing /> "Is Snowing? {snowing}"

tag PlantGrid
	<self>
		<div[bg:cool2 s:500px]>

tag Snow
	<self>
		<%container [pos:abs t:0 l:0 w:100vw h:100vh]>
			<%snowflake [pos:abs bg:red z:2 bg:green s:15px]>

tag App
	<self[ff:sans]>
		<Toolbar>
		<Snow>
		<PlantGrid[pos:abs l:10% t:35% zi:0]>

imba.mount <App>
