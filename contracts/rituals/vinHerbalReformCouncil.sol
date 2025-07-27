/// @title vinHerbalReformCouncil
/// @notice Localized cannabis policy proposal contract for societal harm reduction and wellness integration.
contract vinHerbalReformCouncil {
    struct CouncilMember {
        string name;
        string role;
        string region;
        bool    supportsLegalization;
        string  communityTestimony;
    }

    CouncilMember[] public members;
    mapping(string => bool) public endorsedRegions;
    event MemberAdded(string name, string region, string testimony);
    event RegionEndorsed(string region);

    /// @notice Add council member to represent community perspective
    function addMember(
        string calldata name,
        string calldata role,
        string calldata region,
        bool supportsLegalization,
        string calldata communityTestimony
    ) external {
        members.push(CouncilMember({
            name: name,
            role: role,
            region: region,
            supportsLegalization: supportsLegalization,
            communityTestimony: communityTestimony
        }));
        emit MemberAdded(name, region, communityTestimony);
    }

    /// @notice Endorse a region for trial legalization
    function endorseRegion(string calldata region) external {
        endorsedRegions[region] = true;
        emit RegionEndorsed(region);
    }

    /// @notice Fetch number of supportive council members
    function getSupportCount() external view returns (uint256) {
        uint count = 0;
        for (uint i = 0; i < members.length; i++) {
            if (members[i].supportsLegalization) {
                count++;
            }
        }
        return count;
    }
}
