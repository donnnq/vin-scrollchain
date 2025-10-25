// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TradeToRetaliationIndex {
    address public steward;

    struct RetaliationEntry {
        string tradeRoute; // "China to US via Malaysia"
        string commodity; // "Rare Earths"
        string retaliationType; // "Tariff", "Ban", "Freeze"
        string triggerEvent; // "October 2025 export restriction"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    RetaliationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexRetaliation(string memory tradeRoute, string memory commodity, string memory retaliationType, string memory triggerEvent, string memory emotionalTag) external onlySteward {
        entries.push(RetaliationEntry(tradeRoute, commodity, retaliationType, triggerEvent, emotionalTag, true, false));
    }

    function sealRetaliationEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getRetaliationEntry(uint256 index) external view returns (RetaliationEntry memory) {
        return entries[index];
    }
}
