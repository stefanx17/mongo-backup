function getRandomNumber(min, max) {
	return Math.floor(Math.random() * (max - min + 1) + min);
}

database = 'test'
var db = connect('localhost:27017/' + database);

for (var i = 1; i <= no_entries; i++) {
	db.getCollection(database).insert(
	{
		name   : "name" + getRandomNumber(0, no_entries),
		random_info : "info" + getRandomNumber(0, no_entries)
	})
}
