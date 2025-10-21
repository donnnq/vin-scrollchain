// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RestStopSovereigntyProtocol {
    address public admin;

    struct RestStopEntry {
        string locationSegment;
        string amenityType;
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool built;
        bool sealed;
    }

    RestStopEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRestStop(string memory locationSegment, string memory amenityType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RestStopEntry(locationSegment, amenityType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmBuild(uint256 index) external onlyAdmin {
        entries[index].built = true;
    }

    function sealRestStopEntry(uint256 index) external onlyAdmin {
        require(entries[index].built, "Must be built first");
        entries[index].sealed = true;
    }

    function getRestStopEntry(uint256 index) external view returns (RestStopEntry memory) {
        return entries[index];
    }
}
