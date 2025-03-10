using SpacefarerService as service from '../../srv/service';

annotate service.GalacticSpacefarers with @(
    odata.draft.enabled                   : true,
    UI.FieldGroup #GeneratedGroup         : {
        $Type: 'UI.FieldGroupType',
        Data : [
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
    UI.Facets                             : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : '{i18n>generalInformation}',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],
    UI.LineItem                           : [
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
    ],
    UI.HeaderInfo                         : {
        Title         : {
            $Type: 'UI.DataField',
            Value: fullName,
        },
        TypeName      : '{i18n>Spacefarer}',
        TypeNamePlural: '{i18n>Spacefarers}',
        Description   : {
            $Type: 'UI.DataField',
            Value: position_ID,
        },
    },
    UI.SelectionFields                    : [
        originPlanet,
        position_ID,
        department_ID,
        spacesuitColour,
        stardustCollection,
    ],
UI.DeleteHidden : true,
);

annotate service.GalacticSpacefarers with {
    originPlanet @Common.Label : '{i18n>originPlanet}'
};

annotate service.GalacticSpacefarers with {
    spacesuitColour @Common.Label : '{i18n>spacesuitColour}'
};

annotate service.GalacticSpacefarers with {
    stardustCollection @Common.Label : '{i18n>stardustCollection}'
};

annotate service.GalacticSpacefarers with {
    position @(
        Common.Text : {
            $value : position.title,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'SpacefaringPositions',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : position_ID,
                    ValueListProperty : 'ID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.SpacefaringPositions with {
    ID @Common.Text : {
        $value : title,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.GalacticSpacefarers with {
    department @(
        Common.Text : {
            $value : department.name,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'IntergalacticDepartments',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : department_ID,
                    ValueListProperty : 'ID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.IntergalacticDepartments with {
    ID @Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
