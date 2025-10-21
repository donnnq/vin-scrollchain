// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProtestBroadcastCodex {
    address public admin;

    struct ProtestEntry {
        string location;
        string protestType; // "Anti-Immigrant Policy", "Democracy Defense", "Civic Mobilization"
        string broadcastChannel;
        string emotionalTag;
        bool summoned;
        bool aired;
        bool sealed;
    }

    ProtestEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtest(string memory location, string memory protestType, string memory broadcastChannel, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtestEntry(location, protestType, broadcastChannel, emotionalTag, true, false, false));
    }

    function confirmAiring(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function sealProtestEntry(uint256 index) external onlyAdmin {
        require(entries[index].aired, "Must be aired first");
        entries[index].sealed = true;
    }

    function getProtestEntry(uint256 index) external view returns (ProtestEntry memory) {
        return entries[index];
    }
}
