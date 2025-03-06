const cds = require('@sap/cds');
const nodemailer = require('nodemailer');

module.exports = (srv) => {
    const i18n = cds.i18n();
    const userLocale = req.user?.locale || 'en';
    const t = i18n(userLocale);

    srv.before('CREATE', 'GalacticSpacefarers', async req => {
        const { stardustCollection, wormholeNavigationSkill } = req.data;
        if (stardustCollection < 0 || wormholeNavigationSkill < 0) {
            req.error(400, t('validation.negativeValues'));
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
            subject: t('welcome.subject'),
            text: t('welcome.text', [data.fullName])
        };

        await transporter.sendMail(mailOptions);
    })
}