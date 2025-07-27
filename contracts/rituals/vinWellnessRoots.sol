/// @title vinWellnessRoots
/// @notice Implements regulated personal cultivation, medical research integration, and localized franchise-like access.
contract vinWellnessRoots {
    enum Role { INDIVIDUAL, RESEARCHER, FRANCHISE }
    
    struct Grower {
        string name;
        Role role;
        uint8 potsAllowed;
        string region;
        bool hasPermit;
        string purpose;
    }

    mapping(address => Grower) public growers;
    mapping(string => address[]) public regionalFranchises;
    event PermitIssued(address indexed grower, string region, Role role);

    /// @notice Apply to become a grower with defined purpose and region
    function applyPermit(
        string calldata name,
        Role role,
        uint8 potsAllowed,
        string calldata region,
        string calldata purpose
    ) external {
        require(potsAllowed <= 2 || role != Role.INDIVIDUAL, "Max 2 pots for individuals");

        growers[msg.sender] = Grower({
            name: name,
            role: role,
            potsAllowed: potsAllowed,
            region: region,
            hasPermit: true,
            purpose: purpose
        });

        if (role == Role.FRANCHISE) {
            regionalFranchises[region].push(msg.sender);
        }

        emit PermitIssued(msg.sender, region, role);
    }

    /// @notice Get franchise operators by region
    function getFranchises(string calldata region) external view returns (address[] memory) {
        return regionalFranchises[region];
    }
}
