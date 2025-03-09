const cds = require('@sap/cds');
const nodemailer = require('nodemailer');

module.exports = class SpacefarerService extends cds.ApplicationService {
  init() {
    const { GalacticSpacefarers, IntergalacticDepartments, SpacefaringPositions } = cds.entities('SpacefarerService')

    this.before(['CREATE', 'UPDATE'], GalacticSpacefarers, async (req) => {
      const { stardustCollection, wormholeNavigationSkill } = req.data;

      if (stardustCollection < 0 || wormholeNavigationSkill < 0) {
        req.error(400, 'Stardust Collection and Wormhole Navigation Skill cannot be negative.');
      }

      req.data.stardustCollection = stardustCollection || 100;
      req.data.wormholeNavigationSkill = wormholeNavigationSkill || 5;
    });

    this.after(['CREATE', 'UPDATE'], GalacticSpacefarers, async (galacticSpacefarers, req) => {
      const { fullName } = galacticSpacefarers;
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

    this.after('READ', GalacticSpacefarers, async (galacticSpacefarers, req) => {
      console.log('After READ GalacticSpacefarers', galacticSpacefarers);
    });

    return super.init()
  }
}
