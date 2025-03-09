using SpacefarerService as service from '../../srv/service';

annotate service.GalacticSpacefarers with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: '{i18n>fullName}',
                Value: fullName,
                ![@UI.Hidden],
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>originPlanet}',
                Value: originPlanet,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>department}',
                Value: department_ID,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>position}',
                Value: position_ID,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>stardustCollection}',
                Value: stardustCollection,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>wormholeNavigationSkill}',
                Value: wormholeNavigationSkill,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>spacesuitColour}',
                Value: spacesuitColour,
            },
        ],
    },
    UI.Facets                    : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : '{i18n>generalInformation}',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: '{i18n>fullName}',
            Value: fullName,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>originPlanet}',
            Value: originPlanet,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>departmentName}',
            Value: department_ID,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>positionTitle}',
            Value: position_ID,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>stardustCollection}',
            Value: stardustCollection,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>wormholeNavigationSkill}',
            Value: wormholeNavigationSkill,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>spacesuitColour}',
            Value: spacesuitColour,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'SpacefarerService.EntityContainer/CreateSpacefarer',
            Label : '{i18n>createNewSpacefarer}'
        },
    ],
    UI.SelectionPresentationVariant #table : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    },
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : fullName,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : position_ID,
        },
    },
    UI.SelectionFields : [
        originPlanet,
        position_ID,
        spacesuitColour,
        stardustCollection,
    ],
);

annotate service.GalacticSpacefarers with {
    department @(
        Common.Text: department.name,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            Label         : '{i18n>department}',
            CollectionPath: 'IntergalacticDepartments',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: 'department_ID',
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name'
                }
            ]
        },
    )
};

annotate service.GalacticSpacefarers with {
    position @(
        Common.Text: position.title,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            Label         : '{i18n>position}',
            CollectionPath: 'SpacefaringPositions',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: 'position_ID',
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'title'
                }
            ]
        }
    );
};
