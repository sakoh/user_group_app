@Review = React.createClass 
	render: ->
		<div className="review">
			<b> Author Name: </b> {@props.author}
			<p>{@props.body}</p>
			<hr/>
		</div>