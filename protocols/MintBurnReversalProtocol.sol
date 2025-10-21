// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MintBurnReversalProtocol {
    address public admin;

    struct ReversalEntry {
        string token;
        uint256 amount;
        string reversalType; // "Mint Error", "Burn Mistake", "Emergency Override"
        string emotionalTag;
        bool summoned;
        bool reversed;
        bool sealed;
    }

    ReversalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReversal(string memory token, uint256 amount, string memory reversalType, string memory emotionalTag) external onlyAdmin {
        entries.push(ReversalEntry(token, amount, reversalType, emotionalTag, true, false, false));
    }

    function confirmReversal(uint256 index) external onlyAdmin {
        entries[index].reversed = true;
    }

    function sealReversalEntry(uint256 index) external onlyAdmin {
        require(entries[index].reversed, "Must be reversed first");
        entries[index].sealed = true;
    }

    function getReversalEntry(uint256 index) external view returns (ReversalEntry memory) {
        return entries[index];
    }
}
