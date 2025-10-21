// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalDockDemocracyProtocol {
    address public admin;

    struct DemocracyEntry {
        string dockName;
        string governanceModel;
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool voted;
        bool sealed;
    }

    DemocracyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDemocracy(string memory dockName, string memory governanceModel, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(DemocracyEntry(dockName, governanceModel, protocolClause, emotionalTag, true, false, false));
    }

    function confirmVote(uint256 index) external onlyAdmin {
        entries[index].voted = true;
    }

    function sealDemocracyEntry(uint256 index) external onlyAdmin {
        require(entries[index].voted, "Must be voted first");
        entries[index].sealed = true;
    }

    function getDemocracyEntry(uint256 index) external view returns (DemocracyEntry memory) {
        return entries[index];
    }
}
