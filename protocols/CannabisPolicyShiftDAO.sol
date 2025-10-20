// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CannabisPolicyShiftDAO {
    address public admin;

    struct PolicyEntry {
        string region;
        string politicalActor;
        string reformClause;
        string emotionalTag;
        bool summoned;
        bool acknowledged;
        bool sealed;
    }

    PolicyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPolicy(string memory region, string memory politicalActor, string memory reformClause, string memory emotionalTag) external onlyAdmin {
        entries.push(PolicyEntry(region, politicalActor, reformClause, emotionalTag, true, false, false));
    }

    function confirmAcknowledgment(uint256 index) external onlyAdmin {
        entries[index].acknowledged = true;
    }

    function sealPolicyEntry(uint256 index) external onlyAdmin {
        require(entries[index].acknowledged, "Must be acknowledged first");
        entries[index].sealed = true;
    }

    function getPolicyEntry(uint256 index) external view returns (PolicyEntry memory) {
        return entries[index];
    }
}
