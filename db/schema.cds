// using { sap, managed } from '@sap/cds/common';
namespace galactic.adventures;

entity GalacticSpacefarers {
    key ID : UUID;
    fullName : String(100);
    originPlanet : String(50);
    stardustCollection : Integer;
    wormholeNavigationSkill : Integer;
    spacesuitColour : String(30);
    department : Association to IntergalacticDepartments;
    position : Association to SpacefaringPositions;
}

entity IntergalacticDepartments {
    key ID : UUID;
    name : String(50);
}

entity SpacefaringPositions {
    key ID : UUID;
    title : String(50);
}