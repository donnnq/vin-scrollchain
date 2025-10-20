// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsequenceBroadcastDAO {
    address public admin;

    struct BroadcastEntry {
        string incidentType;
        string location;
        string consequenceClause;
        string emotionalTag;
        bool summoned;
        bool broadcasted;
        bool sealed;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBroadcast(string memory incidentType, string memory location, string memory consequenceClause, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(incidentType, location, consequenceClause, emotionalTag, true, false, false));
    }

    function confirmBroadcast(uint256 index) external onlyAdmin {
        entries[index].broadcasted = true;
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
