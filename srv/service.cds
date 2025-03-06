using { galactic.adventures as my } from '../db/schema';

service SpacefarerService {
    entity GalacticSpacefarers as projection on my.GalacticSpacefarers;
    entity IntergalacticDepartments as projection on my.IntergalacticDepartments;
    entity SpacefaringPositions as projection on my.SpacefaringPositions;
}