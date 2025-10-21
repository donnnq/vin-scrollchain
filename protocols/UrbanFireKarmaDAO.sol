// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanFireKarmaDAO {
    address public admin;

    struct FireEntry {
        string buildingName;
        string incidentDate;
        string karmaType; // "Electrical Fault", "Structural Neglect", "Infrastructure Delay"
        string emotionalTag;
        bool summoned;
        bool investigated;
        bool sealed;
    }

    FireEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFireAudit(string memory buildingName, string memory incidentDate, string memory karmaType, string memory emotionalTag) external onlyAdmin {
        entries.push(FireEntry(buildingName, incidentDate, karmaType, emotionalTag, true, false, false));
    }

    function confirmInvestigation(uint256 index) external onlyAdmin {
        entries[index].investigated = true;
    }

    function sealFireEntry(uint256 index) external onlyAdmin {
        require(entries[index].investigated, "Must be investigated first");
        entries[index].sealed = true;
    }

    function getFireEntry(uint256 index) external view returns (FireEntry memory) {
        return entries[index];
    }
}
