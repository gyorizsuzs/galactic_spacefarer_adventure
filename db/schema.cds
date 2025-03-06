namespace sap.galactic;

entity GalacticSpacefarer {
    key ID : UUID;
    fullName : String(100);
    originPlanet : String(50);
    stardustCollection : Integer;
    wormholeNavigationSkill : Integer;
    spacesuitColour : String(30);
    department : Association to IntergalacticDepartment;
    position : Association to SpacefaringPosition;
}

entity IntergalacticDepartment {
    key ID : UUID;
    name : String(50);
}

entity SpacefaringPosition {
    key ID : UUID;
    title : String(50);
}