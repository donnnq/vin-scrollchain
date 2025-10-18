// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GreenCardVisualStyleCodex {
    address public admin;

    struct StyleEntry {
        string holderName;
        string designStyle;
        string emotionalTag;
        bool summoned;
        bool stamped;
    }

    StyleEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonStyle(string memory holderName, string memory designStyle, string memory emotionalTag) external onlyAdmin {
        entries.push(StyleEntry(holderName, designStyle, emotionalTag, true, false));
    }

    function stampStyle(uint256 index) external onlyAdmin {
        entries[index].stamped = true;
    }

    function getStyleEntry(uint256 index) external view returns (StyleEntry memory) {
        return entries[index];
    }
}
