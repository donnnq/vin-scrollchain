// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PHEUProspectsLedger {
    address public admin;

    struct ProspectEntry {
        string theme;
        string projectionYear;
        string strategicOutcome;
        string emotionalTag;
        bool summoned;
        bool forecasted;
        bool sealed;
    }

    ProspectEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProspect(string memory theme, string memory projectionYear, string memory strategicOutcome, string memory emotionalTag) external onlyAdmin {
        entries.push(ProspectEntry(theme, projectionYear, strategicOutcome, emotionalTag, true, false, false));
    }

    function confirmForecast(uint256 index) external onlyAdmin {
        entries[index].forecasted = true;
    }

    function sealProspectEntry(uint256 index) external onlyAdmin {
        require(entries[index].forecasted, "Must be forecasted first");
        entries[index].sealed = true;
    }

    function getProspectEntry(uint256 index) external view returns (ProspectEntry memory) {
        return entries[index];
    }
}
