const cds = require('@sap/cds');
const { configDotenv } = require('dotenv');
const nodemailer = require('nodemailer');
require('dotenv').config;

module.exports = class SpacefarerService extends cds.ApplicationService {
  init() {
    const { GalacticSpacefarers, IntergalacticDepartments, SpacefaringPositions } = cds.entities('SpacefarerService')

    this.before(['CREATE', 'UPDATE'], GalacticSpacefarers, async (req) => {
      // console.log(req.user, req.user.is('admin'), req.user.is('authenticated'), req.user.attr.level);
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
        auth: { user: process.env.USER, pass: process.env.PASS }
      });

      const mailOptions = {
        from: 'spacefleetmanagement@galaxy.com',
        to: 'newspacefarer@example.com',
        subject: 'Welcome to your Galactic Spacefarer Adventure!',
        text: `Dear ${fullName},\n\nCongratulations! Your journey has begun!`
      };

      await transporter.sendMail(mailOptions);
    });

    this.before('READ', GalacticSpacefarers, async (galacticSpacefarers, req) => {
      console.log('Before READ GalacticSpacefarers', galacticSpacefarers.query.SELECT.limit);
      // galacticSpacefarers.query.SELECT.limit.rows.val = Math.min(galacticSpacefarers.query.SELECT.limit.rows.val, 10);
    });

    return super.init()
  }
}
