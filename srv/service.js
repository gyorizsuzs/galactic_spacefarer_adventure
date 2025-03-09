const cds = require('@sap/cds');
const nodemailer = require('nodemailer');

module.exports = cds.service.impl(async (srv) => {
    const db = await cds.connect.to('db');
    const { GalacticSpacefarers, IntergalacticDepartments, SpacefaringPositions } = db.entities;

    srv.before('CreateSpacefarer', async req => {
        const { stardustCollection, wormholeNavigationSkill, departmentName, positionTitle } = req.data;

        const department = await db.run(SELECT.one.from(IntergalacticDepartments).where`LOWER(name) = LOWER(${departmentName})`);
        if (!department) {
            req.error(400, `Invalid department: ${departmentName}`);
        }
        
        const position = await db.run(SELECT.one.from(SpacefaringPositions).where`LOWER(title) = LOWER(${positionTitle})`);
        if (!position) {
            req.error(400, `Invalid position: ${positionTitle}`);
        }
        
        if (stardustCollection < 0 || wormholeNavigationSkill < 0) {
            req.error(400, 'Stardust Collection and Wormhole Navigation Skill cannot be negative.');
        }
        
        req.data.department_ID = department.ID;
        req.data.position_ID = position.ID;
        req.data.stardustCollection = stardustCollection || 100;
        req.data.wormholeNavigationSkill = wormholeNavigationSkill || 5;
    });

    srv.on('CreateSpacefarer', async req => {
        const { fullName, originPlanet } = req.data;
        if (!fullName || !originPlanet) req.error(400, 'Full Name and Origin Planet are required fields!');

        await db.run(INSERT.into(GalacticSpacefarers).entries(req.data));

        const newSpacefarer = await db.run(
            SELECT.one.from(GalacticSpacefarers).where({ fullName }).limit(1)
        );

        // console.log('Inserted record:', newSpacefarer);
        req.notify(`New spacefarer ${fullName} created successfully!`);
        return newSpacefarer;
    });

    srv.after('CreateSpacefarer', async (newSpacefarer, req) => {
        const { fullName } = newSpacefarer;
        const transporter = nodemailer.createTransport({
            host: 'sandbox.smtp.mailtrap.io',
            port: 2525,
            auth: { user: '96d6ea00d65a2d', pass: '9da77ef093ae7f' }
        });

        const mailOptions = {
            from: 'spacefleetmanagement@galaxy.com',
            to: 'newspacefarer@example.com',
            subject: 'Welcome to your Galactic Spacefarer Adventure!',
            text: `Dear ${fullName},\n\nCongratulations! Your journey has begun!`
        };

        await transporter.sendMail(mailOptions);
    });
})