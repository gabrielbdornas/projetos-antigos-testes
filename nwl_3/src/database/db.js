const Database = require('sqlite-async');
const { orphanage } = require('../pages');
const saveOrphanage = require('./saveOrphanage')

Database.then(async db => { //await saveOrphanage(db, { orphanage }) 

    await db.all('SELECT * FROM orphanages')
});

module.exports = Database.open(__dirname + '/database.sqlite').then(execute)