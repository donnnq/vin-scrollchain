// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalOceanicTreatyProtocol {
    address public admin;

    struct TreatyEntry {
        string oceanRegion;
        string treatyName;
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool ratified;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTreaty(string memory oceanRegion, string memory treatyName, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TreatyEntry(oceanRegion, treatyName, protocolClause, emotionalTag, true, false, false));
    }

    function confirmRatification(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function sealTreatyEntry(uint256 index) external onlyAdmin {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
