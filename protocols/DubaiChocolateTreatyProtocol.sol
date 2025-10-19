// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DubaiChocolateTreatyProtocol {
    address public admin;

    struct TreatyEntry {
        string brandName;
        string pistachioSource;
        string treatyClause;
        string emotionalTag;
        bool summoned;
        bool endorsed;
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

    function summonTreaty(string memory brandName, string memory pistachioSource, string memory treatyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TreatyEntry(brandName, pistachioSource, treatyClause, emotionalTag, true, false, false));
    }

    function confirmEndorsement(uint256 index) external onlyAdmin {
        entries[index].endorsed = true;
    }

    function sealTreatyEntry(uint256 index) external onlyAdmin {
        require(entries[index].endorsed, "Must be endorsed first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
