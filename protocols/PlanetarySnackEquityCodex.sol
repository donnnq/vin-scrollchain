// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetarySnackEquityCodex {
    address public admin;

    struct SnackEntry {
        string snackName;
        string region;
        string emotionalTag;
        bool summoned;
        bool validated;
        bool distributed;
    }

    SnackEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSnack(string memory snackName, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(SnackEntry(snackName, region, emotionalTag, true, false, false));
    }

    function validateSnack(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function distributeSnack(uint256 index) external onlyAdmin {
        require(entries[index].validated, "Must be validated first");
        entries[index].distributed = true;
    }

    function getSnackEntry(uint256 index) external view returns (SnackEntry memory) {
        return entries[index];
    }
}
