/// @title vinStrainCodex
/// @notice Catalogs herbal strains, their origin story, potency, and symbolic lineage.
contract vinStrainCodex {
    struct Strain {
        string name;
        string originRegion;
        string geneticLineage;
        string medicinalTraits;
        uint8  potencyScore; // 1-10 symbolic strength
        string ritualSymbol; // e.g. "Leaf of Reflection"
        bool   activeStatus;
    }

    mapping(string => Strain) public strains;
    string[] public strainNames;
    event StrainRegistered(string name, string ritualSymbol);

    /// @notice Add a new strain with full symbolic metadata
    function registerStrain(
        string calldata name,
        string calldata originRegion,
        string calldata geneticLineage,
        string calldata medicinalTraits,
        uint8 potencyScore,
        string calldata ritualSymbol
    ) external {
        require(potencyScore <= 10, "Symbolic potency max is 10");
        strains[name] = Strain({
            name: name,
            originRegion: originRegion,
            geneticLineage: geneticLineage,
            medicinalTraits: medicinalTraits,
            potencyScore: potencyScore,
            ritualSymbol: ritualSymbol,
            activeStatus: true
        });
        strainNames.push(name);
        emit StrainRegistered(name, ritualSymbol);
    }

    /// @notice Get list of all registered strain names
    function getAllStrains() external view returns (string[] memory) {
        return strainNames;
    }

    /// @notice Update symbolic status (e.g. deprecated or relic strain)
    function toggleStatus(string calldata name, bool newStatus) external {
        require(bytes(strains[name].name).length > 0, "Strain not found");
        strains[name].activeStatus = newStatus;
    }
}
