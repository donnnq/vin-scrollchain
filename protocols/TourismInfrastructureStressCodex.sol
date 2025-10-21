// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TourismInfrastructureStressCodex {
    address public admin;

    struct StressEntry {
        string city;
        string stressType; // "Hotel Surge", "Transit Overflow", "Public Space Repurposing"
        string clause;
        string emotionalTag;
        bool summoned;
        bool logged;
        bool sealed;
    }

    StressEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonStressLog(string memory city, string memory stressType, string memory clause, string memory emotionalTag) external onlyAdmin {
        entries.push(StressEntry(city, stressType, clause, emotionalTag, true, false, false));
    }

    function confirmLogging(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function sealStressEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getStressEntry(uint256 index) external view returns (StressEntry memory) {
        return entries[index];
    }
}
