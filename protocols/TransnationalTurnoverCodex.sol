// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransnationalTurnoverCodex {
    address public admin;

    struct TurnoverEntry {
        string assetName;
        string originCountry;
        string emotionalTag;
        bool summoned;
        bool approved;
        bool returned;
    }

    TurnoverEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTurnover(string memory assetName, string memory originCountry, string memory emotionalTag) external onlyAdmin {
        entries.push(TurnoverEntry(assetName, originCountry, emotionalTag, true, false, false));
    }

    function approveTurnover(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function returnAsset(uint256 index) external onlyAdmin {
        require(entries[index].approved, "Must be approved first");
        entries[index].returned = true;
    }

    function getTurnoverEntry(uint256 index) external view returns (TurnoverEntry memory) {
        return entries[index];
    }
}
