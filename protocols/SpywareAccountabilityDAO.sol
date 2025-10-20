// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SpywareAccountabilityDAO {
    address public admin;

    struct SpywareEntry {
        string spywareName;
        string targetPlatform;
        string legalClause;
        string emotionalTag;
        bool summoned;
        bool barred;
        bool sealed;
    }

    SpywareEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBar(string memory spywareName, string memory targetPlatform, string memory legalClause, string memory emotionalTag) external onlyAdmin {
        entries.push(SpywareEntry(spywareName, targetPlatform, legalClause, emotionalTag, true, false, false));
    }

    function confirmBar(uint256 index) external onlyAdmin {
        entries[index].barred = true;
    }

    function sealSpywareEntry(uint256 index) external onlyAdmin {
        require(entries[index].barred, "Must be barred first");
        entries[index].sealed = true;
    }

    function getSpywareEntry(uint256 index) external view returns (SpywareEntry memory) {
        return entries[index];
    }
}
