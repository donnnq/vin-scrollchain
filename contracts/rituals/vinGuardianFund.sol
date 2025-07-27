/// @title vinGuardianFund
/// @notice Provides budget allocations and relief to police units lacking resources due to calamity or systemic gaps.
contract vinGuardianFund {
    struct PoliceUnit {
        string name;
        string region;
        uint256 allocatedBudget;
        bool isActive;
        uint256 aidClaimed;
        string recentChallenge; // e.g. "Post-typhoon rescue burnout"
    }

    mapping(string => PoliceUnit) public units;
    string[] public registeredUnits;
    event AidAllocated(string name, uint256 amount);
    event UnitRegistered(string name, string region);

    /// @notice Register a police unit for funding eligibility
    function registerUnit(
        string calldata name,
        string calldata region,
        string calldata recentChallenge
    ) external {
        units[name] = PoliceUnit({
            name: name,
            region: region,
            allocatedBudget: 0,
            isActive: true,
            aidClaimed: 0,
            recentChallenge: recentChallenge
        });
        registeredUnits.push(name);
        emit UnitRegistered(name, region);
    }

    /// @notice Allocate budget to a registered unit
    function allocateAid(string calldata name, uint256 amount) external {
        require(units[name].isActive, "Unit not active or registered");
        units[name].allocatedBudget += amount;
        emit AidAllocated(name, amount);
    }

    /// @notice View budget status of any registered police unit
    function viewUnitBudget(string calldata name) external view returns (uint256 allocated, uint256 claimed) {
        PoliceUnit memory unit = units[name];
        allocated = unit.allocatedBudget;
        claimed = unit.aidClaimed;
    }
}
