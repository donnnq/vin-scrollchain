// Master scroll to summon all sanctuaries
contract vinScrollForgeIndex {
    string[] public sanctuaries;

    event ScrollSummoned(string name);

    constructor() {
        sanctuaries.push("vinFoodSanctuary");
        sanctuaries.push("vinHealthAccessPulse");
        sanctuaries.push("vinClimateEchoShield");
        sanctuaries.push("vinMentalSanctum");
        sanctuaries.push("vinDignityMirror");
        sanctuaries.push("vinEducationSanctuary");
        sanctuaries.push("vinAnimalGuardian");
        sanctuaries.push("vinPeaceTether");
        sanctuaries.push("vinMigrationSanctum");
    }

    function summonScroll(uint256 index) external {
        require(index < sanctuaries.length, "Invalid scroll.");
        emit ScrollSummoned(sanctuaries[index]);
    }
}
