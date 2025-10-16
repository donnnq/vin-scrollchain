// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaSnackEquityCodex {
    address public admin;

    struct SnackEntry {
        string dishName;
        string originCountry;
        string locationFound;
        string emotionalTag;
        bool documented;
        bool protected;
    }

    SnackEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logSnack(string memory dishName, string memory originCountry, string memory locationFound, string memory emotionalTag) external onlyAdmin {
        entries.push(SnackEntry(dishName, originCountry, locationFound, emotionalTag, true, false));
    }

    function protectSnack(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getSnack(uint256 index) external view returns (SnackEntry memory) {
        return entries[index];
    }
}
