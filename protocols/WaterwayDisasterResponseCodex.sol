// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WaterwayDisasterResponseCodex {
    address public admin;

    struct ResponseEntry {
        string segmentName;
        string disasterType;
        string responseClause;
        string emotionalTag;
        bool summoned;
        bool deployed;
        bool sealed;
    }

    ResponseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonResponse(string memory segmentName, string memory disasterType, string memory responseClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ResponseEntry(segmentName, disasterType, responseClause, emotionalTag, true, false, false));
    }

    function confirmDeployment(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function sealResponseEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getResponseEntry(uint256 index) external view returns (ResponseEntry memory) {
        return entries[index];
    }
}
