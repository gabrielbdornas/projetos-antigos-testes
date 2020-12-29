const db = require('./database/db');
const Database = require('./database/db');
const saveOrphanage = require('./database/saveOrphanage');


module.exports = {
    index(req, res) {
        return res.render('index')
    },

    orphanage(req, res) {
        try {
            const db = await Database;
            const orphanages = await db.all('SELECT * FROM orphanages');
            return res.render('orphanage');
        } catch (error) {
            console.log(error);
            return res.send('Erro no banco de dados');
        }
    },

    async orphanages(req, res) {
        try {
            const db = await Database;
            const orphanages = await db.all('SELECT * FROM orphanages');
            //return res.render('orphanages');
        } catch (error) {
            console.log(error);
            return res.send('Erro no banco de dados');
        }        
    },

    createOrphanage(req, res) {
        return res.render('create-orphanage')
    }

}