// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GenZTribunalBroadcastProtocol {
    address public admin;

    struct TribunalEntry {
        string caseName;
        string region;
        string emotionalTag;
        bool summoned;
        bool scheduled;
        bool broadcasted;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTribunal(string memory caseName, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(caseName, region, emotionalTag, true, false, false));
    }

    function scheduleTribunal(uint256 index) external onlyAdmin {
        entries[index].scheduled = true;
    }

    function broadcastTribunal(uint256 index) external onlyAdmin {
        require(entries[index].scheduled, "Must be scheduled first");
        entries[index].broadcasted = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
