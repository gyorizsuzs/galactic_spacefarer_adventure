using { galactic.adventures as my } from '../db/schema';

service SpacefarerService @(restrict: [
    { grant: 'READ', to: 'authenticated-user', where: 'originPlanet = $user.originPlanet' },
    { grant: '*', to: 'admin' }
]) {
    entity GalacticSpacefarers as projection on my.GalacticSpacefarers {
        *,
        department.name as departmentName,
        position.title as positionTitle
    };
    entity IntergalacticDepartments as projection on my.IntergalacticDepartments;
    entity SpacefaringPositions as projection on my.SpacefaringPositions;
}