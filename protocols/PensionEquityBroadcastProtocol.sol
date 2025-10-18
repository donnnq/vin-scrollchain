// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PensionEquityBroadcastProtocol {
    address public admin;

    struct PensionEntry {
        string country;
        string policyName;
        string emotionalTag;
        bool summoned;
        bool broadcasted;
        bool challenged;
    }

    PensionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPolicy(string memory country, string memory policyName, string memory emotionalTag) external onlyAdmin {
        entries.push(PensionEntry(country, policyName, emotionalTag, true, false, false));
    }

    function broadcastPolicy(uint256 index) external onlyAdmin {
        entries[index].broadcasted = true;
    }

    function challengePolicy(uint256 index) external onlyAdmin {
        entries[index].challenged = true;
    }

    function getPensionEntry(uint256 index) external view returns (PensionEntry memory) {
        return entries[index];
    }
}
