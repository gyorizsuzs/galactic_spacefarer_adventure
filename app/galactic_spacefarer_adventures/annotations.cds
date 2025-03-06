using SpacefarerService as service from '../../srv/service';

annotate service.GalacticSpacefarers with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>fullName}',
                Value : fullName,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>originPlanet}',
                Value : originPlanet,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>department}',
                Value : departmentName,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>position}',
                Value : positionTitle,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>stardustCollection}',
                Value : stardustCollection,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>wormholeNavigationSkill}',
                Value : wormholeNavigationSkill,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>spacesuitColour}',
                Value : spacesuitColour,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>generalInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>fullName}',
            Value : fullName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>originPlanet}',
            Value : originPlanet,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>departmentName}',
            Value : departmentName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>positionTitle}',
            Value : positionTitle,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>stardustCollection}',
            Value : stardustCollection,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>wormholeNavigationSkill}',
            Value : wormholeNavigationSkill,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>spacesuitColour}',
            Value : spacesuitColour,
        },
    ],
);

// annotate service.GalacticSpacefarers with {
//     department @Common.ValueList : {
//         $Type : 'Common.ValueListType',
//         CollectionPath : 'IntergalacticDepartments',
//         Parameters : [
//             {
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : department_ID,
//                 ValueListProperty : 'ID',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'name',
//             },
//         ],
//     }
// };

// annotate service.GalacticSpacefarers with {
//     position @Common.ValueList : {
//         $Type : 'Common.ValueListType',
//         CollectionPath : 'SpacefaringPositions',
//         Parameters : [
//             {
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : position_ID,
//                 ValueListProperty : 'ID',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'title',
//             },
//         ],
//     }
// };