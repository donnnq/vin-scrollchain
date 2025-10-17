// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MercyAnchoringFellowship {
    address public admin;

    struct MercyEntry {
        string corridor;
        string mercyTheme;
        string emotionalTag;
        bool initiated;
        bool reinforced;
    }

    MercyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateMercy(string memory corridor, string memory mercyTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(MercyEntry(corridor, mercyTheme, emotionalTag, true, false));
    }

    function reinforceMercy(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getMercy(uint256 index) external view returns (MercyEntry memory) {
        return entries[index];
    }
}
