// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SonicWallPerimeterOverrideDAO {
    address public admin;

    struct OverrideEntry {
        string firewallModel;
        string exploitVector;
        string overrideClause;
        string emotionalTag;
        bool deployed;
    }

    OverrideEntry[] public overrides;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitOverride(string memory _firewallModel, string memory _exploitVector, string memory _overrideClause, string memory _emotionalTag) external onlyAdmin {
        overrides.push(OverrideEntry(_firewallModel, _exploitVector, _overrideClause, _emotionalTag, false));
    }

    function deployOverride(uint256 index) external onlyAdmin {
        overrides[index].deployed = true;
    }

    function getOverride(uint256 index) external view returns (OverrideEntry memory) {
        return overrides[index];
    }
}
