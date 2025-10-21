// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DOJResolutionCountdownProtocol {
    address public admin;

    struct CountdownEntry {
        string caseName;
        uint256 startDate;
        uint256 deadlineDays; // Typically 60
        string emotionalTag;
        bool summoned;
        bool ticking;
        bool sealed;
    }

    CountdownEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCountdown(string memory caseName, uint256 startDate, uint256 deadlineDays, string memory emotionalTag) external onlyAdmin {
        entries.push(CountdownEntry(caseName, startDate, deadlineDays, emotionalTag, true, false, false));
    }

    function confirmTicking(uint256 index) external onlyAdmin {
        entries[index].ticking = true;
    }

    function sealCountdownEntry(uint256 index) external onlyAdmin {
        require(entries[index].ticking, "Must be ticking first");
        entries[index].sealed = true;
    }

    function getCountdownEntry(uint256 index) external view returns (CountdownEntry memory) {
        return entries[index];
    }
}
