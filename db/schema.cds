using { managed } from '@sap/cds/common';
namespace galactic.adventures;

entity GalacticSpacefarers : managed {
    key ID : UUID @cuid;
    fullName : String(100) @title : '{i18n>fullName}' @mandatory;
    originPlanet : String(50) @title : '{i18n>originPlanet}' @mandatory;
    stardustCollection : Integer @title : '{i18n>stardustCollection}';
    wormholeNavigationSkill : Integer @title : '{i18n>wormholeNavigationSkill}';
    spacesuitColour : String(30) @title : '{i18n>spacesuitColour}';
    department : Association to IntergalacticDepartments @title : '{i18n>departmentName}';
    position : Association to SpacefaringPositions @title : '{i18n>positionTitle}';
}

entity IntergalacticDepartments : managed {
    key ID : UUID @cuid;
    name : String(50) @title : '{i18n>department}';
}

entity SpacefaringPositions : managed {
    key ID : UUID @cuid;
    title : String(50) @title : '{i18n>position}';
}

// annotate GalacticSpacefarers with @odata.draft.enabled;
