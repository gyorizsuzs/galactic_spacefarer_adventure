const cds = require('@sap/cds');
const nodemailer = require('nodemailer');

module.exports = (srv) => {
    srv.before('CREATE', 'GalacticSpacefarers', async req => {
        const { stardustCollection, wormholeNavigationSkill } = req.data;
        if (stardustCollection < 0 || wormholeNavigationSkill < 0) {
            req.error(400, 'Stardust Collection and Wormhole Navigation Skill cannot be negative.');
        }
        req.data.stardustCollection = stardustCollection || 100;
        req.data.wormholeNavigationSkill = wormholeNavigationSkill || 5;
    });

    srv.after('CREATE', 'GalacticSpacefarers', async (data, req) => {
        const transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: { user: 'example-email@gmail.com', pass: 'example-password' }
        });

        const mailOptions = {
            from: 'spacefleetmanagement@galaxy.com',
            to: 'newspacefarer@example.com',
            subject: 'Welcome to your Galactic Spacefarer Adventure!',
            text: `Dear ${data.fullName},\n\nCongratulations! Your journey has begun!`
        };

        await transporter.sendMail(mailOptions);
    })
}