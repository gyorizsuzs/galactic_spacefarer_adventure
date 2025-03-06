sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'galactic/adventures/galacticspacefareradventures/test/integration/FirstJourney',
		'galactic/adventures/galacticspacefareradventures/test/integration/pages/GalacticSpacefarersList',
		'galactic/adventures/galacticspacefareradventures/test/integration/pages/GalacticSpacefarersObjectPage'
    ],
    function(JourneyRunner, opaJourney, GalacticSpacefarersList, GalacticSpacefarersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('galactic/adventures/galacticspacefareradventures') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheGalacticSpacefarersList: GalacticSpacefarersList,
					onTheGalacticSpacefarersObjectPage: GalacticSpacefarersObjectPage
                }
            },
            opaJourney.run
        );
    }
);