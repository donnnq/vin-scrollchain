// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BorderEthicsDAO {
    address public admin;

    struct BorderEntry {
        string checkpoint;
        string hostCountry;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    BorderEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBorder(string memory checkpoint, string memory hostCountry, string memory emotionalTag) external onlyAdmin {
        entries.push(BorderEntry(checkpoint, hostCountry, emotionalTag, true, false, false));
    }

    function auditBorder(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealEthics(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getBorderEntry(uint256 index) external view returns (BorderEntry memory) {
        return entries[index];
    }
}
