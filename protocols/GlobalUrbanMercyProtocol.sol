// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalUrbanMercyProtocol {
    address public admin;

    struct MercyEntry {
        string city;
        string mercyType;
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    MercyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMercy(string memory city, string memory mercyType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(MercyEntry(city, mercyType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealMercyEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getMercyEntry(uint256 index) external view returns (MercyEntry memory) {
        return entries[index];
    }
}
