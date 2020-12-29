function saveOrphanage(db, orphanage) {
    return db.run(`
    INSERT INTO orphanages (
        lat,
        lng,
        name,
        about,
        whatsapp,
        images,
        instructions,
        open_hours,
        open_on_weekends
    ) VALUES (
        ${orphanage.lat},
        ${orphanage.lng},
        ${orphanage.name},
        ${orphanage.about},
        ${orphanage.whatsapp},
        ${orphanage.images},
        ${orphanage.instructions},
        ${orphanage.open_hours},
        ${orphanage.open_on_weekends}
    );
`);
}

module.exports = saveOrphanage;